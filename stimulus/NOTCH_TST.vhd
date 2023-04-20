----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Thu Apr 20 16:13:37 2023
-- Testbench Template
-- This is a basic testbench that instantiates your design with basic 
-- clock and reset pins connected.  If your design has special
-- clock/reset or testbench driver requirements then you should 
-- copy this file and modify it. 
----------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: NOTCH_TST.vhd
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

entity NOTCH_TST is
end NOTCH_TST;

architecture behavioral of NOTCH_TST is

    constant SYSCLK_PERIOD : time := 10 ns; -- 100MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';
    
    SIGNAL sample1             : std_logic_vector(13 DOWNTO 0);
    SIGNAL sample2             : std_logic_vector(13 DOWNTO 0);
    
    signal Navg_notch          : std_logic_vector(10 downto 0) := "00" & x"01";
    signal Navg_main           : std_logic_vector(10 downto 0) := "00" & x"01";
    
    SIGNAL start_bin           : std_logic := '0';
    SIGNAL bin                 : unsigned(12 DOWNTO 0) := to_unsigned(1, 13);
    
    SIGNAL ch1_notch_real                       :   std_logic_vector(31 DOWNTO 0);
    SIGNAL ch1_notch_real_outbin                :   std_logic_vector(10 DOWNTO 0);  -- ufix11
    SIGNAL ch1_notch_real_ready                 :   std_logic;
    SIGNAL ch1_notch_real_ce                    :   std_logic;

    SIGNAL ch1_notch_imag                       :   std_logic_vector(31 DOWNTO 0);
    SIGNAL ch1_notch_imag_outbin                :   std_logic_vector(10 DOWNTO 0);  -- ufix11
    SIGNAL ch1_notch_imag_ready                 :   std_logic;
    SIGNAL ch1_notch_imag_ce                    :   std_logic;

    SIGNAL ch2_notch_real                       :   std_logic_vector(31 DOWNTO 0);
    SIGNAL ch2_notch_real_outbin                :   std_logic_vector(10 DOWNTO 0);  -- ufix11
    SIGNAL ch2_notch_real_ready                 :   std_logic;
    SIGNAL ch2_notch_real_ce                    :   std_logic;

    SIGNAL ch2_notch_imag                       :   std_logic_vector(31 DOWNTO 0);
    SIGNAL ch2_notch_imag_outbin                :   std_logic_vector(10 DOWNTO 0);  -- ufix11
    SIGNAL ch2_notch_imag_ready                 :   std_logic;
    SIGNAL ch2_notch_imag_ce                    :   std_logic;

    SIGNAL corr_array                           : vector_of_std_logic_vector6(9 downto 0);
    SIGNAL notch_array                          : vector_of_std_logic_vector6(9 downto 0);
    
    SIGNAL A1                                   :   std_logic_vector(31 DOWNTO 0);  -- ufix32_E15
    SIGNAL A2                                   :   std_logic_vector(31 DOWNTO 0);  -- ufix32_E15
    SIGNAL A3                                   :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL A4                                   :   std_logic_vector(31 DOWNTO 0);  -- ufix32_E15
    SIGNAL X12R                                 :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL X12I                                 :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
    SIGNAL X13R                                 :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL X13I                                 :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
    SIGNAL X14R                                 :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL X14I                                 :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
    SIGNAL X23R                                 :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL X23I                                 :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
    SIGNAL X24R                                 :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL X24I                                 :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
    SIGNAL X34R                                 :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL X34I                                 :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E14

    SIGNAL A1_s                                 :   std_logic_vector(31 DOWNTO 0);  -- ufix32_E15
    SIGNAL A2_s                                 :   std_logic_vector(31 DOWNTO 0);  -- ufix32_E15
    SIGNAL A3_s                                 :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL A4_s                                 :   std_logic_vector(31 DOWNTO 0);  -- ufix32_E15
    SIGNAL X12R_s                               :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL X12I_s                               :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
    SIGNAL X13R_s                               :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL X13I_s                               :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
    SIGNAL X14R_s                               :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL X14I_s                               :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
    SIGNAL X23R_s                               :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL X23I_s                               :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
    SIGNAL X24R_s                               :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL X24I_s                               :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
    SIGNAL X34R_s                               :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL X34I_s                               :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E14

    SIGNAL A1_notch                             :   std_logic_vector(31 DOWNTO 0);  -- ufix32_E15
    SIGNAL A2_notch                             :   std_logic_vector(31 DOWNTO 0);  -- ufix32_E15
    SIGNAL A3_notch                             :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL A4_notch                             :   std_logic_vector(31 DOWNTO 0);  -- ufix32_E15
    SIGNAL X12R_notch                           :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL X12I_notch                           :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
    SIGNAL X13R_notch                           :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL X13I_notch                           :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
    SIGNAL X14R_notch                           :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL X14I_notch                           :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
    SIGNAL X23R_notch                           :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL X23I_notch                           :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
    SIGNAL X24R_notch                           :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL X24I_notch                           :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
    SIGNAL X34R_notch                           :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
    SIGNAL X34I_notch                           :   std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
    
    SIGNAL bin_s1                               :   std_logic_vector(12 DOWNTO 0);  -- ufix13
    SIGNAL fft_ready_s1                         :   std_logic;
    SIGNAL bin_delay                            :   std_logic_vector(12 DOWNTO 0);  -- ufix13
    SIGNAL fft_ready_delay                      :   std_logic;
    SIGNAL bin_delay_s                          :   std_logic_vector(12 DOWNTO 0);  -- ufix13
    SIGNAL fft_delay_s                          :   std_logic;
 
begin

    process
        variable vhdl_initial : BOOLEAN := TRUE;
        

    begin
        if ( vhdl_initial ) then
            -- Assert Reset
            NSYSRESET <= '0';
            corr_array(0)      <= "011101";
            corr_array(1)      <= "001000";
            corr_array(2)      <= "000000";
            corr_array(3)      <= "000000";
            corr_array(4)      <= "000000";
            corr_array(5)      <= "000000";
            corr_array(6)      <= "000000";
            corr_array(7)      <= "000000";
            corr_array(8)      <= "000000";
            corr_array(9)      <= "000000";
            
            notch_array(0)      <= "011101";
            notch_array(1)      <= "001000";
            notch_array(2)      <= "000000";
            notch_array(3)      <= "000000";
            notch_array(4)      <= "000000";
            notch_array(5)      <= "000000";
            notch_array(6)      <= "000000";
            notch_array(7)      <= "000000";
            notch_array(8)      <= "000000";
            notch_array(9)      <= "000000";
            
            wait for ( SYSCLK_PERIOD * 10 );
            start_bin <= '1';
            NSYSRESET <= '1';
            wait;
        end if;
    end process;
    
    process (SYSCLK) begin
        if (rising_edge(SYSCLK)) then
            if (start_bin <= '1') then
                bin <= bin + 1;
                if (bin = 2048) then
                    bin <= to_unsigned(1, bin'length);
                end if;
            end if;
        end if;
    end process;

    -- Clock Driver
    SYSCLK <= not SYSCLK after (SYSCLK_PERIOD / 2.0 );

    -- Instantiate Unit Under Test:  LuSEE_PF_EVAL
    notch_average_ch1_real : entity work.average_stage1_signed
    generic map(
      notch => true)
    PORT map
        (clk                 => SYSCLK,
        reset                => NSYSRESET,
        clk_enable           => '1',

        P                    => ch1_val_re,
        count                => bin,
        navg                 => Navg_notch,
        ready_in             => notch_ready,
        
        subtract             => (others=>'0'),
        subtract_bin         => (others=>'0'),
        subtract_ready       => '0',
        subtract_error       => open,
        
        ce_out               => ch1_notch_real_ce,
        outpk                => ch1_notch_real,
        outbin               => ch1_notch_real_outbin,
        ready_out            => ch1_notch_real_ready
        );

    notch_average_ch1_imag : entity work.average_stage1_signed
    generic map(
      notch => true)
    PORT map
        (clk                 => SYSCLK,
        reset                => NSYSRESET,
        clk_enable           => '1',

        P                    => ch1_val_im,
        count                => bin,
        navg                 => Navg_notch,
        ready_in             => notch_ready,
        
        subtract             => (others=>'0'),
        subtract_bin         => (others=>'0'),
        subtract_ready       => '0',
        subtract_error       => open,
        
        ce_out               => ch1_notch_imag_ce,
        outpk                => ch1_notch_imag,
        outbin               => ch1_notch_imag_outbin,
        ready_out            => ch1_notch_imag_ready
        );
    
    notch_average_ch2_real : entity work.average_stage1_signed
    generic map(
      notch => true)
    PORT map
        (clk                 => SYSCLK,
        reset                => NSYSRESET,
        clk_enable           => '1',

        P                    => ch2_val_re,
        count                => bin,
        navg                 => Navg_notch,
        ready_in             => notch_ready,
        
        subtract             => (others=>'0'),
        subtract_bin         => (others=>'0'),
        subtract_ready       => '0',
        subtract_error       => open,
        
        ce_out               => ch2_notch_real_ce,
        outpk                => ch2_notch_real,
        outbin               => ch2_notch_real_outbin,
        ready_out            => ch2_notch_real_ready
        );
    
    notch_average_ch2_imag : entity work.average_stage1_signed
    generic map(
      notch => true)
    PORT map
        (clk                 => SYSCLK,
        reset                => NSYSRESET,
        clk_enable           => '1',

        P                    => ch2_val_im,
        count                => bin,
        navg                 => Navg_notch,
        ready_in             => notch_ready,
        
        subtract             => (others=>'0'),
        subtract_bin         => (others=>'0'),
        subtract_ready       => '0',
        subtract_error       => open,
        
        ce_out               => ch2_notch_imag_ce,
        outpk                => ch2_notch_imag,
        outbin               => ch2_notch_imag_outbin,
        ready_out            => ch2_notch_imag_ready
        );
        
    correlate_fixpt_notch : entity work.correlate_fixpt
    generic map(
      size => 32)
    PORT map
    (   clk                     => SYSCLK,
        reset                   => NSYSRESET,
        bin_in                  => "00" & ch1_notch_real_outbin,
        fft_ready_in            => ch1_notch_real_ready,
        ch1_val_re              => ch1_notch_real,
        ch1_val_im              => ch1_notch_imag,
        ch2_val_re              => ch2_notch_real,
        ch2_val_im              => ch2_notch_imag,
        ch3_val_re              => ch1_notch_real,
        ch3_val_im              => ch1_notch_imag,
        ch4_val_re              => ch2_notch_real,
        ch4_val_im              => ch2_notch_imag,
        index_array             => notch_array,
        A1                      => A1_notch,
        A2                      => A2_notch,
        A3                      => A3_notch,
        A4                      => A4_notch,
        X12R                    => X12R_notch,
        X12I                    => X12I_notch,
        X13R                    => X13R_notch,
        X13I                    => X13I_notch,
        X14R                    => X14R_notch,
        X14I                    => X14I_notch,
        X23R                    => X23R_notch,
        X23I                    => X23I_notch,
        X24R                    => X24R_notch,
        X24I                    => X24I_notch,
        X34R                    => X34R_notch,
        X34I                    => X34I_notch,
        bin_out                 => bin_delay_notch,
        error_out               => open,
        fft_ready_out           => fft_ready_delay_notch
        );
    
    correlate_fixpt_main : entity work.correlate_fixpt
    generic map(
      size => 32)
    PORT map
    (   clk                     => SYSCLK,
        reset                   => blk_reset,
        bin_in                  => bin_s1,
        fft_ready_in            => fft_ready_s1,
        ch1_val_re              => ch1_val_re_s1,
        ch1_val_im              => ch1_val_im_s1,
        ch2_val_re              => ch2_val_re_s1,
        ch2_val_im              => ch2_val_im_s1,
        ch3_val_re              => ch1_val_re_s1,
        ch3_val_im              => ch1_val_im_s1,
        ch4_val_re              => ch2_val_re_s1,
        ch4_val_im              => ch2_val_im_s1,
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
        bin_out                 => bin_delay,
        error_out               => open,
        fft_ready_out           => fft_ready_delay
        );
        
    process (SYSCLK) begin
        if (rising_edge(SYSCLK)) then
            A1_s                      <= A1;
            A2_s                      <= A2;
            A3_s                      <= A3;
            A4_s                      <= A4;
            X12R_s                    <= X12R;
            X12I_s                    <= X12I;
            X13R_s                    <= X13R;
            X13I_s                    <= X13I;
            X14R_s                    <= X14R;
            X14I_s                    <= X14I;
            X23R_s                    <= X23R;
            X23I_s                    <= X23I;
            X24R_s                    <= X24R;
            X24I_s                    <= X24I;
            X34R_s                    <= X34R;
            X34I_s                    <= X34I;
            bin_delay_s               <= bin_delay;
            fft_delay_s               <= fft_ready_delay;
        end if;
    end process;  

    average_signed_instance_P1_fixpt_inst : entity work.average_stage1_signed
        generic map(
          notch => false)
        PORT map
            (clk                 => SYSCLK,
            reset                => NSYSRESET,
            clk_enable           => '1',

            P                    => A1_s,
            count                => bin_delay_s,
            navg                 => Navg_main,
            ready_in             => fft_delay_s,
            
            subtract             => signed(A1_notch),
            subtract_bin         => bin_delay_notch,
            subtract_ready       => fft_ready_delay_notch,
            subtract_error       => open,
            
            ce_out               => ce_out_s1,
            outpk                => pks_s1(0),
            outbin               => outbin_s1,
            ready_out            => ready_s1
            );

end behavioral;

