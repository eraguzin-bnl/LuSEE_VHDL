-- -------------------------------------------------------------
-- 
-- File Name: /u/home/eraguzin/matlab/LNspec/matlab/codegen/sfft/hdlsrc/Complex4Multiply_block2.vhd
-- Created: 2023-01-19 10:44:41
-- 
-- Generated by MATLAB 9.12, MATLAB Coder 5.4 and HDL Coder 3.20
-- 
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Complex4Multiply_block2
-- Source Path: sfft_fixpt/dsphdl.FFT/RADIX22FFT_SDF1_9/Complex4Multiply
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Complex4Multiply_block2 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        din_re                            :   IN    std_logic_vector(40 DOWNTO 0);  -- sfix41_En18
        din_im                            :   IN    std_logic_vector(40 DOWNTO 0);  -- sfix41_En18
        din_9_vld_dly                     :   IN    std_logic;
        twdl_9_1_re                       :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En30
        twdl_9_1_im                       :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En30
        softReset                         :   IN    std_logic;
        dinXTwdl_re                       :   OUT   std_logic_vector(40 DOWNTO 0);  -- sfix41_En18
        dinXTwdl_im                       :   OUT   std_logic_vector(40 DOWNTO 0);  -- sfix41_En18
        dinXTwdl_9_1_vld                  :   OUT   std_logic
        );
END Complex4Multiply_block2;


ARCHITECTURE rtl OF Complex4Multiply_block2 IS

  -- Signals
  SIGNAL din_re_signed                    : signed(40 DOWNTO 0);  -- sfix41_En18
  SIGNAL din_re_reg                       : signed(40 DOWNTO 0);  -- sfix41_En18
  SIGNAL din_im_signed                    : signed(40 DOWNTO 0);  -- sfix41_En18
  SIGNAL din_im_reg                       : signed(40 DOWNTO 0);  -- sfix41_En18
  SIGNAL twdl_9_1_re_signed               : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL twdl_re_reg                      : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL twdl_9_1_im_signed               : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL twdl_im_reg                      : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL Complex4Multiply_din1_re_pipe1   : signed(40 DOWNTO 0);  -- sfix41
  SIGNAL Complex4Multiply_din1_im_pipe1   : signed(40 DOWNTO 0);  -- sfix41
  SIGNAL Complex4Multiply_mult1_re_pipe1  : signed(72 DOWNTO 0);  -- sfix73
  SIGNAL Complex4Multiply_mult2_re_pipe1  : signed(72 DOWNTO 0);  -- sfix73
  SIGNAL Complex4Multiply_mult1_im_pipe1  : signed(72 DOWNTO 0);  -- sfix73
  SIGNAL Complex4Multiply_mult2_im_pipe1  : signed(72 DOWNTO 0);  -- sfix73
  SIGNAL Complex4Multiply_twiddle_re_pipe1 : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL Complex4Multiply_twiddle_im_pipe1 : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL prod1_re                         : signed(72 DOWNTO 0);  -- sfix73_En48
  SIGNAL prod1_im                         : signed(72 DOWNTO 0);  -- sfix73_En48
  SIGNAL prod2_re                         : signed(72 DOWNTO 0);  -- sfix73_En48
  SIGNAL prod2_im                         : signed(72 DOWNTO 0);  -- sfix73_En48
  SIGNAL din_vld_dly1                     : std_logic;
  SIGNAL din_vld_dly2                     : std_logic;
  SIGNAL din_vld_dly3                     : std_logic;
  SIGNAL prod_vld                         : std_logic;
  SIGNAL Complex4Add_multRes_re_reg       : signed(73 DOWNTO 0);  -- sfix74
  SIGNAL Complex4Add_multRes_im_reg       : signed(73 DOWNTO 0);  -- sfix74
  SIGNAL Complex4Add_prod_vld_reg1        : std_logic;
  SIGNAL Complex4Add_prod1_re_reg         : signed(72 DOWNTO 0);  -- sfix73
  SIGNAL Complex4Add_prod1_im_reg         : signed(72 DOWNTO 0);  -- sfix73
  SIGNAL Complex4Add_prod2_re_reg         : signed(72 DOWNTO 0);  -- sfix73
  SIGNAL Complex4Add_prod2_im_reg         : signed(72 DOWNTO 0);  -- sfix73
  SIGNAL Complex4Add_multRes_re_reg_next  : signed(73 DOWNTO 0);  -- sfix74_En48
  SIGNAL Complex4Add_multRes_im_reg_next  : signed(73 DOWNTO 0);  -- sfix74_En48
  SIGNAL Complex4Add_sub_cast             : signed(73 DOWNTO 0);  -- sfix74_En48
  SIGNAL Complex4Add_sub_cast_1           : signed(73 DOWNTO 0);  -- sfix74_En48
  SIGNAL Complex4Add_add_cast             : signed(73 DOWNTO 0);  -- sfix74_En48
  SIGNAL Complex4Add_add_cast_1           : signed(73 DOWNTO 0);  -- sfix74_En48
  SIGNAL mulResFP_re                      : signed(73 DOWNTO 0);  -- sfix74_En48
  SIGNAL mulResFP_im                      : signed(73 DOWNTO 0);  -- sfix74_En48
  SIGNAL dinXTwdl_re_tmp                  : signed(40 DOWNTO 0);  -- sfix41_En18
  SIGNAL dinXTwdl_im_tmp                  : signed(40 DOWNTO 0);  -- sfix41_En18

BEGIN
  din_re_signed <= signed(din_re);

  intdelay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din_re_reg <= to_signed(0, 41);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        din_re_reg <= din_re_signed;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  din_im_signed <= signed(din_im);

  intdelay_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din_im_reg <= to_signed(0, 41);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        din_im_reg <= din_im_signed;
      END IF;
    END IF;
  END PROCESS intdelay_1_process;


  twdl_9_1_re_signed <= signed(twdl_9_1_re);

  intdelay_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      twdl_re_reg <= to_signed(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        twdl_re_reg <= twdl_9_1_re_signed;
      END IF;
    END IF;
  END PROCESS intdelay_2_process;


  twdl_9_1_im_signed <= signed(twdl_9_1_im);

  intdelay_3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      twdl_im_reg <= to_signed(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        twdl_im_reg <= twdl_9_1_im_signed;
      END IF;
    END IF;
  END PROCESS intdelay_3_process;


  -- Complex4Multiply
  Complex4Multiply_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        prod1_re <= Complex4Multiply_mult1_re_pipe1;
        prod2_re <= Complex4Multiply_mult2_re_pipe1;
        prod1_im <= Complex4Multiply_mult1_im_pipe1;
        prod2_im <= Complex4Multiply_mult2_im_pipe1;
        Complex4Multiply_mult1_re_pipe1 <= Complex4Multiply_din1_re_pipe1 * Complex4Multiply_twiddle_re_pipe1;
        Complex4Multiply_mult2_re_pipe1 <= Complex4Multiply_din1_im_pipe1 * Complex4Multiply_twiddle_im_pipe1;
        Complex4Multiply_mult1_im_pipe1 <= Complex4Multiply_din1_re_pipe1 * Complex4Multiply_twiddle_im_pipe1;
        Complex4Multiply_mult2_im_pipe1 <= Complex4Multiply_din1_im_pipe1 * Complex4Multiply_twiddle_re_pipe1;
        Complex4Multiply_twiddle_re_pipe1 <= twdl_re_reg;
        Complex4Multiply_twiddle_im_pipe1 <= twdl_im_reg;
        Complex4Multiply_din1_re_pipe1 <= din_re_reg;
        Complex4Multiply_din1_im_pipe1 <= din_im_reg;
      END IF;
    END IF;
  END PROCESS Complex4Multiply_process;


  intdelay_4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din_vld_dly1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        din_vld_dly1 <= din_9_vld_dly;
      END IF;
    END IF;
  END PROCESS intdelay_4_process;


  intdelay_5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din_vld_dly2 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        din_vld_dly2 <= din_vld_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_5_process;


  intdelay_6_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din_vld_dly3 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        din_vld_dly3 <= din_vld_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_6_process;


  intdelay_7_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      prod_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        prod_vld <= din_vld_dly3;
      END IF;
    END IF;
  END PROCESS intdelay_7_process;


  -- Complex4Add
  Complex4Add_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Complex4Add_multRes_re_reg <= to_signed(0, 74);
      Complex4Add_multRes_im_reg <= to_signed(0, 74);
      Complex4Add_prod1_re_reg <= to_signed(0, 73);
      Complex4Add_prod1_im_reg <= to_signed(0, 73);
      Complex4Add_prod2_re_reg <= to_signed(0, 73);
      Complex4Add_prod2_im_reg <= to_signed(0, 73);
      Complex4Add_prod_vld_reg1 <= '0';
      dinXTwdl_9_1_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Complex4Add_multRes_re_reg <= Complex4Add_multRes_re_reg_next;
        Complex4Add_multRes_im_reg <= Complex4Add_multRes_im_reg_next;
        Complex4Add_prod1_re_reg <= prod1_re;
        Complex4Add_prod1_im_reg <= prod1_im;
        Complex4Add_prod2_re_reg <= prod2_re;
        Complex4Add_prod2_im_reg <= prod2_im;
        dinXTwdl_9_1_vld <= Complex4Add_prod_vld_reg1;
        Complex4Add_prod_vld_reg1 <= prod_vld;
      END IF;
    END IF;
  END PROCESS Complex4Add_process;

  Complex4Add_sub_cast <= resize(Complex4Add_prod1_re_reg, 74);
  Complex4Add_sub_cast_1 <= resize(Complex4Add_prod2_re_reg, 74);
  Complex4Add_multRes_re_reg_next <= Complex4Add_sub_cast - Complex4Add_sub_cast_1;
  Complex4Add_add_cast <= resize(Complex4Add_prod1_im_reg, 74);
  Complex4Add_add_cast_1 <= resize(Complex4Add_prod2_im_reg, 74);
  Complex4Add_multRes_im_reg_next <= Complex4Add_add_cast + Complex4Add_add_cast_1;
  mulResFP_re <= Complex4Add_multRes_re_reg;
  mulResFP_im <= Complex4Add_multRes_im_reg;

  dinXTwdl_re_tmp <= mulResFP_re(70 DOWNTO 30);

  dinXTwdl_re <= std_logic_vector(dinXTwdl_re_tmp);

  dinXTwdl_im_tmp <= mulResFP_im(70 DOWNTO 30);

  dinXTwdl_im <= std_logic_vector(dinXTwdl_im_tmp);

END rtl;

