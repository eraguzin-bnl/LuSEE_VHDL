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
        bins                              : integer := 2048
    );
    PORT( clk                             :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        ch1_val_re                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        ch1_val_im                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        ch2_val_re                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        ch2_val_im                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        count                             :   IN    std_logic_vector(12 DOWNTO 0);  -- ufix13
        navg                              :   IN    std_logic_vector(9 DOWNTO 0);
        ready_in                          :   IN    std_logic;
        ce_out                            :   OUT   std_logic;
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
    
    signal ar                             : signed(31 downto 0);
    signal ai                             : signed(31 downto 0);
    signal br                             : signed(31 downto 0);
    signal bi                             : signed(31 downto 0);
    signal ch2_im_expanded                : signed(32 downto 0);
    signal ch2_im_negative                : signed(32 downto 0);
    
    --signal real_product                   : signed(63 downto 0);
    --signal im_product                     : signed(63 downto 0);
    signal real_expanded                  : signed(64 downto 0);
    signal im_expanded                    : signed(64 downto 0);
    signal re_im_difference               : signed(64 downto 0);
    signal difference                     : unsigned(31 downto 0);
    
    signal bin_counter                    : integer range 0 to 2048;
    signal first_run                      : std_logic;
    
    signal count_s1                       : std_logic_vector(12 downto 0);
    signal count_s2                       : std_logic_vector(12 downto 0);
    signal count_s3                       : std_logic_vector(12 downto 0);
    signal count_s4                       : std_logic_vector(12 downto 0);
    signal count_s5                       : std_logic_vector(12 downto 0);
    
    signal w_en_s1                        : std_logic;
    signal w_en_s2                        : std_logic;
    signal w_en_s3                        : std_logic;
    signal w_en_s4                        : std_logic;
    signal w_en_s5                        : std_logic;

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
    
    -- Combinational Logic
    ch2_im_expanded <= resize(signed(ch2_val_im), 33);
    ch2_im_negative <= - (ch2_im_expanded);

    process (clk) begin
        if (rising_edge(clk)) then
            if (reset = '1') then
                ar <= (others=>'0');
                ai <= (others=>'0');
                br <= (others=>'0');
                bi <= (others=>'0');
                
                ch2_im_expanded <= (others=>'0');
                ch2_im_negative <= (others=>'0');
                
                real_expanded <= (others=>'0');
                im_expanded <= (others=>'0');
                re_im_difference <= (others=>'0');
                difference <= (others=>'0');
                write_data <= (others=>'0');
            else
                if (ready_in = '1') then
                    ar <= signed(ch1_val_re);
                    ai <= signed(ch1_val_im);
                    br <= signed(ch2_val_re);
                    bi <= ch2_im_negative(31 DOWNTO 0);
                    
                    --real_product <= ar * br;
                    real_expanded <= resize(ar * br, 65);
                    --im_product <= ai * bi;
                    im_expanded <= resize(ai * bi, 65);
                    
                    re_im_difference <= real_expanded - im_expanded;
                    
                    difference <= unsigned(re_im_difference(60 DOWNTO 29));
                    
                    if (first_run = '0') then
                        write_data <= difference + read_data;
                    else
                        write_data <= difference;
                    end if;
                    
                end if;
            end if;
        end if;
    end process;
    
    process (clk) begin
        if (rising_edge(clk)) then
            if (reset = '1') then
                count_s1 <= (others=>'0');
                count_s2 <= (others=>'0');
                count_s3 <= (others=>'0');
                count_s4 <= (others=>'0');
                count_s5 <= (others=>'0');
                
                read_address <= (others=>'0');
                write_address <= (others=>'0');
                
                w_en_s1 <= '0';
                w_en_s2 <= '0';
                w_en_s3 <= '0';
                w_en_s4 <= '0';
                w_en_s5 <= '0';
            else
                if (ready_in = '1') then
                    count_s1 <= count;
                    count_s2 <= count_s1;
                    count_s3 <= count_s2;
                    count_s4 <= count_s3;
                    count_s5 <= count_s4;
                    
                    read_address <= count_s4;
                    write_address <= count_s5;
                    
                    w_en_s1 <= '1';
                    w_en_s2 <= w_en_s1;
                    w_en_s3 <= w_en_s2;
                    w_en_s4 <= w_en_s3;
                    w_en_s5 <= w_en_s4;
                    
                end if;
            end if;
        end if;
    end process;
    
    process (clk) begin
        if (rising_edge(clk)) then
            if (reset = '1') then
                bin_counter <= 0;
                first_run <= '1';
            else
                if (bin_counter = 2048) then
                    bin_counter <= 0;
                    first_run <= '0';
                else
                    bin_counter <= bin_counter + 1;
                end if;
            end if;
        end if;
    end process;
                    
end architecture_average_stage1;
