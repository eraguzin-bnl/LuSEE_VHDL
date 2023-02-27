-- -------------------------------------------------------------
-- 
-- File Name: /u/home/eraguzin/matlab/LNspec/matlab/codegen/weight_fold__instance_1_/hdlsrc/weight_fold_instance_1_fixpt.vhd
-- Created: 2023-01-19 10:42:08
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
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ce_out        1
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- val                           ce_out        1
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: weight_fold_instance_1_fixpt
-- Source Path: weight_fold__instance_1__fixpt
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY weight_fold_instance_1_fixpt IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        sample_1                          :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14
        w1                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
        w2                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
        w3                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
        w4                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
        ce_out                            :   OUT   std_logic;
        valo                               :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En18
        );
END weight_fold_instance_1_fixpt;


ARCHITECTURE rtl OF weight_fold_instance_1_fixpt IS

  -- Component Declarations
  COMPONENT SimpleDualPortRAM_generic
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb                             :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;  -- ufix1
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          rd_dout                         :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : SimpleDualPortRAM_generic
    USE ENTITY work.SimpleDualPortRAM_generic(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL ndx                              : unsigned(12 DOWNTO 0);  -- ufix13
  SIGNAL ndx_1                            : unsigned(12 DOWNTO 0);  -- ufix13
  SIGNAL tmp                              : std_logic;
  SIGNAL tmp_1                            : unsigned(12 DOWNTO 0);  -- ufix13
  SIGNAL ndx_2                            : unsigned(12 DOWNTO 0);  -- ufix13
  SIGNAL tmp_2                            : std_logic;
  SIGNAL bndx                             : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL bndx_1                           : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL bndx_2                           : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL tmp_3                            : std_logic;
  SIGNAL tmp_4                            : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL tmp_5                            : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL tmp_6                            : std_logic;
  SIGNAL tmp_7                            : std_logic;
  SIGNAL val_1                            : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL sample_1_signed                  : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL addr                             : signed(31 DOWNTO 0);  -- int32
  SIGNAL tmp_8                            : signed(31 DOWNTO 0);  -- int32
  SIGNAL tmp_9                            : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL tmp_10                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL indexLogic_fixptsig              : unsigned(12 DOWNTO 0);  -- ufix13
  SIGNAL tmp_11                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL addr_1                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL buf_ram_wrenb                    : std_logic;  -- ufix1
  SIGNAL tmp_12                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL indexLogic_fixptsig_1            : unsigned(12 DOWNTO 0);  -- ufix13
  SIGNAL buf                              : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL buf_signed                       : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL tmp_13                           : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL tmp_14                           : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL tmp_15                           : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL tmp_16                           : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL tmp_17                           : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL w1_signed                        : signed(31 DOWNTO 0);  -- sfix32_En31
  SIGNAL tmp_18                           : std_logic;
  SIGNAL tmp_19                           : std_logic;
  SIGNAL val_2                            : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL addr_2                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL tmp_20                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL tmp_21                           : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL tmp_22                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL indexLogic_fixptsig_2            : unsigned(12 DOWNTO 0);  -- ufix13
  SIGNAL tmp_23                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL addr_3                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL buf_ram_wrenb_1                  : std_logic;  -- ufix1
  SIGNAL tmp_24                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL indexLogic_fixptsig_3            : unsigned(12 DOWNTO 0);  -- ufix13
  SIGNAL buf_1                            : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL buf_signed_1                     : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL tmp_25                           : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL tmp_26                           : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL tmp_27                           : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL tmp_28                           : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL w1_1                             : signed(31 DOWNTO 0);  -- sfix32_En31
  SIGNAL tmp_29                           : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL w2_signed                        : signed(31 DOWNTO 0);  -- sfix32_En31
  SIGNAL tmp_30                           : std_logic;
  SIGNAL tmp_31                           : std_logic;
  SIGNAL val_3                            : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL addr_4                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL tmp_32                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL tmp_33                           : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL tmp_34                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL indexLogic_fixptsig_4            : unsigned(12 DOWNTO 0);  -- ufix13
  SIGNAL tmp_35                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL addr_5                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL buf_ram_wrenb_2                  : std_logic;  -- ufix1
  SIGNAL tmp_36                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL indexLogic_fixptsig_5            : unsigned(12 DOWNTO 0);  -- ufix13
  SIGNAL buf_2                            : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL buf_signed_2                     : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL tmp_37                           : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL tmp_38                           : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL tmp_39                           : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL tmp_40                           : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL w2_1                             : signed(31 DOWNTO 0);  -- sfix32_En31
  SIGNAL tmp_41                           : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL w3_signed                        : signed(31 DOWNTO 0);  -- sfix32_En31
  SIGNAL w3_1                             : signed(31 DOWNTO 0);  -- sfix32_En31
  SIGNAL tmp_42                           : std_logic;
  SIGNAL tmp_43                           : std_logic;
  SIGNAL val_4                            : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL addr_6                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL tmp_44                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL tmp_45                           : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL tmp_46                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL indexLogic_fixptsig_6            : unsigned(12 DOWNTO 0);  -- ufix13
  SIGNAL tmp_47                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL addr_7                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL buf_ram_wrenb_3                  : std_logic;  -- ufix1
  SIGNAL tmp_48                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL indexLogic_fixptsig_7            : unsigned(12 DOWNTO 0);  -- ufix13
  SIGNAL buf_3                            : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL buf_signed_3                     : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL tmp_49                           : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL tmp_50                           : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL tmp_51                           : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL tmp_52                           : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL tmp_53                           : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL w4_signed                        : signed(31 DOWNTO 0);  -- sfix32_En31
  SIGNAL w4_1                             : signed(31 DOWNTO 0);  -- sfix32_En31
  SIGNAL val_tmp                          : signed(31 DOWNTO 0);  -- sfix32_En18
  SIGNAL p12val_mul_temp                  : signed(45 DOWNTO 0);  -- sfix46_En31
  SIGNAL p12val_add_cast                  : signed(46 DOWNTO 0);  -- sfix47_En31
  SIGNAL p12val_mul_temp_1                : signed(45 DOWNTO 0);  -- sfix46_En31
  SIGNAL p12val_add_cast_1                : signed(46 DOWNTO 0);  -- sfix47_En31
  SIGNAL p12val_add_temp                  : signed(46 DOWNTO 0);  -- sfix47_En31
  SIGNAL p12val_add_cast_2                : signed(47 DOWNTO 0);  -- sfix48_En31
  SIGNAL p12val_mul_temp_2                : signed(45 DOWNTO 0);  -- sfix46_En31
  SIGNAL p12val_add_cast_3                : signed(47 DOWNTO 0);  -- sfix48_En31
  SIGNAL p12val_add_temp_1                : signed(47 DOWNTO 0);  -- sfix48_En31
  SIGNAL p12val_add_cast_4                : signed(48 DOWNTO 0);  -- sfix49_En31
  SIGNAL p12val_mul_temp_3                : signed(45 DOWNTO 0);  -- sfix46_En31
  SIGNAL p12val_add_cast_5                : signed(48 DOWNTO 0);  -- sfix49_En31
  SIGNAL p12val_add_temp_2                : signed(48 DOWNTO 0);  -- sfix49_En31

BEGIN
  u_buf_ram_generic : SimpleDualPortRAM_generic
    GENERIC MAP( AddrWidth => 13,
                 DataWidth => 14
                 )
    PORT MAP( clk => clk,
              enb => clk_enable,
              wr_din => std_logic_vector(tmp_9),
              wr_addr => std_logic_vector(indexLogic_fixptsig),
              wr_en => buf_ram_wrenb,  -- ufix1
              rd_addr => std_logic_vector(indexLogic_fixptsig_1),
              rd_dout => buf
              );

  u_buf_ram : SimpleDualPortRAM_generic
    GENERIC MAP( AddrWidth => 13,
                 DataWidth => 14
                 )
    PORT MAP( clk => clk,
              enb => clk_enable,
              wr_din => std_logic_vector(tmp_21),
              wr_addr => std_logic_vector(indexLogic_fixptsig_2),
              wr_en => buf_ram_wrenb_1,  -- ufix1
              rd_addr => std_logic_vector(indexLogic_fixptsig_3),
              rd_dout => buf_1
              );

  u_buf_ram_1 : SimpleDualPortRAM_generic
    GENERIC MAP( AddrWidth => 13,
                 DataWidth => 14
                 )
    PORT MAP( clk => clk,
              enb => clk_enable,
              wr_din => std_logic_vector(tmp_33),
              wr_addr => std_logic_vector(indexLogic_fixptsig_4),
              wr_en => buf_ram_wrenb_2,  -- ufix1
              rd_addr => std_logic_vector(indexLogic_fixptsig_5),
              rd_dout => buf_2
              );

  u_buf_ram_2 : SimpleDualPortRAM_generic
    GENERIC MAP( AddrWidth => 13,
                 DataWidth => 14
                 )
    PORT MAP( clk => clk,
              enb => clk_enable,
              wr_din => std_logic_vector(tmp_45),
              wr_addr => std_logic_vector(indexLogic_fixptsig_6),
              wr_en => buf_ram_wrenb_3,  -- ufix1
              rd_addr => std_logic_vector(indexLogic_fixptsig_7),
              rd_dout => buf_3
              );

  -- HDL code generation from MATLAB function: weight_fold__instance_1__fixpt
  ndx <= to_unsigned(16#0000#, 13);

  enb <= clk_enable;

  -- 'weight_fold__instance_1__fixpt:33' if (ndx==fi(4096, 0, 13, 0, fm))
  
  tmp <= '1' WHEN ndx_1 = to_unsigned(16#1000#, 13) ELSE
      '0';

  
  tmp_1 <= ndx_1 WHEN tmp = '0' ELSE
      ndx;

  ndx_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      ndx_2 <= to_unsigned(16#0000#, 13);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        ndx_2 <= tmp_1;
      END IF;
    END IF;
  END PROCESS ndx_reg_process;


  -- 'weight_fold__instance_1__fixpt:32' ndx(:) = ndx + fi(1, 0, 1, 0, fm);
  ndx_1 <= ndx_2 + to_unsigned(16#0001#, 13);

  
  tmp_2 <= '1' WHEN ndx_1 = to_unsigned(16#1000#, 13) ELSE
      '0';

  bndx <= to_unsigned(16#0#, 3);

  -- 'weight_fold__instance_1__fixpt:36' if (bndx==fi(4, 0, 3, 0, fm))
  -- 
  -- 'weight_fold__instance_1__fixpt:37' bndx(:)=0;
  -- 
  -- HDL code generation from MATLAB function: weight_fold__instance_1__fixpt
  bndx_2 <= bndx_1 + to_unsigned(16#1#, 3);

  
  tmp_3 <= '1' WHEN bndx_2 = to_unsigned(16#4#, 3) ELSE
      '0';

  
  tmp_4 <= bndx_2 WHEN tmp_3 = '0' ELSE
      bndx;

  
  tmp_5 <= bndx_1 WHEN tmp_2 = '0' ELSE
      tmp_4;

  bndx_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      bndx_1 <= to_unsigned(16#0#, 3);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        bndx_1 <= tmp_5;
      END IF;
    END IF;
  END PROCESS bndx_reg_process;


  -- 'weight_fold__instance_1__fixpt:50' if (write)
  -- 
  -- 'weight_fold__instance_1__fixpt:47' if isempty(buf)
  -- 
  -- 'weight_fold__instance_1__fixpt:44' fm = get_fimath();
  -- 
  -- 'weight_fold__instance_1__fixpt:25' v1 = fi(ramwrap__instance_1_1_ (ndx, sample, bndx==fi(0, 0, 1, 0, fm)), 1, 
  -- 14, 0, fm)
  -- 
  -- 'weight_fold__instance_1__fixpt:23' assert(fi(4, 0, 3, 0, fm)==fi(4, 0, 3, 0, fm));
  -- 
  -- 'weight_fold__instance_1__fixpt:14' if isempty(buf1)
  
  tmp_6 <= '1' WHEN bndx_1 = to_unsigned(16#0#, 3) ELSE
      '0';

  reduced_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_7 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_7 <= tmp_6;
      END IF;
    END IF;
  END PROCESS reduced_process;


  val_1 <= to_signed(16#0000#, 14);

  -- 'weight_fold__instance_1__fixpt:13' sample = fi(double(sample), 1, 14, 0, fm);
  -- 
  -- 'weight_fold__instance_1__fixpt:9' sample = fi(sample_1, 1, 14, 0, fm);
  -- 
  -- 'weight_fold__instance_1__fixpt:8' fm = get_fimath();
  -- 
  -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  -- 
  --                                                                          %
  -- 
  --          Generated by MATLAB 9.12 and Fixed-Point Designer 7.4           %
  -- 
  --                                                                          %
  -- 
  -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  -- 
  -- HDL code generation from MATLAB function: weight_fold__instance_1__fixpt_trueregionp18
  -- 
  -- HDL code generation from MATLAB function: weight_fold__instance_1__fixpt_trueregionp31
  -- 
  -- HDL code generation from MATLAB function: weight_fold__instance_1__fixpt_trueregionp44
  -- 
  -- HDL code generation from MATLAB function: weight_fold__instance_1__fixpt_trueregionp57
  sample_1_signed <= signed(sample_1);

  addr <= to_signed(16#00001000#, 32);

  -- 'weight_fold__instance_1__fixpt:52' val = fi(write_val, 1, 14, 0, fm);
  -- 
  -- 'weight_fold__instance_1__fixpt:68' else
  -- 
  -- 'weight_fold__instance_1__fixpt:69' val = fi(buf(ndx+fi(1, 0, 1, 0, fm)), 1, 14, 0, fm);
  -- 
  -- 'weight_fold__instance_1__fixpt:66' buf(ndx+fi(1, 0, 1, 0, fm)) = write_val;
  -- 
  -- HDL code generation from MATLAB function: weight_fold__instance_1__fixpt_trueregionp59
  tmp_8 <= signed(resize(ndx_2, 32));

  
  tmp_9 <= val_1 WHEN tmp_6 = '0' ELSE
      sample_1_signed;

  
  tmp_10 <= addr WHEN tmp_6 = '0' ELSE
      tmp_8;

  indexLogic_fixptsig <= unsigned(tmp_10(12 DOWNTO 0));

  -- HDL code generation from MATLAB function: weight_fold__instance_1__fixpt_falseregionp55
  tmp_11 <= signed(resize(ndx_2, 32));

  addr_1 <= to_signed(16#00001000#, 32);

  buf_ram_wrenb <= '1';

  
  tmp_12 <= tmp_11 WHEN tmp_6 = '0' ELSE
      addr_1;

  indexLogic_fixptsig_1 <= unsigned(tmp_12(12 DOWNTO 0));

  buf_signed <= signed(buf);

  tmp_13 <= to_signed(16#0000#, 14);

  delayMatch_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_14 <= to_signed(16#0000#, 14);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_14 <= tmp_13;
      END IF;
    END IF;
  END PROCESS delayMatch_process;


  
  tmp_15 <= buf_signed WHEN tmp_7 = '0' ELSE
      tmp_14;

  delayMatch_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_16 <= to_signed(16#0000#, 14);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_16 <= sample_1_signed;
      END IF;
    END IF;
  END PROCESS delayMatch_1_process;


  
  tmp_17 <= tmp_15 WHEN tmp_7 = '0' ELSE
      tmp_16;

  w1_signed <= signed(w1);

  -- 'weight_fold__instance_1__fixpt:65' if (write)
  -- 
  -- 'weight_fold__instance_1__fixpt:62' if isempty(buf)
  -- 
  -- 'weight_fold__instance_1__fixpt:59' fm = get_fimath();
  -- 
  -- 'weight_fold__instance_1__fixpt:26' v2 = fi(ramwrap__instance_1_2_ (ndx, sample, bndx==fi(1, 0, 1, 0, fm)), 1, 
  -- 14, 0, fm)
  
  tmp_18 <= '1' WHEN bndx_1 = to_unsigned(16#1#, 3) ELSE
      '0';

  reduced_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_19 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_19 <= tmp_18;
      END IF;
    END IF;
  END PROCESS reduced_1_process;


  val_2 <= to_signed(16#0000#, 14);

  addr_2 <= to_signed(16#00001000#, 32);

  -- 'weight_fold__instance_1__fixpt:67' val = fi(write_val, 1, 14, 0, fm);
  -- 
  -- 'weight_fold__instance_1__fixpt:83' else
  -- 
  -- 'weight_fold__instance_1__fixpt:84' val = fi(buf(ndx+fi(1, 0, 1, 0, fm)), 1, 14, 0, fm);
  -- 
  -- 'weight_fold__instance_1__fixpt:81' buf(ndx+fi(1, 0, 1, 0, fm)) = write_val;
  -- 
  -- HDL code generation from MATLAB function: weight_fold__instance_1__fixpt_trueregionp46
  tmp_20 <= signed(resize(ndx_2, 32));

  
  tmp_21 <= val_2 WHEN tmp_18 = '0' ELSE
      sample_1_signed;

  
  tmp_22 <= addr_2 WHEN tmp_18 = '0' ELSE
      tmp_20;

  indexLogic_fixptsig_2 <= unsigned(tmp_22(12 DOWNTO 0));

  -- HDL code generation from MATLAB function: weight_fold__instance_1__fixpt_falseregionp42
  tmp_23 <= signed(resize(ndx_2, 32));

  addr_3 <= to_signed(16#00001000#, 32);

  buf_ram_wrenb_1 <= '1';

  
  tmp_24 <= tmp_23 WHEN tmp_18 = '0' ELSE
      addr_3;

  indexLogic_fixptsig_3 <= unsigned(tmp_24(12 DOWNTO 0));

  buf_signed_1 <= signed(buf_1);

  tmp_25 <= to_signed(16#0000#, 14);

  delayMatch_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_26 <= to_signed(16#0000#, 14);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_26 <= tmp_25;
      END IF;
    END IF;
  END PROCESS delayMatch_2_process;


  
  tmp_27 <= buf_signed_1 WHEN tmp_19 = '0' ELSE
      tmp_26;

  delayMatch_3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_28 <= to_signed(16#0000#, 14);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_28 <= sample_1_signed;
      END IF;
    END IF;
  END PROCESS delayMatch_3_process;


  delayMatch_4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      w1_1 <= to_signed(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        w1_1 <= w1_signed;
      END IF;
    END IF;
  END PROCESS delayMatch_4_process;


  
  tmp_29 <= tmp_27 WHEN tmp_19 = '0' ELSE
      tmp_28;

  w2_signed <= signed(w2);

  -- 'weight_fold__instance_1__fixpt:80' if (write)
  -- 
  -- 'weight_fold__instance_1__fixpt:77' if isempty(buf)
  -- 
  -- 'weight_fold__instance_1__fixpt:74' fm = get_fimath();
  -- 
  -- 'weight_fold__instance_1__fixpt:27' v3 = fi(ramwrap__instance_1_3_ (ndx, sample, bndx==fi(2, 0, 2, 0, fm)), 1, 
  -- 14, 0, fm)
  
  tmp_30 <= '1' WHEN bndx_1 = to_unsigned(16#2#, 3) ELSE
      '0';

  reduced_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_31 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_31 <= tmp_30;
      END IF;
    END IF;
  END PROCESS reduced_2_process;


  val_3 <= to_signed(16#0000#, 14);

  addr_4 <= to_signed(16#00001000#, 32);

  -- 'weight_fold__instance_1__fixpt:82' val = fi(write_val, 1, 14, 0, fm);
  -- 
  -- 'weight_fold__instance_1__fixpt:98' else
  -- 
  -- 'weight_fold__instance_1__fixpt:99' val = fi(buf(ndx+fi(1, 0, 1, 0, fm)), 1, 14, 0, fm);
  -- 
  -- 'weight_fold__instance_1__fixpt:96' buf(ndx+fi(1, 0, 1, 0, fm)) = write_val;
  -- 
  -- HDL code generation from MATLAB function: weight_fold__instance_1__fixpt_trueregionp33
  tmp_32 <= signed(resize(ndx_2, 32));

  
  tmp_33 <= val_3 WHEN tmp_30 = '0' ELSE
      sample_1_signed;

  
  tmp_34 <= addr_4 WHEN tmp_30 = '0' ELSE
      tmp_32;

  indexLogic_fixptsig_4 <= unsigned(tmp_34(12 DOWNTO 0));

  -- HDL code generation from MATLAB function: weight_fold__instance_1__fixpt_falseregionp29
  tmp_35 <= signed(resize(ndx_2, 32));

  addr_5 <= to_signed(16#00001000#, 32);

  buf_ram_wrenb_2 <= '1';

  
  tmp_36 <= tmp_35 WHEN tmp_30 = '0' ELSE
      addr_5;

  indexLogic_fixptsig_5 <= unsigned(tmp_36(12 DOWNTO 0));

  buf_signed_2 <= signed(buf_2);

  tmp_37 <= to_signed(16#0000#, 14);

  delayMatch_5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_38 <= to_signed(16#0000#, 14);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_38 <= tmp_37;
      END IF;
    END IF;
  END PROCESS delayMatch_5_process;


  
  tmp_39 <= buf_signed_2 WHEN tmp_31 = '0' ELSE
      tmp_38;

  delayMatch_6_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_40 <= to_signed(16#0000#, 14);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_40 <= sample_1_signed;
      END IF;
    END IF;
  END PROCESS delayMatch_6_process;


  delayMatch_7_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      w2_1 <= to_signed(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        w2_1 <= w2_signed;
      END IF;
    END IF;
  END PROCESS delayMatch_7_process;


  
  tmp_41 <= tmp_39 WHEN tmp_31 = '0' ELSE
      tmp_40;

  w3_signed <= signed(w3);

  delayMatch_8_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      w3_1 <= to_signed(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        w3_1 <= w3_signed;
      END IF;
    END IF;
  END PROCESS delayMatch_8_process;


  -- 'weight_fold__instance_1__fixpt:95' if (write)
  -- 
  -- 'weight_fold__instance_1__fixpt:92' if isempty(buf)
  -- 
  -- 'weight_fold__instance_1__fixpt:89' fm = get_fimath();
  -- 
  -- 'weight_fold__instance_1__fixpt:28' v4 = fi(ramwrap__instance_1_4_ (ndx, sample, bndx==fi(3, 0, 2, 0, fm)), 1, 
  -- 14, 0, fm)
  
  tmp_42 <= '1' WHEN bndx_1 = to_unsigned(16#3#, 3) ELSE
      '0';

  reduced_3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_43 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_43 <= tmp_42;
      END IF;
    END IF;
  END PROCESS reduced_3_process;


  val_4 <= to_signed(16#0000#, 14);

  addr_6 <= to_signed(16#00001000#, 32);

  -- 'weight_fold__instance_1__fixpt:97' val = fi(write_val, 1, 14, 0, fm);
  -- 
  -- 'weight_fold__instance_1__fixpt:34' ndx(:) = 0;
  -- 
  -- 'weight_fold__instance_1__fixpt:35' bndx(:) = bndx + fi(1, 0, 1, 0, fm);
  -- 
  -- HDL code generation from MATLAB function: weight_fold__instance_1__fixpt_trueregionp20
  tmp_44 <= signed(resize(ndx_2, 32));

  
  tmp_45 <= val_4 WHEN tmp_42 = '0' ELSE
      sample_1_signed;

  
  tmp_46 <= addr_6 WHEN tmp_42 = '0' ELSE
      tmp_44;

  indexLogic_fixptsig_6 <= unsigned(tmp_46(12 DOWNTO 0));

  -- HDL code generation from MATLAB function: weight_fold__instance_1__fixpt_falseregionp16
  tmp_47 <= signed(resize(ndx_2, 32));

  addr_7 <= to_signed(16#00001000#, 32);

  buf_ram_wrenb_3 <= '1';

  
  tmp_48 <= tmp_47 WHEN tmp_42 = '0' ELSE
      addr_7;

  indexLogic_fixptsig_7 <= unsigned(tmp_48(12 DOWNTO 0));

  buf_signed_3 <= signed(buf_3);

  -- 'weight_fold__instance_1__fixpt:53' else
  -- 
  -- 'weight_fold__instance_1__fixpt:54' val = fi(buf(ndx+fi(1, 0, 1, 0, fm)), 1, 14, 0, fm);
  -- 
  -- 'weight_fold__instance_1__fixpt:51' buf(ndx+fi(1, 0, 1, 0, fm)) = write_val;
  tmp_49 <= to_signed(16#0000#, 14);

  delayMatch_9_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_50 <= to_signed(16#0000#, 14);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_50 <= tmp_49;
      END IF;
    END IF;
  END PROCESS delayMatch_9_process;


  
  tmp_51 <= buf_signed_3 WHEN tmp_43 = '0' ELSE
      tmp_50;

  delayMatch_10_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_52 <= to_signed(16#0000#, 14);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_52 <= sample_1_signed;
      END IF;
    END IF;
  END PROCESS delayMatch_10_process;


  
  tmp_53 <= tmp_51 WHEN tmp_43 = '0' ELSE
      tmp_52;

  w4_signed <= signed(w4);

  delayMatch_11_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      w4_1 <= to_signed(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        w4_1 <= w4_signed;
      END IF;
    END IF;
  END PROCESS delayMatch_11_process;


  -- 'weight_fold__instance_1__fixpt:30' val = fi(v1*w1+v2*w2+v3*w3+v4*w4, 1, 32, 18, fm);
  p12val_mul_temp <= tmp_17 * w1_1;
  p12val_add_cast <= resize(p12val_mul_temp, 47);
  p12val_mul_temp_1 <= tmp_29 * w2_1;
  p12val_add_cast_1 <= resize(p12val_mul_temp_1, 47);
  p12val_add_temp <= p12val_add_cast + p12val_add_cast_1;
  p12val_add_cast_2 <= resize(p12val_add_temp, 48);
  p12val_mul_temp_2 <= tmp_41 * w3_1;
  p12val_add_cast_3 <= resize(p12val_mul_temp_2, 48);
  p12val_add_temp_1 <= p12val_add_cast_2 + p12val_add_cast_3;
  p12val_add_cast_4 <= resize(p12val_add_temp_1, 49);
  p12val_mul_temp_3 <= tmp_53 * w4_1;
  p12val_add_cast_5 <= resize(p12val_mul_temp_3, 49);
  p12val_add_temp_2 <= p12val_add_cast_4 + p12val_add_cast_5;
  val_tmp <= p12val_add_temp_2(44 DOWNTO 13);

  valo <= std_logic_vector(val_tmp);

  ce_out <= clk_enable;

END rtl;

