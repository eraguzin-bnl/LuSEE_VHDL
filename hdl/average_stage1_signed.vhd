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
--
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
    --constant one_s                        : std_logic_vector(0 downto 0) := "1";
    constant one_u                        : unsigned(20 downto 0) := to_unsigned(1, 21);
    
    --signal index_top                      : integer range 31 to 31 + navg_max;
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

    average_accumulator : PF_TPSRAM_C0
    PORT MAP( 
        CLK => clk,
        R_ADDR => read_address,
        W_EN => write_en,
        W_ADDR => write_address,
        W_DATA => write_data,
        R_DATA => read_data
        );

    process (clk) 
        variable sum_shifted : signed(51 downto 0) := (others=>'0');
        begin
        if (rising_edge(clk)) then
            if (reset = '1') then
                write_en <= '0';
                write_address <= (others=>'0');
                write_data <= (others=>'0');
                read_address <= std_logic_vector(to_unsigned(bins-4,12));
                index <= to_unsigned(bins, index'length);
                count_s <= (others=>'0');
                sum <= (others=>'0');
                sum_shifted := (others=>'0');
                first_time <= '1';
                navg_count <= to_unsigned(0, navg_count'length);
                outpk <= x"00000000";
                outbin <= "000" & x"00";
                ce_out <= '0';
                ready_out <= '0';
                subtract_error <= '0';
            else
            
                navg_s <= navg;
                navg_num <= shift_left(one_u, to_integer(unsigned(navg_s)));
            
                CASE state IS
                
                when S_IDLE =>	
                    if (unsigned(count) < 2051) then
                        read_address <= std_logic_vector(unsigned(count(11 downto 0)) - 3);
                    else
                        read_address <= x"7FF";
                    end if;
                    write_en <= '0';
                    write_address <= (others=>'0');
                    write_data <= (others=>'0');
                    --Should be a cycle ahead
                    index <= to_unsigned(bins, index'length);
                    sum <= (others=>'0');
                    
                    outpk <= x"00000000";
                    outbin <= "000" & x"00";
                    ce_out <= '0';
                    ready_out <= '0';
                    
                    if (ready_in = '1') then
                        if (count = bins_s) then
                            state <= S_READ_DATA;
                            read_address <= std_logic_vector(index-1);
                            index <= unsigned(count(11 downto 0)) - 1;
                            count_s <= count;
                            -- Need to differentiate for first time because RAM could have junk values
                            -- For each subsequent loop, the RAM should already have zeros after the last cycle
                            if (first_time = '1') then
                                if (subtract_ready = '1') then
                                    if (subtract_bin = count) then
                                        sum <= resize(signed(P), 52) - subtract;
                                    else
                                        sum <= resize(signed(P), 52);
                                        subtract_error <= '1';
                                    end if;
                                else
                                    sum <= resize(signed(P), 52);
                                end if;
                            else
                                if (subtract_ready = '1') then
                                    if (subtract_bin = count) then
                                        sum <= resize(signed(P), 52) + read_data - subtract;
                                    else
                                        sum <= resize(signed(P), 52) + read_data;
                                        subtract_error <= '1';
                                    end if;
                                else
                                    sum <= resize(signed(P), 52) + read_data;
                                end if;
                            end if;
                        end if;
                    end if;
                    
                    if (notch) then
                        --index_top <= integer(31) + to_integer(shift_right(unsigned(navg), 1));
                        shift_num <= integer(0) + to_integer(shift_right(unsigned(navg), 1));
                    else
                        --index_top <= integer(31) + to_integer(unsigned(navg));
                        shift_num <= integer(0) + to_integer(unsigned(navg));
                    end if;

                when S_READ_DATA =>
                    write_en <= '1';
                    
                    if (navg_count >= navg_num - 1) then
                        write_data <= to_signed(0, write_data'length);
                        sum_shifted := shift_right(sum, shift_num);
                        outpk <= std_logic_vector(sum_shifted(51) & sum_shifted(30 downto 0));
                        outbin <= count_s(10 downto 0);
                        ce_out <= '1';
                        ready_out <= '1';
                    else
                        write_data <= sum;
                        outpk <= x"00000000";
                        outbin <= "000" & x"00";
                        ce_out <= '0';
                        ready_out <= '0';
                    end if;
                    
                    if (first_time = '1') then
                        if (subtract_ready = '1') then
                            if (subtract_bin = count) then
                                sum <= resize(signed(P), 52) - subtract;
                            else
                                sum <= resize(signed(P), 52);
                                subtract_error <= '1';
                            end if;
                        else
                            sum <= resize(signed(P), 52);
                        end if;
                    else
                        if (subtract_ready = '1') then
                            if (subtract_bin = count) then
                                sum <= resize(signed(P), 52) + read_data - subtract;
                            else
                                sum <= resize(signed(P), 52) + read_data;
                                subtract_error <= '1';
                            end if;
                        else
                            sum <= resize(signed(P), 52) + read_data;
                        end if;
                    end if;
                    
                    write_address <= count_s(11 downto 0);
                    count_s <= count;
                    
                    if (index > 2) then
                        index <= unsigned(count(11 downto 0)) - 1;
                        read_address <= std_logic_vector(index-3);
                    elsif (index > 1) then
                        index <= unsigned(count(11 downto 0)) - 1;
                        read_address <= x"7FF";
                    else
                        state <= S_FINISH_DATA;
                        read_address <= x"7FF";
                    end if;
                    
                when S_FINISH_DATA =>
                    write_en <= '1';
                    
                    if (navg_count >= navg_num - 1) then
                        sum_shifted := shift_right(sum, shift_num);
                        outpk <= std_logic_vector(sum_shifted(51) & sum_shifted(30 downto 0));
                        outbin <= count_s(10 downto 0);
                        ce_out <= '1';
                        ready_out <= '1';
                        write_data <= to_signed(0, write_data'length);
                        write_address <= count_s(11 downto 0);
                        
                        navg_count <= to_unsigned(0, navg_count'length);
                        first_time <= '1';
                    else
                        outpk <= x"00000000";
                        outbin <= "000" & x"00";
                        ce_out <= '0';
                        ready_out <= '0';
                        write_data <= sum;
                        write_address <= count_s(11 downto 0);
                        
                        navg_count <= navg_count + 1;
                        first_time <= '0';
                    end if;
                    
                    state <= S_IDLE;
                    
                when others =>		
					state <= S_IDLE;		
			    end case; 
            end if;
        end if;
    end process;
end architecture_average_stage1_signed;