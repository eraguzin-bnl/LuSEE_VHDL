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

begin

    process
        variable vhdl_initial : BOOLEAN := TRUE;

    begin
        if ( vhdl_initial ) then
            -- Assert Reset
            NSYSRESET <= '1';
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
        bin_in                  => "0" & x"001",
        fft_ready_in            => ready,
        ch1_val_re              => ch1_val_re,
        ch1_val_im              => ch1_val_im,
        ch2_val_re              => ch2_val_re,
        ch2_val_im              => ch2_val_im,
        ch3_val_re              => ch1_val_re,
        ch3_val_im              => ch1_val_im,
        ch4_val_re              => ch2_val_re,
        ch4_val_im              => ch2_val_im,
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

end behavioral;
