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

entity average_stage1 is
    GENERIC(
        navg_max                          : integer range 1 to 20 := 20;
        bins                              : integer := 2046
    );
    PORT( clk                             :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        P                                 :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        count                             :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix13
        navg                              :   IN    std_logic_vector(9 DOWNTO 0);
        ready_in                          :   IN    std_logic;
        ce_out                            :   OUT   std_logic;
        error_flag                        :   OUT   std_logic;
        outpk                             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32_E15a
        outbin                            :   OUT   std_logic_vector(10 DOWNTO 0);  -- ufix11
        ready_out                         :   OUT   std_logic
        );
end average_stage1;

architecture architecture_average_stage1 of average_stage1 is
	signal read_address                   : std_logic_vector(11 downto 0);
    signal write_address                  : std_logic_vector(11 downto 0);
    signal write_en                       : std_logic;
    signal write_data                     : unsigned(51 downto 0);
    signal read_data                      : unsigned(51 downto 0);
    
    constant bins_s                       : std_logic_vector(11 downto 0) := std_logic_vector(to_unsigned(bins,12));
    signal index                          : unsigned(11 downto 0);
    signal count_s                        : std_logic_vector(11 downto 0);
    signal sum                            : unsigned(51 downto 0);
    signal first_time                     : std_logic;
    
    signal navg_count                     : unsigned(20 downto 0);
    signal navg_s                         : std_logic_vector(9 downto 0);
    signal navg_num                       : unsigned(20 downto 0);
    --constant one_s                        : std_logic_vector(0 downto 0) := "1";
    constant one_u                        : unsigned(20 downto 0) := to_unsigned(1, 21);
    
    signal index_top                      : integer range 31 to 31 + navg_max;
    signal index_bottom                   : integer range 0 to navg_max;
    
    type state_type is (S_IDLE,
        S_READ_DATA,
        S_FINISH_DATA);
    signal state: state_type;

begin

    average_accumulator : entity work.PF_TPSRAM_C0
    PORT MAP( 
        CLK => clk,
        R_ADDR => read_address,
        W_EN => write_en,
        W_ADDR => write_address,
        W_DATA => write_data,
        R_DATA => read_data
        );

    process (clk) begin
        if (rising_edge(clk)) then
            if (reset = '1') then
                write_en <= '0';
                write_address <= (others=>'0');
                write_data <= (others=>'0');
                read_address <= std_logic_vector(to_unsigned(bins-4,12));
                error_flag <= '0';
                index <= to_unsigned(bins-1, index'length);
                count_s <= (others=>'0');
                sum <= (others=>'0');
                first_time <= '1';
                navg_count <= to_unsigned(0, navg_count'length);
                outpk <= x"00000000";
                outbin <= "000" & x"00";
                ce_out <= '0';
                ready_out <= '0';
            else
            
                navg_s <= navg;
                navg_num <= shift_left(one_u, to_integer(unsigned(navg_s)));
            
                CASE state IS
                
                when S_IDLE =>	
                    if (unsigned(count) < 2050) then
                        read_address <= std_logic_vector(unsigned(count) - 3);
                    else
                        read_address <= x"000";
                    end if;
                    write_en <= '0';
                    write_address <= (others=>'0');
                    write_data <= (others=>'0');
                    --Should be a cycle ahead
                    error_flag <= '0';
                    index <= to_unsigned(bins-2, index'length);
                    sum <= (others=>'0');
                    
                    outpk <= x"00000000";
                    outbin <= "000" & x"00";
                    ce_out <= '0';
                    ready_out <= '0';
                    
                    if (ready_in = '1') then
                        if (count = bins_s) then
                            state <= S_READ_DATA;
                            read_address <= std_logic_vector(index-1);
                            index <= unsigned(count) - 1;
                            count_s <= count;
                            if (first_time = '1') then
                                sum <= x"00000" & unsigned(P);
                            else
                                sum <= unsigned(P) + read_data;
                            end if;
                        else
                            error_flag <= '1';
                        end if;
                    end if;
                    
                    index_top <= integer(31) + to_integer(unsigned(navg));
                    index_bottom <= integer(0) + to_integer(unsigned(navg));

                when S_READ_DATA =>
                    write_en <= '1';
                    
                    if (navg_count >= navg_num - 1) then
                        write_data <= to_unsigned(0, write_data'length);
                        outpk <= std_logic_vector(sum(index_top downto index_bottom));
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
                        sum <= x"00000" & unsigned(P);
                    else
                        sum <= unsigned(P) + read_data;
                    end if;
                    
                    write_address <= count_s;
                    count_s <= count;
                    
                    if (index > 2) then
                        index <= unsigned(count) - 1;
                        read_address <= std_logic_vector(index-3);
                    elsif (index > 0) then
                        index <= unsigned(count) - 1;
                        read_address <= x"7FD";
                    else
                        state <= S_FINISH_DATA;
                        read_address <= x"7FD";
                    end if;
                    
                when S_FINISH_DATA =>
                    write_en <= '1';
                    
                    if (navg_count >= navg_num - 1) then
                        outpk <= std_logic_vector(sum(index_top downto index_bottom));
                        outbin <= count_s(10 downto 0);
                        ce_out <= '1';
                        ready_out <= '1';
                        write_data <= to_unsigned(0, write_data'length);
                        write_address <= count_s;
                        
                        navg_count <= to_unsigned(0, navg_count'length);
                        first_time <= '1';
                    else
                        outpk <= x"00000000";
                        outbin <= "000" & x"00";
                        ce_out <= '0';
                        ready_out <= '0';
                        write_data <= sum;
                        write_address <= count_s;
                        
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
end architecture_average_stage1;