--------------------------------------------------------------------------------
-- Company: Brookhaven National Laboratory
--
-- File: average_stage1.vhd
-- File history:
--      -: 3/17/2023: Initial
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- Custom average block to average output of deinterlacer block
--
-- Targeted device: <Family::PolarFire> <Die::MPF300T> <Package::FCG1152>
-- Author: Eric Raguzin
-- This block will take in the deinterlaced channel 1 and 2, real and imaginary values before or after being correlated with each other
-- This block can average up to 2^20 times
-- With an FFT coming out every ~40 us, that's ~40 seconds of averaging
-- The incoming average number indicates how many averages by a power of 2, can't do arbitrary number of averages in between
-- So a value of 1 is 2 averages, 4 is 16 averages, etc...
-- The notch option indicates whether this is a notch averaging block that does the straight average
-- Or the main averaging block, which will periodically get the notch filter values subracted from the running average
-- Generics in the top level spectrometer block can configure these options
-- Average block runs in a state machine architecture
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
entity average_stage1_signed is
    GENERIC(
        notch                             : boolean := false;
        navg_max                          : integer range 1 to 20 := 20;
        bins                              : integer := 2047
    );
    PORT( clk                             :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        P                                 :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        count                             :   IN    std_logic_vector(12 DOWNTO 0);  -- ufix13
        navg                              :   IN    std_logic_vector(9 DOWNTO 0);
        ready_in                          :   IN    std_logic;
        
        subtract                          :   IN    signed(31 DOWNTO 0);
        subtract_bin                      :   IN    std_logic_vector(12 DOWNTO 0);
        subtract_ready                    :   IN    std_logic;
        subtract_error                    :   OUT   std_logic;
        
        ce_out                            :   OUT   std_logic;
        outpk                             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32_E15a
        outbin                            :   OUT   std_logic_vector(10 DOWNTO 0);  -- ufix11
        ready_out                         :   OUT   std_logic
        );
end average_stage1_signed;

architecture architecture_average_stage1_signed of average_stage1_signed is
	signal read_address                   : std_logic_vector(11 downto 0);
    signal write_address                  : std_logic_vector(11 downto 0);
    signal write_en                       : std_logic;
    signal write_data                     : signed(51 downto 0);
    signal read_data                      : signed(51 downto 0);
    
    constant bins_s                       : std_logic_vector(12 downto 0) := std_logic_vector(to_unsigned(bins,13));
    signal index                          : unsigned(11 downto 0);
    signal count_s                        : std_logic_vector(12 downto 0);
    signal sum                            : signed(51 downto 0);
    signal first_time                     : std_logic;
    
    signal navg_count                     : unsigned(20 downto 0);
    signal navg_s                         : std_logic_vector(9 downto 0);
    signal navg_num                       : unsigned(20 downto 0);
    constant one_u                        : unsigned(20 downto 0) := to_unsigned(1, 21);
    
    signal shift_num                      : integer range 0 to navg_max;
    
    type state_type is (S_IDLE,
        S_READ_DATA,
        S_FINISH_DATA);
    signal state: state_type;
    
    component PF_TPSRAM_C0
    PORT ( 
        CLK                               :   IN    std_logic;
        R_ADDR                            :   IN    std_logic_vector(11 downto 0);
        W_EN                              :   IN    std_logic;
        W_ADDR                            :   IN    std_logic_vector(11 downto 0);
        W_DATA                            :   IN    signed(51 downto 0);
        R_DATA                            :   OUT   signed(51 downto 0)
        );
    end component;

begin
    --RAM block that holds the running sum of the values coming in before division
    --Incoming values are 32 bits. If they are averaged 2^20 times, then the max running sum can be 52 bits
    --RAM block has 52 bit data ports and 2048 bit depth for all the bins in the FFT
    --The block has the pipelining option turned on at the IP core level, so when a read address is clocked in
    --The read data comes out not the first cycle after, but the cycle after that
    average_accumulator : PF_TPSRAM_C0
    PORT MAP( 
        CLK      => clk,
        R_ADDR   => read_address,
        W_EN     => write_en,
        W_ADDR   => write_address,
        W_DATA   => write_data,
        R_DATA   => read_data
        );

    process (clk) 
        --Variable used for cleaner VHDL to not do it all in one line
        variable sum_shifted : signed(51 downto 0) := (others=>'0');
        begin
        if (rising_edge(clk)) then
            if (reset = '1') then
                write_en          <= '0';
                write_address     <= (others=>'0');
                write_data        <= (others=>'0');
                read_address      <= std_logic_vector(to_unsigned(0,12));
                index             <= to_unsigned(bins, index'length);
                count_s           <= (others=>'0');
                sum               <= (others=>'0');
                sum_shifted       := (others=>'0');
                first_time        <= '1';
                navg_count        <= to_unsigned(0, navg_count'length);
                outpk             <= x"00000000";
                outbin            <= "000" & x"00";
                ce_out            <= '0';
                ready_out         <= '0';
                subtract_error    <= '0';
                state <= S_IDLE;
            else
                navg_s <= navg;
                --Average input shifts a value of 0x1 a certain amount of bits as specified by the user
                --This is why the average ends up being a power of two
                navg_num <= shift_left(one_u, to_integer(unsigned(navg_s)));
            
                CASE state IS
                when S_IDLE =>	
                    --Before deinterlacer gives the ready signal, the bins are counting down from 4096
                    --This helps this average block prepare. Because the RAM block is pipelined,
                    --the read address can get ahead and always be requesting the current running sum that is
                    --3 indexes ahead of the actual data coming in (2 once you account for this command)
                    --which minimizes pipelining that needs to happen in this block
                    if (unsigned(count) < 2051) then
                        read_address    <= std_logic_vector(unsigned(count(11 downto 0)) - 3);
                    else
                        read_address    <= x"7FF";
                    end if;
                    write_en            <= '0';
                    write_address       <= (others=>'0');
                    write_data          <= (others=>'0');
                    --Tracks count variable, but needed at end of state machine
                    index               <= to_unsigned(bins, index'length);
                    sum                 <= (others=>'0');
                    
                    outpk               <= x"00000000";
                    outbin              <= "000" & x"00";
                    ce_out              <= '0';
                    ready_out           <= '0';
                    
                    if (ready_in = '1') then
                        if (count = bins_s) then
                            state                      <= S_READ_DATA;
                            read_address               <= std_logic_vector(index-3);
                            index                      <= unsigned(count(11 downto 0)) - 1;
                            count_s                    <= count;
                            -- Need to differentiate for first time because RAM could have junk values
                            -- On the last average of a cycle, the RAM is overwritten to 0
                            -- But still, just to be sure, don't add the RAM for the first time through
                            if (first_time = '1') then
                                --If this is a main averager, then the notch averager can flag that it's time to subtract
                                --bin by bin. This would be the first bin to start it.
                                if (subtract_ready = '1') then
                                    if (subtract_bin = count) then
                                        sum            <= resize(signed(P), 52) - subtract;
                                    else
                                        sum            <= resize(signed(P), 52);
                                        --Never seen this happen, but I want to track if it does
                                        subtract_error <= '1';
                                    end if;
                                else
                                    sum                <= resize(signed(P), 52);
                                end if;
                            else
                                --If there has already been a running sum in this loop, the read_address's timing
                                --means that the output of the RAM block is ready to feed right into this matching bin addition
                                if (subtract_ready = '1') then
                                    if (subtract_bin = count) then
                                        sum            <= resize(signed(P), 52) + read_data - subtract;
                                    else
                                        sum            <= resize(signed(P), 52) + read_data;
                                        subtract_error <= '1';
                                    end if;
                                else
                                    sum                <= resize(signed(P), 52) + read_data;
                                end if;
                            end if;
                        end if;
                    end if;
                    
                    --Because of the mathematical definition of the notch filtering we are doing
                    --If this is a notch averager, it actually averages half of the input average count
                    --So do a simple divide by 2 or not, and then have the final integer to divide by
                    if (notch) then
                        shift_num <= to_integer(shift_right(unsigned(navg), 1));
                    else
                        shift_num <= to_integer(unsigned(navg));
                    end if;

                when S_READ_DATA =>
                    --Begin writing sums or 0s back to RAM block
                    write_en <= '1';
                    
                    --Greater than in case navg_num changes in the middle of operation
                    if (navg_count >= navg_num - 1) then
                        --Write 0s into the RAM
                        write_data   <= to_signed(0, write_data'length);
                        --Divide the running average
                        sum_shifted  := shift_right(sum, shift_num);
                        --Digits are accounted for so resizing will never lose bits
                        outpk        <= std_logic_vector(resize(sum_shifted, 32));
                        outbin       <= count_s(10 downto 0);
                        ce_out       <= '1';
                        ready_out    <= '1';
                    else
                        --Still averaging, just pass right back into RAM, don't output anything from block
                        write_data   <= sum;
                        outpk        <= x"00000000";
                        outbin       <= "000" & x"00";
                        ce_out       <= '0';
                        ready_out    <= '0';
                    end if;
                    
                    --Same as above, if this is the first time through, we don't need to add the RAM output
                    --Also check if we should be subtracting the notch input or not
                    if (first_time = '1') then
                        if (subtract_ready = '1') then
                            if (subtract_bin = count) then
                                sum            <= resize(signed(P), 52) - subtract;
                            else
                                sum            <= resize(signed(P), 52);
                                subtract_error <= '1';
                            end if;
                        else
                            sum                <= resize(signed(P), 52);
                        end if;
                    else
                        if (subtract_ready = '1') then
                            if (subtract_bin = count) then
                                sum            <= resize(signed(P), 52) + read_data - subtract;
                            else
                                sum            <= resize(signed(P), 52) + read_data;
                                subtract_error <= '1';
                            end if;
                        else
                            sum                <= resize(signed(P), 52) + read_data;
                        end if;
                    end if;
                    
                    --Write address is pipelined and lags by 2 to account for the addition/subtraction and check for outputting
                    write_address  <= count_s(11 downto 0);
                    count_s        <= count;
                    
                    --Continue reading the few indexes ahead. But if it gets to the end, address 0 and below are not valid
                    --So avoid getting undefined outputs by manually holding the the read adress to a known value
                    if (index > 3) then
                        index <= unsigned(count(11 downto 0)) - 1;
                        read_address    <= std_logic_vector(index-3);
                    elsif (index > 2) then
                        index <= unsigned(count(11 downto 0)) - 1;
                        read_address    <= x"7FF";
                    else
                        state <= S_FINISH_DATA;
                        read_address    <= x"7FF";
                    end if;
                    
                when S_FINISH_DATA =>
                    write_en <= '1';
                    --Last bin to write to the RAM or to the output of the block.
                    --Where appropriate add that we have done another running average sum
                    --Or reset for the next batch to the be the first of another average set
                    if (navg_count >= navg_num - 1) then
                        sum_shifted      := shift_right(sum, shift_num);
                        outpk            <= std_logic_vector(sum_shifted(51) & sum_shifted(30 downto 0));
                        outbin           <= count_s(10 downto 0);
                        ce_out           <= '1';
                        ready_out        <= '1';
                        write_data       <= to_signed(0, write_data'length);
                        write_address    <= count_s(11 downto 0);
                        
                        navg_count       <= to_unsigned(0, navg_count'length);
                        first_time       <= '1';
                    else
                        outpk            <= x"00000000";
                        outbin           <= "000" & x"00";
                        ce_out           <= '0';
                        ready_out        <= '0';
                        write_data       <= sum;
                        write_address    <= count_s(11 downto 0);
                        
                        navg_count       <= navg_count + 1;
                        first_time       <= '0';
                    end if;
                    
                    state <= S_IDLE;
                when others =>		
					state <= S_IDLE;		
			    end case; 
            end if;
        end if;
    end process;
end architecture_average_stage1_signed;