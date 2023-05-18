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
    signal NSYSRESET : std_logic := '1';
    
    SIGNAL sample1             : std_logic_vector(13 DOWNTO 0);
    SIGNAL sample2             : std_logic_vector(13 DOWNTO 0);
    
    signal Navg_notch          : std_logic_vector(9 downto 0) := "00" & x"02";
    signal Navg_main           : std_logic_vector(9 downto 0) := "00" & x"03";
    
    SIGNAL start_bin           : std_logic := '0';
    SIGNAL bin                 : unsigned(12 DOWNTO 0) := to_unsigned(2500, 13);
    SIGNAL fft_ready           : std_logic := '1';
    SIGNAL ch1_val_re                       :   std_logic_vector(31 DOWNTO 0) := x"00e00010";
    SIGNAL ch1_real                         :   unsigned(31 downto 0) := x"00000b10";
    SIGNAL ch1_val_im                       :   std_logic_vector(31 DOWNTO 0) := x"00e00010";
    SIGNAL ch1_im                           :   unsigned(31 downto 0) := x"00000b10";
    SIGNAL ch2_val_re                       :   std_logic_vector(31 DOWNTO 0) := x"00e00010";
    SIGNAL ch2_val_im                       :   std_logic_vector(31 DOWNTO 0) := x"00e00010";
    
    SIGNAL ch1_val_re_s1                       :   std_logic_vector(31 DOWNTO 0);
    SIGNAL ch1_val_im_s1                       :   std_logic_vector(31 DOWNTO 0);
    SIGNAL ch2_val_re_s1                       :   std_logic_vector(31 DOWNTO 0);
    SIGNAL ch2_val_im_s1                       :   std_logic_vector(31 DOWNTO 0);
    
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

    SIGNAL corr_array                           : vector_of_std_logic_vector5(15 downto 0);
    SIGNAL notch_array                          : vector_of_std_logic_vector5(15 downto 0);
    SIGNAL notch_ready                          :   std_logic  := '1';
    
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
    SIGNAL A1_s2                                :   std_logic_vector(31 DOWNTO 0);  -- ufix32_E15
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
    SIGNAL bin_delay_s2                         :   std_logic_vector(12 DOWNTO 0);  -- ufix13
    SIGNAL fft_delay_s2                         :   std_logic;
    
    SIGNAL bin_delay_notch                      :   std_logic_vector(12 DOWNTO 0);  -- ufix13
    SIGNAL fft_ready_delay_notch                :   std_logic;
    SIGNAL ce_out_s1                            :   std_logic;
    SIGNAL outbin_s1                            :   std_logic_vector(10 DOWNTO 0);
    SIGNAL ready_s1                             :   std_logic;
    SIGNAL pks                                  :   std_logic_vector(31 DOWNTO 0);
 
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
            start_bin <= '1';
            NSYSRESET <= '0';
            wait;
        end if;
    end process;
    
    process (SYSCLK) begin
        if (rising_edge(SYSCLK)) then
            if (start_bin <= '1') then
                bin <= bin - 1;
                ch1_real <= ch1_real - 3;
                ch1_im <= ch1_im - 6;
                if (bin < 1) then
                    bin <= to_unsigned(2500, bin'length);
                    ch1_real <= to_unsigned(8, ch1_real'length);
                    ch1_im <= to_unsigned(15, ch1_im'length);
                end if;
                
                
            end if;
        end if;
    end process;

    -- Clock Driver
    SYSCLK <= not SYSCLK after (SYSCLK_PERIOD / 2.0 );
    
    process (SYSCLK) begin
        if (rising_edge(SYSCLK)) then

            ch1_val_re_s1           <= std_logic_vector(ch1_real);
            ch1_val_im_s1           <= std_logic_vector(ch1_im);
            ch2_val_re_s1           <= ch2_val_re;
            ch2_val_im_s1           <= ch2_val_im;
            bin_s1                  <= std_logic_vector(bin);
            fft_ready_s1            <= fft_ready;
        end if;
    end process;

    -- Instantiate Unit Under Test:  LuSEE_PF_EVAL
    notch_average_ch1_real : entity work.average_stage1_signed
    generic map(
      notch => true)
    PORT map
        (clk                 => SYSCLK,
        reset                => NSYSRESET,
        clk_enable           => '1',

        P                    => std_logic_vector(ch1_real),
        count                => std_logic_vector(bin),
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

        P                    => std_logic_vector(ch1_im),
        count                => std_logic_vector(bin),
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
        count                => bin_s1,
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
        count                => bin_s1,
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
        reset                   => NSYSRESET,
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
            outpk                => pks,
            outbin               => outbin_s1,
            ready_out            => ready_s1
            );

end behavioral;

