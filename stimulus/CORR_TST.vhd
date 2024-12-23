----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Wed Mar 22 20:02:50 2023
-- Testbench Template
-- This is a basic testbench that instantiates your design with basic 
-- clock and reset pins connected.  If your design has special
-- clock/reset or testbench driver requirements then you should 
-- copy this file and modify it. 
----------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: CORR_TST.vhd
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


library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.ALL;
USE work.spectrometer_fixpt_pkg.ALL;

--For reading file
LIBRARY STD;
USE STD.textio.ALL;

entity CORR_TST is
end CORR_TST;

architecture behavioral of CORR_TST is

    constant SYSCLK_PERIOD : time := 100 ns; -- 10MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';
    
    signal ready     : std_logic := '0';
    
    SIGNAL bin_in_s                             :      std_logic_vector(12 DOWNTO 0);  -- ufix13
    SIGNAL bin_delay_s                          :      std_logic_vector(12 DOWNTO 0);  -- ufix13
    SIGNAL fft_delay_s                          :      std_logic;
    
    SIGNAL A1                                : std_logic_vector(31 DOWNTO 0);  -- ufix32_E15
    SIGNAL A2                                : std_logic_vector(31 DOWNTO 0);  -- ufix32_E15
    SIGNAL A3                                : std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL A4                                : std_logic_vector(31 DOWNTO 0);  -- ufix32_E15
    SIGNAL X12R                              : std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL X12I                              : std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
    SIGNAL X13R                              : std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL X13I                              : std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
    SIGNAL X14R                              : std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL X14I                              : std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
    SIGNAL X23R                              : std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL X23I                              : std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
    SIGNAL X24R                              : std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL X24I                              : std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
    SIGNAL X34R                              : std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL X34I                              : std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
    
    SIGNAL ch1_val_re                        :      std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
    SIGNAL ch1_val_im                        :      std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
    SIGNAL ch2_val_re                        :      std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
    SIGNAL ch2_val_im                        :      std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
    
    SIGNAL  corr_array                       : vector_of_std_logic_vector5(15 downto 0);
    SIGNAL notch_array                       : vector_of_std_logic_vector5(15 downto 0);

begin

    process
        variable vhdl_initial : BOOLEAN := TRUE;

    begin
        if ( vhdl_initial ) then
            -- Assert Reset
            NSYSRESET <= '1';
            corr_array(0)      <= "11111";
            corr_array(1)      <= "01000";
            corr_array(2)      <= "00000";
            corr_array(3)      <= "00000";
            corr_array(4)      <= "00000";
            corr_array(5)      <= "00000";
            corr_array(6)      <= "00000";
            corr_array(7)      <= "00000";
            corr_array(8)      <= "00000";
            corr_array(9)      <= "00000";
            corr_array(10)      <= "00000";
            corr_array(11)      <= "00000";
            corr_array(12)      <= "00000";
            corr_array(13)      <= "00000";
            corr_array(14)      <= "00000";
            corr_array(15)      <= "00000";
            
            notch_array(0)      <= "11111";
            notch_array(1)      <= "01000";
            notch_array(2)      <= "00000";
            notch_array(3)      <= "00000";
            notch_array(4)      <= "00000";
            notch_array(5)      <= "00000";
            notch_array(6)      <= "00000";
            notch_array(7)      <= "00000";
            notch_array(8)      <= "00000";
            notch_array(9)      <= "00000";
            notch_array(10)      <= "00000";
            notch_array(11)      <= "00000";
            notch_array(12)      <= "00000";
            notch_array(13)      <= "00000";
            notch_array(14)      <= "00000";
            notch_array(15)      <= "00000";
            wait for ( SYSCLK_PERIOD * 10 );
            
            NSYSRESET <= '0';
            wait;
        end if;
    end process;

    -- Clock Driver
    SYSCLK <= not SYSCLK after (SYSCLK_PERIOD / 2.0 );

    -- Data source for adc
      c_re_fileread: PROCESS
        FILE fp: TEXT;
        VARIABLE file_status: std_logic := '0';
        VARIABLE l: LINE;
        VARIABLE read_data: std_logic_vector(63 DOWNTO 0);
        VARIABLE ch1_val_re_v: std_logic_vector(31 DOWNTO 0);
        VARIABLE ch1_val_im_v: std_logic_vector(31 DOWNTO 0);
        VARIABLE ch2_val_re_v: std_logic_vector(31 DOWNTO 0);
        VARIABLE ch2_val_im_v: std_logic_vector(31 DOWNTO 0);

      BEGIN
      wait for SYSCLK_PERIOD;
        IF (file_status = '0') THEN
            report "Opening file";
            file_open(fp, "mult_data.txt", read_mode);
            file_status := '1';
        END IF;
        
        IF NSYSRESET = '0' AND NOT ENDFILE(fp) THEN
        --report "reading line ";
            ready <= '1';
            bin_in_s <= std_logic_vector(to_unsigned(to_integer(unsigned(bin_in_s)) + 1, 13));
          READLINE(fp, l);
          HREAD(l, read_data);
          ch1_val_re_v := read_data(63 downto 32);
          ch1_val_im_v := read_data(31 downto 0);
          ch1_val_re <= ch1_val_re_v;
          ch1_val_im <= ch1_val_im_v;
          ch2_val_re <= ch1_val_re_v;
          ch2_val_im <= ch1_val_im_v;
          --report "value is " & to_hex_string(read_data);
          --report "sample1v is " & to_hex_string(sample1_v);
          --report "sample2v is " & to_hex_string(sample2_v);
        END IF;
        
        IF ENDFILE(fp) THEN
          report "VHDL --> Sample input file ended, restarting";
          file_close(fp);
          file_status := '0';
        END IF;
        
      END PROCESS c_re_fileread;

    -- Instantiate Unit Under Test:  correlate_fixpt
    correlate_fixpt_inst : entity work.correlate_fixpt
    generic map(
      size => 32)
    PORT map
    (   clk                     => SYSCLK,
        reset                   => NSYSRESET,
        bin_in                  => bin_in_s,
        fft_ready_in            => ready,
        ch1_val_re              => ch1_val_re,
        ch1_val_im              => ch1_val_im,
        ch2_val_re              => ch2_val_re,
        ch2_val_im              => ch2_val_im,
        ch3_val_re              => ch1_val_re,
        ch3_val_im              => ch1_val_im,
        ch4_val_re              => ch2_val_re,
        ch4_val_im              => ch2_val_im,
        index_array             => corr_array,
        A1                      => A1,
        A2                      => A2,
        A3                      => A3,
        A4                      => A4,
        X12R                    => X12R,
        X12I                    => X12I,
        X13R                    => X13R,
        X13I                    => X13I,
        X14R                    => X14R,
        X14I                    => X14I,
        X23R                    => X23R,
        X23I                    => X23I,
        X24R                    => X24R,
        X24I                    => X24I,
        X34R                    => X34R,
        X34I                    => X34I,
        bin_out                 => bin_delay_s,
        fft_ready_out           => fft_delay_s
        );
        
    subtract : entity work.correlate_operation
    generic map(
        size => 32,
        operation => '0')
    port map(
        -- Inputs
        clk => SYSCLK,
        rstb => NSYSRESET,
        m1_1 => ch1_val_re,
        m1_2 => ch1_val_im,
        m2_1 => ch2_val_re,
        m2_2 => ch2_val_im,
        index => "000000",

        --Valid
        valid_in => ready,
        valid_out => open,

        -- Outputs
        error => open,
        o_m => open
    );
    
    add : entity work.correlate_operation
    generic map(
        size => 32,
        operation => '1')
    port map(
        -- Inputs
        clk => SYSCLK,
        rstb => NSYSRESET,
        m1_1 => ch1_val_re,
        m1_2 => ch1_val_im,
        m2_1 => ch2_val_re,
        m2_2 => ch2_val_im,
        index => "100001",

        --Valid
        valid_in => ready,
        valid_out => open,

        -- Outputs
        error => open,
        o_m => open
    );

end behavioral;
