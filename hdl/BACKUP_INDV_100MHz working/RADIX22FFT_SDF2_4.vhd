-- -------------------------------------------------------------
-- 
-- File Name: /u/home/eraguzin/matlab/LNspec/matlab/codegen/sfft/hdlsrc/RADIX22FFT_SDF2_4.vhd
-- Created: 2023-01-19 10:44:41
-- 
-- Generated by MATLAB 9.12, MATLAB Coder 5.4 and HDL Coder 3.20
-- 
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: RADIX22FFT_SDF2_4
-- Source Path: sfft_fixpt/dsphdl.FFT/RADIX22FFT_SDF2_4
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY RADIX22FFT_SDF2_4 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        dout_3_1_re                       :   IN    std_logic_vector(34 DOWNTO 0);  -- sfix35_En18
        dout_3_1_im                       :   IN    std_logic_vector(34 DOWNTO 0);  -- sfix35_En18
        dout_3_1_vld                      :   IN    std_logic;
        rd_4_Addr                         :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        rd_4_Enb                          :   IN    std_logic;
        proc_4_enb                        :   IN    std_logic;
        multiply_4_J                      :   IN    std_logic;
        softReset                         :   IN    std_logic;
        dout_4_1_re                       :   OUT   std_logic_vector(35 DOWNTO 0);  -- sfix36_En18
        dout_4_1_im                       :   OUT   std_logic_vector(35 DOWNTO 0);  -- sfix36_En18
        dout_4_1_vld                      :   OUT   std_logic;
        dinXTwdl_4_1_vld                  :   OUT   std_logic
        );
END RADIX22FFT_SDF2_4;


ARCHITECTURE rtl OF RADIX22FFT_SDF2_4 IS

  -- Component Declarations
  COMPONENT SimpleDualPortRAM_generic
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb                             :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          rd_dout                         :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  COMPONENT SDFCommutator4
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          dout_3_1_vld                    :   IN    std_logic;
          xf_re                           :   IN    std_logic_vector(35 DOWNTO 0);  -- sfix36_En18
          xf_im                           :   IN    std_logic_vector(35 DOWNTO 0);  -- sfix36_En18
          xf_vld                          :   IN    std_logic;
          dinf_re                         :   IN    std_logic_vector(35 DOWNTO 0);  -- sfix36_En18
          dinf_im                         :   IN    std_logic_vector(35 DOWNTO 0);  -- sfix36_En18
          dinf_vld                        :   IN    std_logic;
          btf1_re                         :   IN    std_logic_vector(35 DOWNTO 0);  -- sfix36_En18
          btf1_im                         :   IN    std_logic_vector(35 DOWNTO 0);  -- sfix36_En18
          btf2_re                         :   IN    std_logic_vector(35 DOWNTO 0);  -- sfix36_En18
          btf2_im                         :   IN    std_logic_vector(35 DOWNTO 0);  -- sfix36_En18
          btfout_vld                      :   IN    std_logic;
          softReset                       :   IN    std_logic;
          wrData_re                       :   OUT   std_logic_vector(35 DOWNTO 0);  -- sfix36_En18
          wrData_im                       :   OUT   std_logic_vector(35 DOWNTO 0);  -- sfix36_En18
          wrAddr                          :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
          wrEnb                           :   OUT   std_logic;
          dout_4_1_re                     :   OUT   std_logic_vector(35 DOWNTO 0);  -- sfix36_En18
          dout_4_1_im                     :   OUT   std_logic_vector(35 DOWNTO 0);  -- sfix36_En18
          dout_4_1_vld                    :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : SimpleDualPortRAM_generic
    USE ENTITY work.SimpleDualPortRAM_generic(rtl);

  FOR ALL : SDFCommutator4
    USE ENTITY work.SDFCommutator4(rtl);

  -- Signals
  SIGNAL dout_3_1_re_signed               : signed(34 DOWNTO 0);  -- sfix35_En18
  SIGNAL din_re                           : signed(35 DOWNTO 0);  -- sfix36_En18
  SIGNAL dout_3_1_im_signed               : signed(34 DOWNTO 0);  -- sfix35_En18
  SIGNAL din_im                           : signed(35 DOWNTO 0);  -- sfix36_En18
  SIGNAL btfin_vld                        : std_logic;
  SIGNAL saveEnb                          : std_logic;
  SIGNAL dinVld                           : std_logic;
  SIGNAL x_vld                            : std_logic;
  SIGNAL x_vld_dly                        : std_logic;
  SIGNAL btf2_im                          : signed(35 DOWNTO 0);  -- sfix36_En18
  SIGNAL btf2_re                          : signed(35 DOWNTO 0);  -- sfix36_En18
  SIGNAL btf1_im                          : signed(35 DOWNTO 0);  -- sfix36_En18
  SIGNAL btf1_re                          : signed(35 DOWNTO 0);  -- sfix36_En18
  SIGNAL dinf_im                          : signed(35 DOWNTO 0);  -- sfix36_En18
  SIGNAL dinf_re                          : signed(35 DOWNTO 0);  -- sfix36_En18
  SIGNAL xf_im                            : signed(35 DOWNTO 0);  -- sfix36_En18
  SIGNAL wrData_im                        : std_logic_vector(35 DOWNTO 0);  -- ufix36
  SIGNAL wrAddr                           : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL wrEnb                            : std_logic;
  SIGNAL x_im                             : std_logic_vector(35 DOWNTO 0);  -- ufix36
  SIGNAL x_im_signed                      : signed(35 DOWNTO 0);  -- sfix36_En18
  SIGNAL x_im_dly                         : signed(35 DOWNTO 0);  -- sfix36_En18
  SIGNAL wrData_re                        : std_logic_vector(35 DOWNTO 0);  -- ufix36
  SIGNAL x_re                             : std_logic_vector(35 DOWNTO 0);  -- ufix36
  SIGNAL x_re_signed                      : signed(35 DOWNTO 0);  -- sfix36_En18
  SIGNAL x_re_dly                         : signed(35 DOWNTO 0);  -- sfix36_En18
  SIGNAL Radix22ButterflyG2_procEnb_dly   : std_logic;
  SIGNAL Radix22ButterflyG2_procEnb_dly1  : std_logic;
  SIGNAL Radix22ButterflyG2_procEnb_dly2  : std_logic;
  SIGNAL Radix22ButterflyG2_btf1_re_reg   : signed(36 DOWNTO 0);  -- sfix37
  SIGNAL Radix22ButterflyG2_btf1_im_reg   : signed(36 DOWNTO 0);  -- sfix37
  SIGNAL Radix22ButterflyG2_btf2_re_reg   : signed(36 DOWNTO 0);  -- sfix37
  SIGNAL Radix22ButterflyG2_btf2_im_reg   : signed(36 DOWNTO 0);  -- sfix37
  SIGNAL Radix22ButterflyG2_din_re_dly    : signed(35 DOWNTO 0);  -- sfix36
  SIGNAL Radix22ButterflyG2_din_im_dly    : signed(35 DOWNTO 0);  -- sfix36
  SIGNAL Radix22ButterflyG2_din_vld_dly   : std_logic;
  SIGNAL Radix22ButterflyG2_x_re_dly      : signed(35 DOWNTO 0);  -- sfix36
  SIGNAL Radix22ButterflyG2_x_im_dly      : signed(35 DOWNTO 0);  -- sfix36
  SIGNAL Radix22ButterflyG2_x_vld_dly     : std_logic;
  SIGNAL Radix22ButterflyG2_dinXTwdl_re_dly1 : signed(35 DOWNTO 0);  -- sfix36
  SIGNAL Radix22ButterflyG2_dinXTwdl_im_dly1 : signed(35 DOWNTO 0);  -- sfix36
  SIGNAL Radix22ButterflyG2_dinXTwdl_re_dly2 : signed(35 DOWNTO 0);  -- sfix36
  SIGNAL Radix22ButterflyG2_dinXTwdl_im_dly2 : signed(35 DOWNTO 0);  -- sfix36
  SIGNAL Radix22ButterflyG2_multiply_J_dly1 : std_logic;
  SIGNAL Radix22ButterflyG2_procEnb_dly_next : std_logic;
  SIGNAL Radix22ButterflyG2_procEnb_dly1_next : std_logic;
  SIGNAL Radix22ButterflyG2_procEnb_dly2_next : std_logic;
  SIGNAL Radix22ButterflyG2_btf1_re_reg_next : signed(36 DOWNTO 0);  -- sfix37_En18
  SIGNAL Radix22ButterflyG2_btf1_im_reg_next : signed(36 DOWNTO 0);  -- sfix37_En18
  SIGNAL Radix22ButterflyG2_btf2_re_reg_next : signed(36 DOWNTO 0);  -- sfix37_En18
  SIGNAL Radix22ButterflyG2_btf2_im_reg_next : signed(36 DOWNTO 0);  -- sfix37_En18
  SIGNAL Radix22ButterflyG2_din_re_dly_next : signed(35 DOWNTO 0);  -- sfix36_En18
  SIGNAL Radix22ButterflyG2_din_im_dly_next : signed(35 DOWNTO 0);  -- sfix36_En18
  SIGNAL Radix22ButterflyG2_din_vld_dly_next : std_logic;
  SIGNAL Radix22ButterflyG2_x_re_dly_next : signed(35 DOWNTO 0);  -- sfix36_En18
  SIGNAL Radix22ButterflyG2_x_im_dly_next : signed(35 DOWNTO 0);  -- sfix36_En18
  SIGNAL Radix22ButterflyG2_x_vld_dly_next : std_logic;
  SIGNAL Radix22ButterflyG2_dinXTwdl_re_dly1_next : signed(35 DOWNTO 0);  -- sfix36_En18
  SIGNAL Radix22ButterflyG2_dinXTwdl_im_dly1_next : signed(35 DOWNTO 0);  -- sfix36_En18
  SIGNAL Radix22ButterflyG2_dinXTwdl_re_dly2_next : signed(35 DOWNTO 0);  -- sfix36_En18
  SIGNAL Radix22ButterflyG2_dinXTwdl_im_dly2_next : signed(35 DOWNTO 0);  -- sfix36_En18
  SIGNAL Radix22ButterflyG2_multiply_J_dly1_next : std_logic;
  SIGNAL xf_re                            : signed(35 DOWNTO 0);  -- sfix36_En18
  SIGNAL xf_vld                           : std_logic;
  SIGNAL dinf_vld                         : std_logic;
  SIGNAL btfout_vld                       : std_logic;
  SIGNAL dout_4_1_re_tmp                  : std_logic_vector(35 DOWNTO 0);  -- ufix36
  SIGNAL dout_4_1_im_tmp                  : std_logic_vector(35 DOWNTO 0);  -- ufix36

BEGIN
  u_dataMEM_im_0_4 : SimpleDualPortRAM_generic
    GENERIC MAP( AddrWidth => 8,
                 DataWidth => 36
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => wrData_im,
              wr_addr => wrAddr,
              wr_en => wrEnb,
              rd_addr => rd_4_Addr,
              rd_dout => x_im
              );

  u_dataMEM_re_0_4 : SimpleDualPortRAM_generic
    GENERIC MAP( AddrWidth => 8,
                 DataWidth => 36
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => wrData_re,
              wr_addr => wrAddr,
              wr_en => wrEnb,
              rd_addr => rd_4_Addr,
              rd_dout => x_re
              );

  u_SDFCOMMUTATOR_4 : SDFCommutator4
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              dout_3_1_vld => dout_3_1_vld,
              xf_re => std_logic_vector(xf_re),  -- sfix36_En18
              xf_im => std_logic_vector(xf_im),  -- sfix36_En18
              xf_vld => xf_vld,
              dinf_re => std_logic_vector(dinf_re),  -- sfix36_En18
              dinf_im => std_logic_vector(dinf_im),  -- sfix36_En18
              dinf_vld => dinf_vld,
              btf1_re => std_logic_vector(btf1_re),  -- sfix36_En18
              btf1_im => std_logic_vector(btf1_im),  -- sfix36_En18
              btf2_re => std_logic_vector(btf2_re),  -- sfix36_En18
              btf2_im => std_logic_vector(btf2_im),  -- sfix36_En18
              btfout_vld => btfout_vld,
              softReset => softReset,
              wrData_re => wrData_re,  -- sfix36_En18
              wrData_im => wrData_im,  -- sfix36_En18
              wrAddr => wrAddr,  -- ufix8
              wrEnb => wrEnb,
              dout_4_1_re => dout_4_1_re_tmp,  -- sfix36_En18
              dout_4_1_im => dout_4_1_im_tmp,  -- sfix36_En18
              dout_4_1_vld => dout_4_1_vld
              );

  dout_3_1_re_signed <= signed(dout_3_1_re);

  din_re <= resize(dout_3_1_re_signed, 36);

  dout_3_1_im_signed <= signed(dout_3_1_im);

  din_im <= resize(dout_3_1_im_signed, 36);

  btfin_vld <= dout_3_1_vld AND proc_4_enb;

  saveEnb <=  NOT btfin_vld;

  dinVld <= dout_3_1_vld AND saveEnb;

  intdelay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      x_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        x_vld <= rd_4_Enb;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  intdelay_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      x_vld_dly <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        x_vld_dly <= x_vld;
      END IF;
    END IF;
  END PROCESS intdelay_1_process;


  x_im_signed <= signed(x_im);

  intdelay_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      x_im_dly <= to_signed(0, 36);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        x_im_dly <= x_im_signed;
      END IF;
    END IF;
  END PROCESS intdelay_2_process;


  x_re_signed <= signed(x_re);

  intdelay_3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      x_re_dly <= to_signed(0, 36);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        x_re_dly <= x_re_signed;
      END IF;
    END IF;
  END PROCESS intdelay_3_process;


  -- Radix22ButterflyG2
  Radix22ButterflyG2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Radix22ButterflyG2_procEnb_dly <= '0';
      Radix22ButterflyG2_procEnb_dly1 <= '0';
      Radix22ButterflyG2_procEnb_dly2 <= '0';
      Radix22ButterflyG2_btf1_re_reg <= to_signed(0, 37);
      Radix22ButterflyG2_btf1_im_reg <= to_signed(0, 37);
      Radix22ButterflyG2_btf2_re_reg <= to_signed(0, 37);
      Radix22ButterflyG2_btf2_im_reg <= to_signed(0, 37);
      Radix22ButterflyG2_din_re_dly <= to_signed(0, 36);
      Radix22ButterflyG2_din_im_dly <= to_signed(0, 36);
      Radix22ButterflyG2_din_vld_dly <= '0';
      Radix22ButterflyG2_x_re_dly <= to_signed(0, 36);
      Radix22ButterflyG2_x_im_dly <= to_signed(0, 36);
      Radix22ButterflyG2_x_vld_dly <= '0';
      Radix22ButterflyG2_dinXTwdl_re_dly1 <= to_signed(0, 36);
      Radix22ButterflyG2_dinXTwdl_im_dly1 <= to_signed(0, 36);
      Radix22ButterflyG2_dinXTwdl_re_dly2 <= to_signed(0, 36);
      Radix22ButterflyG2_dinXTwdl_im_dly2 <= to_signed(0, 36);
      Radix22ButterflyG2_multiply_J_dly1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Radix22ButterflyG2_procEnb_dly <= Radix22ButterflyG2_procEnb_dly_next;
        Radix22ButterflyG2_procEnb_dly1 <= Radix22ButterflyG2_procEnb_dly1_next;
        Radix22ButterflyG2_procEnb_dly2 <= Radix22ButterflyG2_procEnb_dly2_next;
        Radix22ButterflyG2_btf1_re_reg <= Radix22ButterflyG2_btf1_re_reg_next;
        Radix22ButterflyG2_btf1_im_reg <= Radix22ButterflyG2_btf1_im_reg_next;
        Radix22ButterflyG2_btf2_re_reg <= Radix22ButterflyG2_btf2_re_reg_next;
        Radix22ButterflyG2_btf2_im_reg <= Radix22ButterflyG2_btf2_im_reg_next;
        Radix22ButterflyG2_din_re_dly <= Radix22ButterflyG2_din_re_dly_next;
        Radix22ButterflyG2_din_im_dly <= Radix22ButterflyG2_din_im_dly_next;
        Radix22ButterflyG2_din_vld_dly <= Radix22ButterflyG2_din_vld_dly_next;
        Radix22ButterflyG2_x_re_dly <= Radix22ButterflyG2_x_re_dly_next;
        Radix22ButterflyG2_x_im_dly <= Radix22ButterflyG2_x_im_dly_next;
        Radix22ButterflyG2_x_vld_dly <= Radix22ButterflyG2_x_vld_dly_next;
        Radix22ButterflyG2_dinXTwdl_re_dly1 <= Radix22ButterflyG2_dinXTwdl_re_dly1_next;
        Radix22ButterflyG2_dinXTwdl_im_dly1 <= Radix22ButterflyG2_dinXTwdl_im_dly1_next;
        Radix22ButterflyG2_dinXTwdl_re_dly2 <= Radix22ButterflyG2_dinXTwdl_re_dly2_next;
        Radix22ButterflyG2_dinXTwdl_im_dly2 <= Radix22ButterflyG2_dinXTwdl_im_dly2_next;
        Radix22ButterflyG2_multiply_J_dly1 <= Radix22ButterflyG2_multiply_J_dly1_next;
      END IF;
    END IF;
  END PROCESS Radix22ButterflyG2_process;

  Radix22ButterflyG2_output : PROCESS (Radix22ButterflyG2_btf1_im_reg, Radix22ButterflyG2_btf1_re_reg,
       Radix22ButterflyG2_btf2_im_reg, Radix22ButterflyG2_btf2_re_reg,
       Radix22ButterflyG2_dinXTwdl_im_dly1, Radix22ButterflyG2_dinXTwdl_im_dly2,
       Radix22ButterflyG2_dinXTwdl_re_dly1, Radix22ButterflyG2_dinXTwdl_re_dly2,
       Radix22ButterflyG2_din_im_dly, Radix22ButterflyG2_din_re_dly,
       Radix22ButterflyG2_din_vld_dly, Radix22ButterflyG2_multiply_J_dly1,
       Radix22ButterflyG2_procEnb_dly, Radix22ButterflyG2_procEnb_dly1,
       Radix22ButterflyG2_procEnb_dly2, Radix22ButterflyG2_x_im_dly,
       Radix22ButterflyG2_x_re_dly, Radix22ButterflyG2_x_vld_dly, btfin_vld,
       dinVld, din_im, din_re, multiply_4_J, x_im_dly, x_re_dly, x_vld_dly)
    VARIABLE add_cast : signed(36 DOWNTO 0);
    VARIABLE add_cast_0 : signed(36 DOWNTO 0);
    VARIABLE add_cast_1 : signed(36 DOWNTO 0);
    VARIABLE add_cast_2 : signed(36 DOWNTO 0);
    VARIABLE sub_cast : signed(36 DOWNTO 0);
    VARIABLE sub_cast_0 : signed(36 DOWNTO 0);
    VARIABLE sub_cast_1 : signed(36 DOWNTO 0);
    VARIABLE sub_cast_2 : signed(36 DOWNTO 0);
    VARIABLE add_cast_3 : signed(36 DOWNTO 0);
    VARIABLE add_cast_4 : signed(36 DOWNTO 0);
    VARIABLE add_cast_5 : signed(36 DOWNTO 0);
    VARIABLE add_cast_6 : signed(36 DOWNTO 0);
    VARIABLE sub_cast_3 : signed(36 DOWNTO 0);
    VARIABLE sub_cast_4 : signed(36 DOWNTO 0);
    VARIABLE sub_cast_5 : signed(36 DOWNTO 0);
    VARIABLE sub_cast_6 : signed(36 DOWNTO 0);
  BEGIN
    add_cast := to_signed(0, 37);
    add_cast_0 := to_signed(0, 37);
    add_cast_1 := to_signed(0, 37);
    add_cast_2 := to_signed(0, 37);
    sub_cast := to_signed(0, 37);
    sub_cast_0 := to_signed(0, 37);
    sub_cast_1 := to_signed(0, 37);
    sub_cast_2 := to_signed(0, 37);
    add_cast_3 := to_signed(0, 37);
    add_cast_4 := to_signed(0, 37);
    add_cast_5 := to_signed(0, 37);
    add_cast_6 := to_signed(0, 37);
    sub_cast_3 := to_signed(0, 37);
    sub_cast_4 := to_signed(0, 37);
    sub_cast_5 := to_signed(0, 37);
    sub_cast_6 := to_signed(0, 37);
    Radix22ButterflyG2_btf1_re_reg_next <= Radix22ButterflyG2_btf1_re_reg;
    Radix22ButterflyG2_btf1_im_reg_next <= Radix22ButterflyG2_btf1_im_reg;
    Radix22ButterflyG2_btf2_re_reg_next <= Radix22ButterflyG2_btf2_re_reg;
    Radix22ButterflyG2_btf2_im_reg_next <= Radix22ButterflyG2_btf2_im_reg;
    Radix22ButterflyG2_x_re_dly_next <= x_re_dly;
    Radix22ButterflyG2_x_im_dly_next <= x_im_dly;
    Radix22ButterflyG2_x_vld_dly_next <= x_vld_dly;
    Radix22ButterflyG2_din_re_dly_next <= din_re;
    Radix22ButterflyG2_din_im_dly_next <= din_im;
    Radix22ButterflyG2_din_vld_dly_next <= dinVld;
    Radix22ButterflyG2_procEnb_dly2_next <= Radix22ButterflyG2_procEnb_dly1;
    Radix22ButterflyG2_procEnb_dly1_next <= Radix22ButterflyG2_procEnb_dly;
    Radix22ButterflyG2_procEnb_dly_next <= btfin_vld;
    IF Radix22ButterflyG2_multiply_J_dly1 = '1' THEN 
      add_cast_1 := resize(x_re_dly, 37);
      add_cast_2 := resize(Radix22ButterflyG2_dinXTwdl_im_dly2, 37);
      Radix22ButterflyG2_btf1_re_reg_next <= add_cast_1 + add_cast_2;
      sub_cast_1 := resize(x_re_dly, 37);
      sub_cast_2 := resize(Radix22ButterflyG2_dinXTwdl_im_dly2, 37);
      Radix22ButterflyG2_btf2_re_reg_next <= sub_cast_1 - sub_cast_2;
      add_cast_5 := resize(x_im_dly, 37);
      add_cast_6 := resize(Radix22ButterflyG2_dinXTwdl_re_dly2, 37);
      Radix22ButterflyG2_btf2_im_reg_next <= add_cast_5 + add_cast_6;
      sub_cast_5 := resize(x_im_dly, 37);
      sub_cast_6 := resize(Radix22ButterflyG2_dinXTwdl_re_dly2, 37);
      Radix22ButterflyG2_btf1_im_reg_next <= sub_cast_5 - sub_cast_6;
    ELSE 
      add_cast := resize(x_re_dly, 37);
      add_cast_0 := resize(Radix22ButterflyG2_dinXTwdl_re_dly2, 37);
      Radix22ButterflyG2_btf1_re_reg_next <= add_cast + add_cast_0;
      sub_cast := resize(x_re_dly, 37);
      sub_cast_0 := resize(Radix22ButterflyG2_dinXTwdl_re_dly2, 37);
      Radix22ButterflyG2_btf2_re_reg_next <= sub_cast - sub_cast_0;
      add_cast_3 := resize(x_im_dly, 37);
      add_cast_4 := resize(Radix22ButterflyG2_dinXTwdl_im_dly2, 37);
      Radix22ButterflyG2_btf1_im_reg_next <= add_cast_3 + add_cast_4;
      sub_cast_3 := resize(x_im_dly, 37);
      sub_cast_4 := resize(Radix22ButterflyG2_dinXTwdl_im_dly2, 37);
      Radix22ButterflyG2_btf2_im_reg_next <= sub_cast_3 - sub_cast_4;
    END IF;
    Radix22ButterflyG2_dinXTwdl_re_dly2_next <= Radix22ButterflyG2_dinXTwdl_re_dly1;
    Radix22ButterflyG2_dinXTwdl_im_dly2_next <= Radix22ButterflyG2_dinXTwdl_im_dly1;
    Radix22ButterflyG2_dinXTwdl_re_dly1_next <= din_re;
    Radix22ButterflyG2_dinXTwdl_im_dly1_next <= din_im;
    Radix22ButterflyG2_multiply_J_dly1_next <= multiply_4_J;
    xf_re <= Radix22ButterflyG2_x_re_dly;
    xf_im <= Radix22ButterflyG2_x_im_dly;
    xf_vld <= Radix22ButterflyG2_x_vld_dly;
    dinf_re <= Radix22ButterflyG2_din_re_dly;
    dinf_im <= Radix22ButterflyG2_din_im_dly;
    dinf_vld <= Radix22ButterflyG2_din_vld_dly;
    btf1_re <= Radix22ButterflyG2_btf1_re_reg(35 DOWNTO 0);
    btf1_im <= Radix22ButterflyG2_btf1_im_reg(35 DOWNTO 0);
    btf2_re <= Radix22ButterflyG2_btf2_re_reg(35 DOWNTO 0);
    btf2_im <= Radix22ButterflyG2_btf2_im_reg(35 DOWNTO 0);
    btfout_vld <= Radix22ButterflyG2_procEnb_dly2;
  END PROCESS Radix22ButterflyG2_output;


  dinXTwdl_4_1_vld <= btfin_vld;

  dout_4_1_re <= dout_4_1_re_tmp;

  dout_4_1_im <= dout_4_1_im_tmp;

END rtl;

