-- -------------------------------------------------------------
-- 
-- File Name: /u/home/eraguzin/matlab/LNspec/matlab/codegen/correlate/hdlsrc/correlate_fixpt.vhd
-- Created: 2023-03-09 14:36:09
-- 
-- Generated by MATLAB 9.12, MATLAB Coder 5.4 and HDL Coder 3.20
-- 
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Design base rate: 1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: correlate_fixpt
-- Source Path: correlate_fixpt
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY correlate_fixpt IS
    generic(
      size : integer := 32
      );
  PORT( 
        clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        bin_in                            :   IN    std_logic_vector(12 DOWNTO 0);
        fft_ready_in                      :   IN    std_logic;
        ch1_val_re                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        ch1_val_im                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        ch2_val_re                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        ch2_val_im                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        ch3_val_re                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        ch3_val_im                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        ch4_val_re                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        ch4_val_im                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        A1                                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32_E15
        A2                                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32_E15
        A3                                :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
        A4                                :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32_E15
        X12R                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
        X12I                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
        X13R                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
        X13I                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
        X14R                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
        X14I                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
        X23R                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
        X23I                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
        X24R                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
        X24I                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
        X34R                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
        X34I                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
        bin_out                           :   OUT   std_logic_vector(12 DOWNTO 0);
        fft_ready_out                     :   OUT   std_logic
        );
END correlate_fixpt;


ARCHITECTURE rtl OF correlate_fixpt IS

  -- Signals
  SIGNAL ch1_val_re_signed                : signed(31 DOWNTO 0);  -- sfix32_En7
  SIGNAL ch1_val_im_signed                : signed(31 DOWNTO 0);  -- sfix32_En7
  SIGNAL ch2_val_re_signed                : signed(31 DOWNTO 0);  -- sfix32_En7
  SIGNAL ch2_val_im_signed                : signed(31 DOWNTO 0);  -- sfix32_En7
  SIGNAL ch3_val_re_signed                : signed(31 DOWNTO 0);  -- sfix32_En7
  SIGNAL ch3_val_im_signed                : signed(31 DOWNTO 0);  -- sfix32_En7
  SIGNAL ch4_val_re_signed                : signed(31 DOWNTO 0);  -- sfix32_En7
  SIGNAL ch4_val_im_signed                : signed(31 DOWNTO 0);  -- sfix32_En7
  SIGNAL A1_tmp                           : unsigned(31 DOWNTO 0);  -- ufix32_E15
  SIGNAL A2_tmp                           : unsigned(31 DOWNTO 0);  -- ufix32_E15
  SIGNAL A3_tmp                           : signed(31 DOWNTO 0);  -- sfix32_E6
  SIGNAL A4_tmp                           : unsigned(31 DOWNTO 0);  -- ufix32_E15
  SIGNAL X12R_tmp                         : signed(31 DOWNTO 0);  -- sfix32_E6
  SIGNAL X12I_tmp                         : signed(31 DOWNTO 0);  -- sfix32_E14
  SIGNAL X13R_tmp                         : signed(31 DOWNTO 0);  -- sfix32_E6
  SIGNAL X13I_tmp                         : signed(31 DOWNTO 0);  -- sfix32_E14
  SIGNAL X14R_tmp                         : signed(31 DOWNTO 0);  -- sfix32_E6
  SIGNAL X14I_tmp                         : signed(31 DOWNTO 0);  -- sfix32_E14
  SIGNAL X23R_tmp                         : signed(31 DOWNTO 0);  -- sfix32_E6
  SIGNAL X23I_tmp                         : signed(31 DOWNTO 0);  -- sfix32_E14
  SIGNAL X24R_tmp                         : signed(31 DOWNTO 0);  -- sfix32_E6
  SIGNAL X24I_tmp                         : signed(31 DOWNTO 0);  -- sfix32_E14
  SIGNAL X34R_tmp                         : signed(31 DOWNTO 0);  -- sfix32_E6
  SIGNAL X34I_tmp                         : signed(31 DOWNTO 0);  -- sfix32_E14
  SIGNAL correlate_fixpt_mul_temp_s       : std_logic_vector(63 DOWNTO 0);
  SIGNAL correlate_fixpt_mul_temp_1_s     : std_logic_vector(63 DOWNTO 0);
  SIGNAL correlate_fixpt_mul_temp_2_s     : std_logic_vector(63 DOWNTO 0);
  SIGNAL correlate_fixpt_mul_temp_3_s     : std_logic_vector(63 DOWNTO 0);
  SIGNAL correlate_fixpt_mul_temp_4_s     : std_logic_vector(63 DOWNTO 0);
  SIGNAL correlate_fixpt_mul_temp_5_s     : std_logic_vector(63 DOWNTO 0);
  SIGNAL correlate_fixpt_mul_temp_6_s     : std_logic_vector(63 DOWNTO 0);
  SIGNAL correlate_fixpt_mul_temp_7_s     : std_logic_vector(63 DOWNTO 0);
  SIGNAL correlate_fixpt_mul_temp_8_s     : std_logic_vector(63 DOWNTO 0);
  SIGNAL correlate_fixpt_mul_temp_9_s     : std_logic_vector(63 DOWNTO 0);
  SIGNAL correlate_fixpt_mul_temp_10_s    : std_logic_vector(63 DOWNTO 0);
  SIGNAL correlate_fixpt_mul_temp_11_s    : std_logic_vector(63 DOWNTO 0);
  SIGNAL correlate_fixpt_y_im             : signed(31 DOWNTO 0);  -- sfix32_En7
  SIGNAL correlate_fixpt_X12_re           : signed(31 DOWNTO 0);  -- sfix32_E14
  SIGNAL correlate_fixpt_X12_im           : signed(31 DOWNTO 0);  -- sfix32_E14
  SIGNAL correlate_fixpt_cast             : signed(32 DOWNTO 0);  -- sfix33_En7
  SIGNAL correlate_fixpt_cast_1           : signed(32 DOWNTO 0);  -- sfix33_En7
  SIGNAL correlate_fixpt_mul_temp         : signed(63 DOWNTO 0);  -- sfix64_En14
  SIGNAL correlate_fixpt_sub_cast         : signed(64 DOWNTO 0);  -- sfix65_En14
  SIGNAL correlate_fixpt_mul_temp_1       : signed(63 DOWNTO 0);  -- sfix64_En14
  SIGNAL correlate_fixpt_sub_cast_1       : signed(64 DOWNTO 0);  -- sfix65_En14
  SIGNAL correlate_fixpt_sub_temp         : signed(64 DOWNTO 0);  -- sfix65_En14
  SIGNAL correlate_fixpt_mul_temp_2       : signed(63 DOWNTO 0);  -- sfix64_En14
  SIGNAL correlate_fixpt_add_cast         : signed(64 DOWNTO 0);  -- sfix65_En14
  SIGNAL correlate_fixpt_mul_temp_3       : signed(63 DOWNTO 0);  -- sfix64_En14
  SIGNAL correlate_fixpt_add_cast_1       : signed(64 DOWNTO 0);  -- sfix65_En14
  SIGNAL correlate_fixpt_add_temp         : signed(64 DOWNTO 0);  -- sfix65_En14
  SIGNAL correlate_fixpt_mul_temp_4       : signed(63 DOWNTO 0);  -- sfix64_En14
  SIGNAL correlate_fixpt_sub_cast_2       : signed(64 DOWNTO 0);  -- sfix65_En14
  SIGNAL correlate_fixpt_cast_2           : signed(32 DOWNTO 0);  -- sfix33_En7
  SIGNAL correlate_fixpt_cast_3           : signed(32 DOWNTO 0);  -- sfix33_En7
  SIGNAL correlate_fixpt_cast_4           : signed(31 DOWNTO 0);  -- sfix32_En7
  SIGNAL correlate_fixpt_mul_temp_5       : signed(63 DOWNTO 0);  -- sfix64_En14
  SIGNAL correlate_fixpt_sub_cast_3       : signed(64 DOWNTO 0);  -- sfix65_En14
  SIGNAL correlate_fixpt_sub_temp_1       : signed(64 DOWNTO 0);  -- sfix65_En14
  SIGNAL correlate_fixpt_mul_temp_6       : signed(63 DOWNTO 0);  -- sfix64_En14
  SIGNAL correlate_fixpt_sub_cast_4       : signed(64 DOWNTO 0);  -- sfix65_En14
  SIGNAL correlate_fixpt_cast_5           : signed(32 DOWNTO 0);  -- sfix33_En7
  SIGNAL correlate_fixpt_cast_6           : signed(32 DOWNTO 0);  -- sfix33_En7
  SIGNAL correlate_fixpt_cast_7           : signed(31 DOWNTO 0);  -- sfix32_En7
  SIGNAL correlate_fixpt_mul_temp_7       : signed(63 DOWNTO 0);  -- sfix64_En14
  SIGNAL correlate_fixpt_sub_cast_5       : signed(64 DOWNTO 0);  -- sfix65_En14
  SIGNAL correlate_fixpt_sub_temp_2       : signed(64 DOWNTO 0);  -- sfix65_En14
  SIGNAL correlate_fixpt_mul_temp_8       : signed(63 DOWNTO 0);  -- sfix64_En14
  SIGNAL correlate_fixpt_sub_cast_6       : signed(64 DOWNTO 0);  -- sfix65_En14
  SIGNAL correlate_fixpt_cast_8           : signed(32 DOWNTO 0);  -- sfix33_En7
  SIGNAL correlate_fixpt_cast_9           : signed(32 DOWNTO 0);  -- sfix33_En7
  SIGNAL correlate_fixpt_cast_10          : signed(31 DOWNTO 0);  -- sfix32_En7
  SIGNAL correlate_fixpt_mul_temp_9       : signed(63 DOWNTO 0);  -- sfix64_En14
  SIGNAL correlate_fixpt_sub_cast_7       : signed(64 DOWNTO 0);  -- sfix65_En14
  SIGNAL correlate_fixpt_sub_temp_3       : signed(64 DOWNTO 0);  -- sfix65_En14
  SIGNAL correlate_fixpt_mul_temp_10      : signed(63 DOWNTO 0);  -- sfix64_En14
  SIGNAL correlate_fixpt_sub_cast_8       : signed(64 DOWNTO 0);  -- sfix65_En14
  SIGNAL correlate_fixpt_cast_11          : signed(32 DOWNTO 0);  -- sfix33_En7
  SIGNAL correlate_fixpt_cast_12          : signed(32 DOWNTO 0);  -- sfix33_En7
  SIGNAL correlate_fixpt_cast_13          : signed(31 DOWNTO 0);  -- sfix32_En7
  SIGNAL correlate_fixpt_mul_temp_11      : signed(63 DOWNTO 0);  -- sfix64_En14
  SIGNAL correlate_fixpt_sub_cast_9       : signed(64 DOWNTO 0);  -- sfix65_En14
  SIGNAL correlate_fixpt_sub_temp_4       : signed(64 DOWNTO 0);  -- sfix65_En14
  
  SIGNAL bin_s1                           : std_logic_vector(12 DOWNTO 0);
  SIGNAL bin_s2                           : std_logic_vector(12 DOWNTO 0);
  SIGNAL bin_s3                           : std_logic_vector(12 DOWNTO 0);
  SIGNAL bin_s4                           : std_logic_vector(12 DOWNTO 0);
  SIGNAL bin_s5                           : std_logic_vector(12 DOWNTO 0);
  SIGNAL fft_ready_s1                     : std_logic;

BEGIN
    process (clk) begin
        if (rising_edge(clk)) then
            if (reset = '1') then
                bin_s1 <= (others=>'0');
                bin_s2 <= (others=>'0');
                bin_s3 <= (others=>'0');
                bin_s4 <= (others=>'0');
                bin_s5 <= (others=>'0');
                fft_ready_s1 <= '0';
            else
                bin_s1 <= bin_in;
                bin_s2 <= bin_s1;
                bin_s3 <= bin_s2;
                bin_s4 <= bin_s3;
                bin_s5 <= bin_s4;
                bin_out <= bin_s5;
                --fft_ready_out <= fft_ready_s1;
            end if;
        end if;
    end process;
  ch1_val_re_signed <= signed(ch1_val_re);

  ch1_val_im_signed <= signed(ch1_val_im);

  ch2_val_re_signed <= signed(ch2_val_re);

  ch2_val_im_signed <= signed(ch2_val_im);

  ch3_val_re_signed <= signed(ch3_val_re);

  ch3_val_im_signed <= signed(ch3_val_im);

  ch4_val_re_signed <= signed(ch4_val_re);

  ch4_val_im_signed <= signed(ch4_val_im);

  --HDL code generation from MATLAB function: correlate_fixpt
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  --                                                                          %
  --          Generated by MATLAB 9.12 and Fixed-Point Designer 7.4           %
  --                                                                          %
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  --'correlate_fixpt:9' fm = get_fimath();
  --'correlate_fixpt:11' A1 = fi(real (ch1_val*conj(ch1_val)), 0, 32, -15, fm);
  --'correlate_fixpt:12' A2 = fi(real (ch2_val*conj(ch2_val)), 0, 32, -15, fm);
  --'correlate_fixpt:13' A3 = fi(real (ch3_val*conj(ch4_val)), 1, 32, -6, fm);
  --'correlate_fixpt:14' A4 = fi(real (ch4_val*conj(ch4_val)), 0, 32, -15, fm);
  --'correlate_fixpt:16' X12 = fi(ch1_val*conj(ch2_val), 1, 32, -14, fm);
  
    ch1re_x_ch2re : entity work.Multiply_generic32
        generic map(
            size => size)
        port map(
            -- Inputs
            i_clk => clk,
            i_rstb => reset,
            i_ma => std_logic_vector(ch1_val_re_signed),
            i_mb => std_logic_vector(ch2_val_re_signed),

            --Valid
            valid_in => fft_ready_in,
            valid_out => fft_ready_out,

            -- Outputs
            o_m => correlate_fixpt_mul_temp_s
        );
    correlate_fixpt_mul_temp <= signed(correlate_fixpt_mul_temp_s);
    
    ch1im_x_conj_ch2im : entity work.Multiply_generic32
        generic map(
            size => size)
        port map(
            -- Inputs
            i_clk => clk,
            i_rstb => reset,
            i_ma => std_logic_vector(ch1_val_re_signed),
            i_mb => std_logic_vector(correlate_fixpt_y_im),

            --Valid
            valid_in => fft_ready_in,
            valid_out => open,

            -- Outputs
            o_m => correlate_fixpt_mul_temp_1_s
        );
    correlate_fixpt_mul_temp_1 <= signed(correlate_fixpt_mul_temp_1_s);
        
    ch1re_x_conj_ch2im : entity work.Multiply_generic32
        generic map(
            size => size)
        port map(
            -- Inputs
            i_clk => clk,
            i_rstb => reset,
            i_ma => std_logic_vector(ch1_val_re_signed),
            i_mb => std_logic_vector(correlate_fixpt_y_im),

            --Valid
            valid_in => fft_ready_in,
            valid_out => open,

            -- Outputs
            o_m => correlate_fixpt_mul_temp_2_s
        );
    correlate_fixpt_mul_temp_2 <= signed(correlate_fixpt_mul_temp_2_s);
        
    ch1im_x_ch2re : entity work.Multiply_generic32
        generic map(
            size => size)
        port map(
            -- Inputs
            i_clk => clk,
            i_rstb => reset,
            i_ma => std_logic_vector(ch1_val_im_signed),
            i_mb => std_logic_vector(ch2_val_re_signed),

            --Valid
            valid_in => fft_ready_in,
            valid_out => open,

            -- Outputs
            o_m => correlate_fixpt_mul_temp_3_s
        );
    correlate_fixpt_mul_temp_3 <= signed(correlate_fixpt_mul_temp_3_s);
  
  correlate_fixpt_cast <= resize(ch2_val_im_signed, 33);
  correlate_fixpt_cast_1 <=  - (correlate_fixpt_cast);
  correlate_fixpt_y_im <= correlate_fixpt_cast_1(31 DOWNTO 0);
  --correlate_fixpt_mul_temp <= ch1_val_re_signed * ch2_val_re_signed;
  correlate_fixpt_sub_cast <= resize(correlate_fixpt_mul_temp, 65);
  --correlate_fixpt_mul_temp_1 <= ch1_val_im_signed * correlate_fixpt_y_im;
  correlate_fixpt_sub_cast_1 <= resize(correlate_fixpt_mul_temp_1, 65);
  correlate_fixpt_sub_temp <= correlate_fixpt_sub_cast - correlate_fixpt_sub_cast_1;
  correlate_fixpt_X12_re <= correlate_fixpt_sub_temp(59 DOWNTO 28);
  --correlate_fixpt_mul_temp_2 <= ch1_val_re_signed * correlate_fixpt_y_im;
  correlate_fixpt_add_cast <= resize(correlate_fixpt_mul_temp_2, 65);
  --correlate_fixpt_mul_temp_3 <= ch1_val_im_signed * ch2_val_re_signed;
  correlate_fixpt_add_cast_1 <= resize(correlate_fixpt_mul_temp_3, 65);
  correlate_fixpt_add_temp <= correlate_fixpt_add_cast + correlate_fixpt_add_cast_1;
  correlate_fixpt_X12_im <= correlate_fixpt_add_temp(59 DOWNTO 28);
  --'correlate_fixpt:17' X12R = fi(real(X12), 1, 32, -6, fm);
  --'correlate_fixpt:18' X12I = fi(imag(X12), 1, 32, -14, fm);
  --'correlate_fixpt:20' X13 = fi(ch1_val*conj(ch3_val), 0, 32, -15, fm);
  --'correlate_fixpt:21' X13R = fi(real(X12), 1, 32, -6, fm);
  --'correlate_fixpt:22' X13I = fi(imag(X12), 1, 32, -14, fm);
  --'correlate_fixpt:24' X14 = fi(ch1_val*conj(ch4_val), 1, 32, -14, fm);
  --'correlate_fixpt:25' X14R = fi(real(X12), 1, 32, -6, fm);
  --'correlate_fixpt:26' X14I = fi(imag(X12), 1, 32, -14, fm);
  --'correlate_fixpt:28' X23 = fi(ch2_val*conj(ch3_val), 1, 32, -14, fm);
  --'correlate_fixpt:29' X23R = fi(real(X12), 1, 32, -6, fm);
  --'correlate_fixpt:30' X23I = fi(imag(X12), 1, 32, -14, fm);
  --'correlate_fixpt:32' X24 = fi(ch2_val*conj(ch4_val), 0, 32, -15, fm);
  --'correlate_fixpt:33' X24R = fi(real(X12), 1, 32, -6, fm);
  --'correlate_fixpt:34' X24I = fi(imag(X12), 1, 32, -14, fm);
  --'correlate_fixpt:36' X34 = fi(ch3_val*conj(ch4_val), 1, 32, -14, fm);
  --'correlate_fixpt:37' X34R = fi(real(X12), 1, 32, -6, fm);
  --'correlate_fixpt:38' X34I = fi(imag(X12), 1, 32, -14, fm);
  
    ch1re_x_ch1re : entity work.Multiply_generic32
        generic map(
            size => size)
        port map(
            -- Inputs
            i_clk => clk,
            i_rstb => reset,
            i_ma => std_logic_vector(ch1_val_re_signed),
            i_mb => std_logic_vector(ch1_val_re_signed),

            --Valid
            valid_in => fft_ready_in,
            valid_out => open,

            -- Outputs
            o_m => correlate_fixpt_mul_temp_4_s
        );
    correlate_fixpt_mul_temp_4 <= signed(correlate_fixpt_mul_temp_4_s);
        
    ch1im_x_conj_ch1im : entity work.Multiply_generic32
        generic map(
            size => size)
        port map(
            -- Inputs
            i_clk => clk,
            i_rstb => reset,
            i_ma => std_logic_vector(ch1_val_im_signed),
            i_mb => std_logic_vector(correlate_fixpt_cast_4),

            --Valid
            valid_in => fft_ready_in,
            valid_out => open,

            -- Outputs
            o_m => correlate_fixpt_mul_temp_5_s
        );
    correlate_fixpt_mul_temp_5 <= signed(correlate_fixpt_mul_temp_5_s);
    
    ch2re_x_ch2re : entity work.Multiply_generic32
        generic map(
            size => size)
        port map(
            -- Inputs
            i_clk => clk,
            i_rstb => reset,
            i_ma => std_logic_vector(ch2_val_re_signed),
            i_mb => std_logic_vector(ch2_val_re_signed),

            --Valid
            valid_in => fft_ready_in,
            valid_out => open,

            -- Outputs
            o_m => correlate_fixpt_mul_temp_6_s
        );
    correlate_fixpt_mul_temp_6 <= signed(correlate_fixpt_mul_temp_6_s);
        
    ch2im_x_conj_ch2im : entity work.Multiply_generic32
        generic map(
            size => size)
        port map(
            -- Inputs
            i_clk => clk,
            i_rstb => reset,
            i_ma => std_logic_vector(ch2_val_im_signed),
            i_mb => std_logic_vector(correlate_fixpt_cast_7),

            --Valid
            valid_in => fft_ready_in,
            valid_out => open,

            -- Outputs
            o_m => correlate_fixpt_mul_temp_7_s
        );
    correlate_fixpt_mul_temp_7 <= signed(correlate_fixpt_mul_temp_7_s);
    
  --correlate_fixpt_mul_temp_4 <= ch1_val_re_signed * ch1_val_re_signed;
  correlate_fixpt_sub_cast_2 <= resize(correlate_fixpt_mul_temp_4, 65);
  correlate_fixpt_cast_2 <= resize(ch1_val_im_signed, 33);
  correlate_fixpt_cast_3 <=  - (correlate_fixpt_cast_2);
  correlate_fixpt_cast_4 <= correlate_fixpt_cast_3(31 DOWNTO 0);
  --correlate_fixpt_mul_temp_5 <= ch1_val_im_signed * correlate_fixpt_cast_4;
  correlate_fixpt_sub_cast_3 <= resize(correlate_fixpt_mul_temp_5, 65);
  correlate_fixpt_sub_temp_1 <= correlate_fixpt_sub_cast_2 - correlate_fixpt_sub_cast_3;
  A1_tmp <= unsigned(correlate_fixpt_sub_temp_1(60 DOWNTO 29));
  --correlate_fixpt_mul_temp_6 <= ch2_val_re_signed * ch2_val_re_signed;
  correlate_fixpt_sub_cast_4 <= resize(correlate_fixpt_mul_temp_6, 65);
  correlate_fixpt_cast_5 <= resize(ch2_val_im_signed, 33);
  correlate_fixpt_cast_6 <=  - (correlate_fixpt_cast_5);
  correlate_fixpt_cast_7 <= correlate_fixpt_cast_6(31 DOWNTO 0);
  --correlate_fixpt_mul_temp_7 <= ch2_val_im_signed * correlate_fixpt_cast_7;
  correlate_fixpt_sub_cast_5 <= resize(correlate_fixpt_mul_temp_7, 65);
  correlate_fixpt_sub_temp_2 <= correlate_fixpt_sub_cast_4 - correlate_fixpt_sub_cast_5;
  A2_tmp <= unsigned(correlate_fixpt_sub_temp_2(60 DOWNTO 29));
  
  ch3re_x_ch4re : entity work.Multiply_generic32
        generic map(
            size => size)
        port map(
            -- Inputs
            i_clk => clk,
            i_rstb => reset,
            i_ma => std_logic_vector(ch3_val_re_signed),
            i_mb => std_logic_vector(ch4_val_re_signed),

            --Valid
            valid_in => fft_ready_in,
            valid_out => open,

            -- Outputs
            o_m => correlate_fixpt_mul_temp_8_s
        );
    correlate_fixpt_mul_temp_8 <= signed(correlate_fixpt_mul_temp_8_s);
        
    ch3im_x_conj_ch4im : entity work.Multiply_generic32
        generic map(
            size => size)
        port map(
            -- Inputs
            i_clk => clk,
            i_rstb => reset,
            i_ma => std_logic_vector(ch3_val_im_signed),
            i_mb => std_logic_vector(correlate_fixpt_cast_10),

            --Valid
            valid_in => fft_ready_in,
            valid_out => open,

            -- Outputs
            o_m => correlate_fixpt_mul_temp_9_s
        );
    correlate_fixpt_mul_temp_9 <= signed(correlate_fixpt_mul_temp_9_s);
        
    ch4re_x_ch4re : entity work.Multiply_generic32
        generic map(
            size => size)
        port map(
            -- Inputs
            i_clk => clk,
            i_rstb => reset,
            i_ma => std_logic_vector(ch4_val_re_signed),
            i_mb => std_logic_vector(ch4_val_re_signed),

            --Valid
            valid_in => fft_ready_in,
            valid_out => open,

            -- Outputs
            o_m => correlate_fixpt_mul_temp_10_s
        );
    correlate_fixpt_mul_temp_10 <= signed(correlate_fixpt_mul_temp_10_s);
        
    ch4im_x_conj_ch4im : entity work.Multiply_generic32
        generic map(
            size => size)
        port map(
            -- Inputs
            i_clk => clk,
            i_rstb => reset,
            i_ma => std_logic_vector(ch4_val_im_signed),
            i_mb => std_logic_vector(correlate_fixpt_cast_13),

            --Valid
            valid_in => fft_ready_in,
            valid_out => open,

            -- Outputs
            o_m => correlate_fixpt_mul_temp_11_s
        );
    correlate_fixpt_mul_temp_11 <= signed(correlate_fixpt_mul_temp_11_s);
  
  --correlate_fixpt_mul_temp_8 <= ch3_val_re_signed * ch4_val_re_signed;
  correlate_fixpt_sub_cast_6 <= resize(correlate_fixpt_mul_temp_8, 65);
  correlate_fixpt_cast_8 <= resize(ch4_val_im_signed, 33);
  correlate_fixpt_cast_9 <=  - (correlate_fixpt_cast_8);
  correlate_fixpt_cast_10 <= correlate_fixpt_cast_9(31 DOWNTO 0);
  --correlate_fixpt_mul_temp_9 <= ch3_val_im_signed * correlate_fixpt_cast_10;
  correlate_fixpt_sub_cast_7 <= resize(correlate_fixpt_mul_temp_9, 65);
  correlate_fixpt_sub_temp_3 <= correlate_fixpt_sub_cast_6 - correlate_fixpt_sub_cast_7;
  A3_tmp <= correlate_fixpt_sub_temp_3(51 DOWNTO 20);
  --correlate_fixpt_mul_temp_10 <= ch4_val_re_signed * ch4_val_re_signed;
  correlate_fixpt_sub_cast_8 <= resize(correlate_fixpt_mul_temp_10, 65);
  correlate_fixpt_cast_11 <= resize(ch4_val_im_signed, 33);
  correlate_fixpt_cast_12 <=  - (correlate_fixpt_cast_11);
  correlate_fixpt_cast_13 <= correlate_fixpt_cast_12(31 DOWNTO 0);
  --correlate_fixpt_mul_temp_11 <= ch4_val_im_signed * correlate_fixpt_cast_13;
  correlate_fixpt_sub_cast_9 <= resize(correlate_fixpt_mul_temp_11, 65);
  correlate_fixpt_sub_temp_4 <= correlate_fixpt_sub_cast_8 - correlate_fixpt_sub_cast_9;
  A4_tmp <= unsigned(correlate_fixpt_sub_temp_4(60 DOWNTO 29));
  X12R_tmp <= correlate_fixpt_X12_re(23 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0';
  X12I_tmp <= correlate_fixpt_X12_im;
  X13R_tmp <= correlate_fixpt_X12_re(23 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0';
  X13I_tmp <= correlate_fixpt_X12_im;
  X14R_tmp <= correlate_fixpt_X12_re(23 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0';
  X14I_tmp <= correlate_fixpt_X12_im;
  X23R_tmp <= correlate_fixpt_X12_re(23 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0';
  X23I_tmp <= correlate_fixpt_X12_im;
  X24R_tmp <= correlate_fixpt_X12_re(23 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0';
  X24I_tmp <= correlate_fixpt_X12_im;
  X34R_tmp <= correlate_fixpt_X12_re(23 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0';
  X34I_tmp <= correlate_fixpt_X12_im;

  A1 <= std_logic_vector(A1_tmp);

  A2 <= std_logic_vector(A2_tmp);

  A3 <= std_logic_vector(A3_tmp);

  A4 <= std_logic_vector(A4_tmp);

  X12R <= std_logic_vector(X12R_tmp);

  X12I <= std_logic_vector(X12I_tmp);

  X13R <= std_logic_vector(X13R_tmp);

  X13I <= std_logic_vector(X13I_tmp);

  X14R <= std_logic_vector(X14R_tmp);

  X14I <= std_logic_vector(X14I_tmp);

  X23R <= std_logic_vector(X23R_tmp);

  X23I <= std_logic_vector(X23I_tmp);

  X24R <= std_logic_vector(X24R_tmp);

  X24I <= std_logic_vector(X24I_tmp);

  X34R <= std_logic_vector(X34R_tmp);

  X34I <= std_logic_vector(X34I_tmp);

END rtl;

