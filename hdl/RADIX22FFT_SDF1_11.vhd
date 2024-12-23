-- -------------------------------------------------------------
-- 
-- File Name: /u/home/eraguzin/matlab/LNspec/matlab/codegen/sfft/hdlsrc/RADIX22FFT_SDF1_11.vhd
-- Created: 2023-02-06 14:23:14
-- 
-- Generated by MATLAB 9.12, MATLAB Coder 5.4 and HDL Coder 3.20
-- 
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: RADIX22FFT_SDF1_11
-- Source Path: sfft_fixpt/dsphdl.FFT/RADIX22FFT_SDF1_11
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY RADIX22FFT_SDF1_11 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        din_11_1_re_dly                   :   IN    std_logic_vector(41 DOWNTO 0);  -- sfix42_En18
        din_11_1_im_dly                   :   IN    std_logic_vector(41 DOWNTO 0);  -- sfix42_En18
        din_11_vld_dly                    :   IN    std_logic;
        rd_11_Addr                        :   IN    std_logic;  -- ufix1
        rd_11_Enb                         :   IN    std_logic;
        twdl_11_1_re                      :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En30
        twdl_11_1_im                      :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En30
        twdl_11_1_vld                     :   IN    std_logic;
        proc_11_enb                       :   IN    std_logic;
        softReset                         :   IN    std_logic;
        dout_11_1_re                      :   OUT   std_logic_vector(42 DOWNTO 0);  -- sfix43_En18
        dout_11_1_im                      :   OUT   std_logic_vector(42 DOWNTO 0);  -- sfix43_En18
        dout_11_1_vld                     :   OUT   std_logic;
        dinXTwdl_11_1_vld                 :   OUT   std_logic
        );
END RADIX22FFT_SDF1_11;


ARCHITECTURE rtl OF RADIX22FFT_SDF1_11 IS

  -- Component Declarations
  COMPONENT Complex4Multiply_generic
    generic(
      size : integer := 42
      );
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          din_re                          :   IN    std_logic_vector(42 DOWNTO 0);  -- sfix43_En18
          din_im                          :   IN    std_logic_vector(42 DOWNTO 0);  -- sfix43_En18
          vld_in                          :   IN    std_logic;
          twdl_re                         :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En30
          twdl_im                         :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En30
          softReset                       :   IN    std_logic;
          dinXTwdl_re                     :   OUT   std_logic_vector(42 DOWNTO 0);  -- sfix43_En18
          dinXTwdl_im                     :   OUT   std_logic_vector(42 DOWNTO 0);  -- sfix43_En18
          vld_out                         :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT SDFCommutator11
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          din_11_vld_dly                  :   IN    std_logic;
          xf_re                           :   IN    std_logic_vector(42 DOWNTO 0);  -- sfix43_En18
          xf_im                           :   IN    std_logic_vector(42 DOWNTO 0);  -- sfix43_En18
          xf_vld                          :   IN    std_logic;
          dinXTwdlf_re                    :   IN    std_logic_vector(42 DOWNTO 0);  -- sfix43_En18
          dinXTwdlf_im                    :   IN    std_logic_vector(42 DOWNTO 0);  -- sfix43_En18
          dinxTwdlf_vld                   :   IN    std_logic;
          btf1_re                         :   IN    std_logic_vector(42 DOWNTO 0);  -- sfix43_En18
          btf1_im                         :   IN    std_logic_vector(42 DOWNTO 0);  -- sfix43_En18
          btf2_re                         :   IN    std_logic_vector(42 DOWNTO 0);  -- sfix43_En18
          btf2_im                         :   IN    std_logic_vector(42 DOWNTO 0);  -- sfix43_En18
          btf_vld                         :   IN    std_logic;
          softReset                       :   IN    std_logic;
          wrData_re                       :   OUT   std_logic_vector(42 DOWNTO 0);  -- sfix43_En18
          wrData_im                       :   OUT   std_logic_vector(42 DOWNTO 0);  -- sfix43_En18
          wrAddr                          :   OUT   std_logic;  -- ufix1
          wrEnb                           :   OUT   std_logic;
          dout_11_1_re                    :   OUT   std_logic_vector(42 DOWNTO 0);  -- sfix43_En18
          dout_11_1_im                    :   OUT   std_logic_vector(42 DOWNTO 0);  -- sfix43_En18
          dout_11_1_vld                   :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : Complex4Multiply_generic
    USE ENTITY work.Complex4Multiply_generic(rtl);

  FOR ALL : SDFCommutator11
    USE ENTITY work.SDFCommutator11(rtl);

  -- Signals
  SIGNAL din_11_1_re_dly_signed           : signed(41 DOWNTO 0);  -- sfix42_En18
  SIGNAL din_re                           : signed(42 DOWNTO 0);  -- sfix43_En18
  SIGNAL din_11_1_im_dly_signed           : signed(41 DOWNTO 0);  -- sfix42_En18
  SIGNAL din_im                           : signed(42 DOWNTO 0);  -- sfix43_En18
  SIGNAL dinXTwdl_re                      : std_logic_vector(42 DOWNTO 0);  -- ufix43
  SIGNAL dinXTwdl_im                      : std_logic_vector(42 DOWNTO 0);  -- ufix43
  SIGNAL dinXTwdl_11_1_vld_1              : std_logic;
  SIGNAL dinXTwdl_re_signed               : signed(42 DOWNTO 0);  -- sfix43_En18
  SIGNAL dinXTwdl_im_signed               : signed(42 DOWNTO 0);  -- sfix43_En18
  SIGNAL x_vld                            : std_logic;
  SIGNAL btf2_im                          : signed(42 DOWNTO 0);  -- sfix43_En18
  SIGNAL btf2_re                          : signed(42 DOWNTO 0);  -- sfix43_En18
  SIGNAL btf1_im                          : signed(42 DOWNTO 0);  -- sfix43_En18
  SIGNAL btf1_re                          : signed(42 DOWNTO 0);  -- sfix43_En18
  SIGNAL dinXTwdlf_im                     : signed(42 DOWNTO 0);  -- sfix43_En18
  SIGNAL dinXTwdlf_re                     : signed(42 DOWNTO 0);  -- sfix43_En18
  SIGNAL xf_im                            : signed(42 DOWNTO 0);  -- sfix43_En18
  SIGNAL wrData_im                        : std_logic_vector(42 DOWNTO 0);  -- ufix43
  SIGNAL wrData_im_signed                 : signed(42 DOWNTO 0);  -- sfix43_En18
  SIGNAL wrData_re                        : std_logic_vector(42 DOWNTO 0);  -- ufix43
  SIGNAL wrData_re_signed                 : signed(42 DOWNTO 0);  -- sfix43_En18
  SIGNAL wrAddr                           : std_logic;  -- ufix1
  SIGNAL wrEnb                            : std_logic;
  SIGNAL twoLocationReg_0_MEM_re_0        : signed(42 DOWNTO 0);  -- sfix43
  SIGNAL twoLocationReg_0_MEM_im_0        : signed(42 DOWNTO 0);  -- sfix43
  SIGNAL twoLocationReg_0_MEM_re_1        : signed(42 DOWNTO 0);  -- sfix43
  SIGNAL twoLocationReg_0_MEM_im_1        : signed(42 DOWNTO 0);  -- sfix43
  SIGNAL twoLocationReg_0_dout_re_reg     : signed(42 DOWNTO 0);  -- sfix43
  SIGNAL twoLocationReg_0_dout_im_reg     : signed(42 DOWNTO 0);  -- sfix43
  SIGNAL twoLocationReg_0_MEM_re_0_next   : signed(42 DOWNTO 0);  -- sfix43_En18
  SIGNAL twoLocationReg_0_MEM_im_0_next   : signed(42 DOWNTO 0);  -- sfix43_En18
  SIGNAL twoLocationReg_0_MEM_re_1_next   : signed(42 DOWNTO 0);  -- sfix43_En18
  SIGNAL twoLocationReg_0_MEM_im_1_next   : signed(42 DOWNTO 0);  -- sfix43_En18
  SIGNAL twoLocationReg_0_dout_re_reg_next : signed(42 DOWNTO 0);  -- sfix43_En18
  SIGNAL twoLocationReg_0_dout_im_reg_next : signed(42 DOWNTO 0);  -- sfix43_En18
  SIGNAL x_re                             : signed(42 DOWNTO 0);  -- sfix43_En18
  SIGNAL x_im                             : signed(42 DOWNTO 0);  -- sfix43_En18
  SIGNAL Radix22ButterflyG1_btf1_re_reg   : signed(43 DOWNTO 0);  -- sfix44
  SIGNAL Radix22ButterflyG1_btf1_im_reg   : signed(43 DOWNTO 0);  -- sfix44
  SIGNAL Radix22ButterflyG1_btf2_re_reg   : signed(43 DOWNTO 0);  -- sfix44
  SIGNAL Radix22ButterflyG1_btf2_im_reg   : signed(43 DOWNTO 0);  -- sfix44
  SIGNAL Radix22ButterflyG1_x_re_dly1     : signed(42 DOWNTO 0);  -- sfix43
  SIGNAL Radix22ButterflyG1_x_im_dly1     : signed(42 DOWNTO 0);  -- sfix43
  SIGNAL Radix22ButterflyG1_x_vld_dly1    : std_logic;
  SIGNAL Radix22ButterflyG1_dinXtwdl_re_dly1 : signed(42 DOWNTO 0);  -- sfix43
  SIGNAL Radix22ButterflyG1_dinXtwdl_im_dly1 : signed(42 DOWNTO 0);  -- sfix43
  SIGNAL Radix22ButterflyG1_dinXtwdl_re_dly2 : signed(42 DOWNTO 0);  -- sfix43
  SIGNAL Radix22ButterflyG1_dinXtwdl_im_dly2 : signed(42 DOWNTO 0);  -- sfix43
  SIGNAL Radix22ButterflyG1_dinXtwdl_vld_dly1 : std_logic;
  SIGNAL Radix22ButterflyG1_dinXtwdl_vld_dly2 : std_logic;
  SIGNAL Radix22ButterflyG1_btf1_re_reg_next : signed(43 DOWNTO 0);  -- sfix44_En18
  SIGNAL Radix22ButterflyG1_btf1_im_reg_next : signed(43 DOWNTO 0);  -- sfix44_En18
  SIGNAL Radix22ButterflyG1_btf2_re_reg_next : signed(43 DOWNTO 0);  -- sfix44_En18
  SIGNAL Radix22ButterflyG1_btf2_im_reg_next : signed(43 DOWNTO 0);  -- sfix44_En18
  SIGNAL Radix22ButterflyG1_add_cast      : signed(43 DOWNTO 0);  -- sfix44_En18
  SIGNAL Radix22ButterflyG1_add_cast_1    : signed(43 DOWNTO 0);  -- sfix44_En18
  SIGNAL Radix22ButterflyG1_sub_cast      : signed(43 DOWNTO 0);  -- sfix44_En18
  SIGNAL Radix22ButterflyG1_sub_cast_1    : signed(43 DOWNTO 0);  -- sfix44_En18
  SIGNAL Radix22ButterflyG1_add_cast_2    : signed(43 DOWNTO 0);  -- sfix44_En18
  SIGNAL Radix22ButterflyG1_add_cast_3    : signed(43 DOWNTO 0);  -- sfix44_En18
  SIGNAL Radix22ButterflyG1_sub_cast_2    : signed(43 DOWNTO 0);  -- sfix44_En18
  SIGNAL Radix22ButterflyG1_sub_cast_3    : signed(43 DOWNTO 0);  -- sfix44_En18
  SIGNAL xf_re                            : signed(42 DOWNTO 0);  -- sfix43_En18
  SIGNAL xf_vld                           : std_logic;
  SIGNAL dinxTwdlf_vld                    : std_logic;
  SIGNAL btf_vld                          : std_logic;
  SIGNAL dout_11_1_re_tmp                 : std_logic_vector(42 DOWNTO 0);  -- ufix43
  SIGNAL dout_11_1_im_tmp                 : std_logic_vector(42 DOWNTO 0);  -- ufix43
  signal din_11_vld_dly_r                   : std_logic_vector(15 DOWNTO 0);
  
BEGIN
  u_MUL4 : Complex4Multiply_generic
    generic map(
            size => 42)
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              din_re => std_logic_vector(din_re),  -- sfix43_En18
              din_im => std_logic_vector(din_im),  -- sfix43_En18
              vld_in => din_11_vld_dly,
              twdl_re => twdl_11_1_re,  -- sfix32_En30
              twdl_im => twdl_11_1_im,  -- sfix32_En30
              softReset => softReset,
              dinXTwdl_re => dinXTwdl_re,  -- sfix43_En18
              dinXTwdl_im => dinXTwdl_im,  -- sfix43_En18
              vld_out => dinXTwdl_11_1_vld_1
              );
              

              
              
              

  u_SDFCOMMUTATOR_11 : SDFCommutator11
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              din_11_vld_dly => din_11_vld_dly,
              xf_re => std_logic_vector(xf_re),  -- sfix43_En18
              xf_im => std_logic_vector(xf_im),  -- sfix43_En18
              xf_vld => xf_vld,
              dinXTwdlf_re => std_logic_vector(dinXTwdlf_re),  -- sfix43_En18
              dinXTwdlf_im => std_logic_vector(dinXTwdlf_im),  -- sfix43_En18
              dinxTwdlf_vld => dinxTwdlf_vld,
              btf1_re => std_logic_vector(btf1_re),  -- sfix43_En18
              btf1_im => std_logic_vector(btf1_im),  -- sfix43_En18
              btf2_re => std_logic_vector(btf2_re),  -- sfix43_En18
              btf2_im => std_logic_vector(btf2_im),  -- sfix43_En18
              btf_vld => btf_vld,
              softReset => softReset,
              wrData_re => wrData_re,  -- sfix43_En18
              wrData_im => wrData_im,  -- sfix43_En18
              wrAddr => wrAddr,  -- ufix1
              wrEnb => wrEnb,
              dout_11_1_re => dout_11_1_re_tmp,  -- sfix43_En18
              dout_11_1_im => dout_11_1_im_tmp,  -- sfix43_En18
              dout_11_1_vld => dout_11_1_vld
              );

  din_11_1_re_dly_signed <= signed(din_11_1_re_dly);

  din_re <= resize(din_11_1_re_dly_signed, 43);

  din_11_1_im_dly_signed <= signed(din_11_1_im_dly);

  din_im <= resize(din_11_1_im_dly_signed, 43);

  dinXTwdl_re_signed <= signed(dinXTwdl_re);

  dinXTwdl_im_signed <= signed(dinXTwdl_im);

  intdelay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      x_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
   --   IF enb = '1' THEN
        x_vld <= rd_11_Enb;
   --   END IF;
    END IF;
  END PROCESS intdelay_process;


  wrData_im_signed <= signed(wrData_im);

  wrData_re_signed <= signed(wrData_re);

  -- twoLocationReg_0
  twoLocationReg_0_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      twoLocationReg_0_MEM_re_0 <= to_signed(0, 43);
      twoLocationReg_0_MEM_im_0 <= to_signed(0, 43);
      twoLocationReg_0_MEM_re_1 <= to_signed(0, 43);
      twoLocationReg_0_MEM_im_1 <= to_signed(0, 43);
      twoLocationReg_0_dout_re_reg <= to_signed(0, 43);
      twoLocationReg_0_dout_im_reg <= to_signed(0, 43);
    ELSIF clk'EVENT AND clk = '1' THEN
  --    IF enb = '1' THEN
        twoLocationReg_0_MEM_re_0 <= twoLocationReg_0_MEM_re_0_next;
        twoLocationReg_0_MEM_im_0 <= twoLocationReg_0_MEM_im_0_next;
        twoLocationReg_0_MEM_re_1 <= twoLocationReg_0_MEM_re_1_next;
        twoLocationReg_0_MEM_im_1 <= twoLocationReg_0_MEM_im_1_next;
        twoLocationReg_0_dout_re_reg <= twoLocationReg_0_dout_re_reg_next;
        twoLocationReg_0_dout_im_reg <= twoLocationReg_0_dout_im_reg_next;
   --   END IF;
    END IF;
  END PROCESS twoLocationReg_0_process;

  twoLocationReg_0_output : PROCESS (rd_11_Addr, twoLocationReg_0_MEM_im_0, twoLocationReg_0_MEM_im_1,
       twoLocationReg_0_MEM_re_0, twoLocationReg_0_MEM_re_1,
       twoLocationReg_0_dout_im_reg, twoLocationReg_0_dout_re_reg, wrAddr,
       wrData_im_signed, wrData_re_signed, wrEnb)
  BEGIN
    twoLocationReg_0_MEM_re_0_next <= twoLocationReg_0_MEM_re_0;
    twoLocationReg_0_MEM_im_0_next <= twoLocationReg_0_MEM_im_0;
    twoLocationReg_0_MEM_re_1_next <= twoLocationReg_0_MEM_re_1;
    twoLocationReg_0_MEM_im_1_next <= twoLocationReg_0_MEM_im_1;
    twoLocationReg_0_dout_re_reg_next <= twoLocationReg_0_dout_re_reg;
    twoLocationReg_0_dout_im_reg_next <= twoLocationReg_0_dout_im_reg;
    IF rd_11_Addr = '1' THEN 
      twoLocationReg_0_dout_re_reg_next <= twoLocationReg_0_MEM_re_1;
      twoLocationReg_0_dout_im_reg_next <= twoLocationReg_0_MEM_im_1;
    ELSE 
      twoLocationReg_0_dout_re_reg_next <= twoLocationReg_0_MEM_re_0;
      twoLocationReg_0_dout_im_reg_next <= twoLocationReg_0_MEM_im_0;
    END IF;
    IF wrEnb = '1' THEN 
      IF wrAddr = '1' THEN 
        twoLocationReg_0_MEM_re_1_next <= wrData_re_signed;
        twoLocationReg_0_MEM_im_1_next <= wrData_im_signed;
      ELSE 
        twoLocationReg_0_MEM_re_0_next <= wrData_re_signed;
        twoLocationReg_0_MEM_im_0_next <= wrData_im_signed;
      END IF;
    END IF;
    x_re <= twoLocationReg_0_dout_re_reg;
    x_im <= twoLocationReg_0_dout_im_reg;
  END PROCESS twoLocationReg_0_output;


  -- Radix22ButterflyG1
  Radix22ButterflyG1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Radix22ButterflyG1_btf1_re_reg <= to_signed(0, 44);
      Radix22ButterflyG1_btf1_im_reg <= to_signed(0, 44);
      Radix22ButterflyG1_btf2_re_reg <= to_signed(0, 44);
      Radix22ButterflyG1_btf2_im_reg <= to_signed(0, 44);
      Radix22ButterflyG1_x_re_dly1 <= to_signed(0, 43);
      Radix22ButterflyG1_x_im_dly1 <= to_signed(0, 43);
      Radix22ButterflyG1_x_vld_dly1 <= '0';
      xf_re <= to_signed(0, 43);
      xf_im <= to_signed(0, 43);
      xf_vld <= '0';
      Radix22ButterflyG1_dinXtwdl_re_dly1 <= to_signed(0, 43);
      Radix22ButterflyG1_dinXtwdl_im_dly1 <= to_signed(0, 43);
      Radix22ButterflyG1_dinXtwdl_re_dly2 <= to_signed(0, 43);
      Radix22ButterflyG1_dinXtwdl_im_dly2 <= to_signed(0, 43);
      Radix22ButterflyG1_dinXtwdl_vld_dly1 <= '0';
      Radix22ButterflyG1_dinXtwdl_vld_dly2 <= '0';
      btf_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
    --  IF enb = '1' THEN
        Radix22ButterflyG1_btf1_re_reg <= Radix22ButterflyG1_btf1_re_reg_next;
        Radix22ButterflyG1_btf1_im_reg <= Radix22ButterflyG1_btf1_im_reg_next;
        Radix22ButterflyG1_btf2_re_reg <= Radix22ButterflyG1_btf2_re_reg_next;
        Radix22ButterflyG1_btf2_im_reg <= Radix22ButterflyG1_btf2_im_reg_next;
        xf_re <= Radix22ButterflyG1_x_re_dly1;
        xf_im <= Radix22ButterflyG1_x_im_dly1;
        xf_vld <= Radix22ButterflyG1_x_vld_dly1;
        btf_vld <= Radix22ButterflyG1_dinXtwdl_vld_dly2;
        Radix22ButterflyG1_dinXtwdl_vld_dly2 <= Radix22ButterflyG1_dinXtwdl_vld_dly1;
        Radix22ButterflyG1_dinXtwdl_re_dly2 <= Radix22ButterflyG1_dinXtwdl_re_dly1;
        Radix22ButterflyG1_dinXtwdl_im_dly2 <= Radix22ButterflyG1_dinXtwdl_im_dly1;
        Radix22ButterflyG1_dinXtwdl_re_dly1 <= dinXTwdl_re_signed;
        Radix22ButterflyG1_dinXtwdl_im_dly1 <= dinXTwdl_im_signed;
        Radix22ButterflyG1_x_re_dly1 <= x_re;
        Radix22ButterflyG1_x_im_dly1 <= x_im;
        Radix22ButterflyG1_x_vld_dly1 <= x_vld;
        Radix22ButterflyG1_dinXtwdl_vld_dly1 <= proc_11_enb AND dinXTwdl_11_1_vld_1;
    --  END IF;
    END IF;
  END PROCESS Radix22ButterflyG1_process;

  dinxTwdlf_vld <= ( NOT proc_11_enb) AND dinXTwdl_11_1_vld_1;
  Radix22ButterflyG1_add_cast <= resize(Radix22ButterflyG1_x_re_dly1, 44);
  Radix22ButterflyG1_add_cast_1 <= resize(Radix22ButterflyG1_dinXtwdl_re_dly2, 44);
  Radix22ButterflyG1_btf1_re_reg_next <= Radix22ButterflyG1_add_cast + Radix22ButterflyG1_add_cast_1;
  Radix22ButterflyG1_sub_cast <= resize(Radix22ButterflyG1_x_re_dly1, 44);
  Radix22ButterflyG1_sub_cast_1 <= resize(Radix22ButterflyG1_dinXtwdl_re_dly2, 44);
  Radix22ButterflyG1_btf2_re_reg_next <= Radix22ButterflyG1_sub_cast - Radix22ButterflyG1_sub_cast_1;
  Radix22ButterflyG1_add_cast_2 <= resize(Radix22ButterflyG1_x_im_dly1, 44);
  Radix22ButterflyG1_add_cast_3 <= resize(Radix22ButterflyG1_dinXtwdl_im_dly2, 44);
  Radix22ButterflyG1_btf1_im_reg_next <= Radix22ButterflyG1_add_cast_2 + Radix22ButterflyG1_add_cast_3;
  Radix22ButterflyG1_sub_cast_2 <= resize(Radix22ButterflyG1_x_im_dly1, 44);
  Radix22ButterflyG1_sub_cast_3 <= resize(Radix22ButterflyG1_dinXtwdl_im_dly2, 44);
  Radix22ButterflyG1_btf2_im_reg_next <= Radix22ButterflyG1_sub_cast_2 - Radix22ButterflyG1_sub_cast_3;
  dinXTwdlf_re <= dinXTwdl_re_signed;
  dinXTwdlf_im <= dinXTwdl_im_signed;
  btf1_re <= Radix22ButterflyG1_btf1_re_reg(42 DOWNTO 0);
  btf1_im <= Radix22ButterflyG1_btf1_im_reg(42 DOWNTO 0);
  btf2_re <= Radix22ButterflyG1_btf2_re_reg(42 DOWNTO 0);
  btf2_im <= Radix22ButterflyG1_btf2_im_reg(42 DOWNTO 0);

  dout_11_1_re <= dout_11_1_re_tmp;

  dout_11_1_im <= dout_11_1_im_tmp;

  dinXTwdl_11_1_vld <= dinXTwdl_11_1_vld_1;

END rtl;

