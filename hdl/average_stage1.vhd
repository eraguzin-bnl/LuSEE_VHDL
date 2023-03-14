--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: average_stage1.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::PolarFire> <Die::MPF300T> <Package::FCG1152>
-- Author: <Name>
--
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity average_stage1 is
    GENERIC(
        navg2                             : integer range 1 to 16 := 8;
        bins                              : integer := 2047
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
	signal read_address                   : std_logic_vector(12 downto 0);
    signal write_address                  : std_logic_vector(12 downto 0);
    signal write_en                       : std_logic;
    signal write_data                     : unsigned(41 downto 0);
    signal read_data                      : unsigned(41 downto 0);
    
    constant bins_s                       : std_logic_vector(11 downto 0) := std_logic_vector(to_unsigned(bins,12));
    signal index                          : unsigned(11 DOWNTO 0);
    signal count_s                        : std_logic_vector(11 downto 0);
    signal P_s                            : std_logic_vector(31 downto 0);
    signal sum                            : std_logic_vector(42 downto 0);
    signal first_time                     : std_logic;
    
    type state_type is (S_IDLE,
        S_READ_DATA,
        S_FINISH_DATA);
    signal state: state_type;

begin

    average_accumulator : entity work.PF_TPSRAM_C0
    PORT MAP( 
        CLK => clk,
        R_DATA_ARST_N => not reset,
        R_DATA_SRST_N => not reset,
        R_ADDR => read_address,
        W_EN => write_en,
        W_ADDR => write_address,
        W_DATA => write_data,
        R_DATA => read_data
        );

    process (clk) begin
        if (rising_edge(clk)) then
            if (reset = '1') then
                read_data <= (others=>'0');
                write_en <= '0';
                write_address <= (others=>'0');
                write_data <= (others=>'0');
                read_address <= bins_s;
                error_flag <= '0';
                index <= to_unsigned(bins-1, index'length);
                P_s <= (others=>'0');
                sum <= (others=>'0');
                first_time <= '0';
            else
                CASE state IS
                
                when S_IDLE =>	
                    read_address <= bins_s;
                    write_en <= '0';
                    write_address <= (others=>'0');
                    write_data <= (others=>'0');
                    --Should be a cycle ahead
                    error_flag <= '0';
                    index <= to_unsigned(bins-1, index'length);
                    P_s <= (others=>'0');
                    sum <= (others=>'0');
                    first_time <= '0';
                    
                    if (ready_in = '1') then
                        if (count = bins_s) then
                            state <= S_READ_DATA;
                            read_address <= std_logic_vector(index);
                            P_s <= P;
                        else
                            error_flag <= '1';
                        end if;
                    end if;

                when S_READ_DATA =>
                    read_data <= (others=>'0');
                    write_en <= '1';
                    write_address <= (others=>'0');
                    write_data <= (others=>'0');
                    read_address <= bins_s;
                    
                when others =>		
					state <= S_idle;		
			    end case; 
            end if;
        end if;
    end process;
end architecture_average_stage1;