-- -------------------------------------------------------------
-- 
-- File Name: /u/home/eraguzin/matlab/LNspec/matlab/codegen/spectrometer/hdlsrc/spectrometer_fixpt.vhd
-- Created: 2023-01-12 10:26:07
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
-- pks                           ce_out        1
-- outbin                        ce_out        1
-- ready                         ce_out        1
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: spectrometer_fixpt
-- Source Path: spectrometer_fixpt
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.spectrometer_fixpt_pkg.ALL;

ENTITY spectrometer_fixpt IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        Navg                              :   IN   std_logic_vector(9 DOWNTO 0);  -- sfix14
        sample1                           :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14
        sample2                           :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14
        
        nstart                            :   IN    std_logic;
        Streamer_DLY                      : IN std_logic_vector(3 DOWNTO 0); 
        weight_fold_DLY                   : IN std_logic_vector(3 DOWNTO 0); 
        sfft_DLY                          : IN std_logic_vector(3 DOWNTO 0);  
        deinterlace_DLY                   : IN std_logic_vector(3 DOWNTO 0); 
        AVG_DLY                           : IN std_logic_vector(3 DOWNTO 0); 
        
        ce_out                            :   OUT   std_logic;
        pks                               :   OUT   vector_of_std_logic_vector32(0 TO 3);  -- sfix32_E18 [4]
        outbin                            :   OUT   std_logic_vector(10 DOWNTO 0);  -- ufix11
        ready                             :   OUT   std_logic
        );
END spectrometer_fixpt;


ARCHITECTURE rtl OF spectrometer_fixpt IS




  COMPONENT weight_streamer_fixpt 
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        ce_out                            :   OUT   std_logic;
        w1                                :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
        w2                                :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
        w3                                :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
        w4                                :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En31
        );
  END COMPONENT;
 
 
 
COMPONENT weight_fold_instance_1_fixpt 
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        sample_1                          :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14
        w1                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
        w2                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
        w3                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
        w4                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
        ce_out                            :   OUT   std_logic;
        val_out                           :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En18
        );
  END COMPONENT;
 

COMPONENT  sfft_fixpt 
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        c_re                              :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En18
        c_im                              :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En18
        ce_out                            :   OUT   std_logic;
        fft_out_re                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        fft_out_im                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        fft_valid                         :   OUT   std_logic
        );
  END COMPONENT;
 
 
 
 
 
 
COMPONENT deinterlace_instance_12_fixpt 
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        fft_val_re                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        fft_val_im                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        fft_valid                         :   IN    std_logic;
        ce_out                            :   OUT   std_logic;
        ch1_val_re                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        ch1_val_im                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        ch2_val_re                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        ch2_val_im                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        bin                               :   OUT   std_logic_vector(12 DOWNTO 0);  -- ufix13
        ready                             :   OUT   std_logic
        );
  END COMPONENT;
 
 
 
 
 
 
 
 
COMPONENT average_instance_P1_fixpt
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        ch1_val_re                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        ch1_val_im                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        ch2_val_re                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        ch2_val_im                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        count                             :   IN    std_logic_vector(12 DOWNTO 0);  -- ufix13
        ready_in                          :   IN    std_logic;
        ce_out                            :   OUT   std_logic;
        outpk                             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32_E17
        outbin                            :   OUT   std_logic_vector(10 DOWNTO 0);  -- ufix11
        ready_out                         :   OUT   std_logic
        );
  END COMPONENT;
  
  COMPONENT average_instance_P2_fixpt
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        ch1_val_re                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        ch1_val_im                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        ch2_val_re                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        ch2_val_im                        :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
        count                             :   IN    std_logic_vector(12 DOWNTO 0);  -- ufix13
        ready_in                          :   IN    std_logic;
        ce_out                            :   OUT   std_logic;
        outpk                             :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32_E17
        outbin                            :   OUT   std_logic_vector(10 DOWNTO 0);  -- ufix11
        ready_out                         :   OUT   std_logic
        );
  END COMPONENT;
  
  

 SIGNAL  resetr                              :   std_logic;
 SIGNAL w1                                   :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
 SIGNAL w2                                   :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
 SIGNAL w3                                   :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
 SIGNAL w4                                   :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
 
 SIGNAL w1_s1                                :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
 SIGNAL w2_s1                                :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
 SIGNAL w3_s1                                :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
 SIGNAL w4_s1                                :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En31

 SIGNAL w1_s2                                :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
 SIGNAL w2_s2                                :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
 SIGNAL w3_s2                                :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
 SIGNAL w4_s2                                :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
 
 SIGNAL w1_s3                                :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
 SIGNAL w2_s3                                :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
 SIGNAL w3_s3                                :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
 SIGNAL w4_s3                                :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En31
  
 
 SIGNAL val1                              :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En18
 SIGNAL val2                              :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En18
 
 SIGNAL val1_s1                              :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En18
 SIGNAL val2_s1                              :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En18
 SIGNAL val1_s2                              :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En18
 SIGNAL val2_s2                              :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En18
  
 
 SIGNAL fft_val_r                       :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En18
 SIGNAL fft_val_i                       :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En18
 SIGNAL fft_valid                       :   std_logic;
 
 SIGNAL fft_val_r_s1                       :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En18
 SIGNAL fft_val_i_s1                       :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En18
 SIGNAL fft_valid_s1                       :   std_logic;
 
 SIGNAL fft_val_r_s2                       :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En18
 SIGNAL fft_val_i_s2                       :   std_logic_vector(31 DOWNTO 0);  -- sfix32_En18
 SIGNAL fft_valid_s2                       :   std_logic;
 
 
 
 
  
 SIGNAL ch1_val_re                        :      std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
 SIGNAL ch1_val_im                        :      std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
 SIGNAL ch2_val_re                        :      std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
 SIGNAL ch2_val_im                        :      std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
 SIGNAL bin                               :      std_logic_vector(12 DOWNTO 0);  -- ufix13
 SIGNAL fft_ready                         :       std_logic;
  
 SIGNAL ch1_val_re_s1                        :      std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
 SIGNAL ch1_val_im_s1                        :      std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
 SIGNAL ch2_val_re_s1                        :      std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
 SIGNAL ch2_val_im_s1                        :      std_logic_vector(31 DOWNTO 0);  -- sfix32_En7
 SIGNAL bin_s1                               :      std_logic_vector(11 DOWNTO 0);  -- ufix13
 SIGNAL fft_ready_s1                         :       std_logic;
  
  
 SIGNAL ce_out_s1                            :   std_logic;
 SIGNAL pks_s1                               :   vector_of_std_logic_vector32(0 TO 3);  -- sfix32_E18 [4]
 SIGNAL outbin_s1                            :   std_logic_vector(10 DOWNTO 0);  -- ufix11
 SIGNAL ready_s1                             :   std_logic;
 SIGNAL test0                               : signed(31 DOWNTO 0);
 SIGNAL test1                               : signed(32 DOWNTO 0);
 SIGNAL test2                               : signed(31 DOWNTO 0);
 
 SIGNAL blk_reset                           : std_logic; 
 SIGNAL nstart_r                            : std_logic; 
 
 SIGNAL Streamer_en                         : std_logic_vector(3 DOWNTO 0); 
 SIGNAL weight_fold_en                      : std_logic_vector(3 DOWNTO 0); 
 SIGNAL sfft_en                             : std_logic_vector(3 DOWNTO 0);  

    
 SIGNAL Streamer_DLYr                      : std_logic_vector(3 DOWNTO 0); 
 SIGNAL weight_fold_DLYr                   : std_logic_vector(3 DOWNTO 0); 
 SIGNAL sfft_DLYr                          : std_logic_vector(3 DOWNTO 0);  
 SIGNAL deinterlace_DLYr                   : std_logic_vector(3 DOWNTO 0); 
 SIGNAL AVG_DLYr                           : std_logic_vector(3 DOWNTO 0); 
 
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
 
 SIGNAL A1_s                                : std_logic_vector(31 DOWNTO 0);  -- ufix32_E15
 SIGNAL A2_s                                : std_logic_vector(31 DOWNTO 0);  -- ufix32_E15
 SIGNAL A3_s                                : std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
 SIGNAL A4_s                                : std_logic_vector(31 DOWNTO 0);  -- ufix32_E15
 SIGNAL X12R_s                              : std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
 SIGNAL X12I_s                              : std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
 SIGNAL X13R_s                              : std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
 SIGNAL X13I_s                              : std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
 SIGNAL X14R_s                              : std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
 SIGNAL X14I_s                              : std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
 SIGNAL X23R_s                              : std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
 SIGNAL X23I_s                              : std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
 SIGNAL X24R_s                              : std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
 SIGNAL X24I_s                              : std_logic_vector(31 DOWNTO 0);  -- sfix32_E14
 SIGNAL X34R_s                              : std_logic_vector(31 DOWNTO 0);  -- sfix32_E6
 SIGNAL X34I_s                              : std_logic_vector(31 DOWNTO 0);  -- sfix32_E14

    
BEGIN
 
 
    process (clk) begin
    if (rising_edge(clk)) then

        nstart_r            <= nstart and (not resetr) ;
        resetr              <= reset;
        
        blk_reset           <= resetr or (not nstart_r);
        
        Streamer_DLYr       <= Streamer_DLY;
        weight_fold_DLYr    <= weight_fold_DLY;
        sfft_DLYr           <= sfft_DLY;  
        deinterlace_DLYr    <= deinterlace_DLY;
        AVG_DLYr            <= AVG_DLY;
        
        Streamer_en(1)  <= nstart_r;
        Streamer_en(2)  <= Streamer_en(1);
        Streamer_en(3)  <= Streamer_en(2);
        
        weight_fold_en(1)   <= Streamer_en(0);
        weight_fold_en(2)   <= weight_fold_en(1);
        weight_fold_en(3)   <= weight_fold_en(2);
        
        sfft_en(1)          <= weight_fold_en(0);
        sfft_en(2)          <= sfft_en(1);
        sfft_en(3)          <= sfft_en(2);
        
                    
    end if;
end process;     


 Streamer_en(0)     <= nstart_r        when (Streamer_DLYr = x"0")  else
                       Streamer_en(1)  when (Streamer_DLYr = x"1")  else
                       Streamer_en(2)  when (Streamer_DLYr = x"2")  else
                       Streamer_en(3)  when (Streamer_DLYr = x"3")  else
                       nstart_r;
                      
 weight_fold_en(0)  <= Streamer_en(0)     when (weight_fold_DLYr = x"0")  else
                       weight_fold_en(1)  when (weight_fold_DLYr = x"1")  else
                       weight_fold_en(2)  when (weight_fold_DLYr = x"2")  else
                       weight_fold_en(3)  when (weight_fold_DLYr = x"3")  else
                       Streamer_en(0);
                       
 sfft_en(0)         <= weight_fold_en(0)  when (sfft_DLYr = x"0")  else
                       sfft_en(1)         when (sfft_DLYr = x"1")  else
                       sfft_en(2)         when (sfft_DLYr = x"2")  else
                       sfft_en(3)         when (sfft_DLYr = x"3")  else
                       weight_fold_en(0);
                       
 
 
weight_streamer_fixpt_inst : weight_streamer_fixpt
  PORT map
        ( clk                => clk,
        reset                => not Streamer_en(0),
        clk_enable           => clk_enable ,
        ce_out               => open,
        w1                   => w1,
        w2                   => w2,
        w3                   => w3,
        w4                   => w4
        );

        
  process (clk) begin
    if (rising_edge(clk)) then
            w1_s1  <= w1;
            w2_s1  <= w2;
            w3_s1  <= w3;
            w4_s1  <= w4;
                
            w1_s2  <= w1_s1;
            w2_s2  <= w2_s1;
            w3_s2  <= w3_s1;
            w4_s2  <= w4_s1;
            w1_s3  <= w1_s1;
            w2_s3  <= w2_s1;
            w3_s3  <= w3_s1;
            w4_s3  <= w4_s1;
    end if;
end process; 

         
weight_fold_instance_1_fixpt_inst1  : weight_fold_instance_1_fixpt 
  PORT map
        ( clk                => clk,
        reset                => not weight_fold_en(0),
        clk_enable           => clk_enable,
        sample_1             => sample1,
        w1                   => w1_s2,
        w2                   => w2_s2,
        w3                   => w3_s2,
        w4                   => w4_s2,

        ce_out               => open,
        val_out                 => val1
        );

 weight_fold_instance_1_fixpt_inst2  : weight_fold_instance_1_fixpt 
  PORT map
        ( clk                => clk,
        reset                => not weight_fold_en(0),
        clk_enable           => clk_enable,
        sample_1             => sample2,
        w1                   => w1_s3,
        w2                   => w2_s3,
        w3                   => w3_s3,
        w4                   => w4_s3,
     
        ce_out               => open,
        val_out                 => val2
        );

    test0 <=  signed(val2_s1);
    test1 <=  - (resize(test0, 33));
    test2 <= test1(31 downto 0);
        
      process (clk) begin
    if (rising_edge(clk)) then

    val1_s1    <= val1;
    val1_s2    <= val1_s1;
   
    val2_s1    <= val2;
    val2_s2    <= std_logic_vector(test2);
   
    end if;
end process;     
        
   
sfft_fixpt_inst : sfft_fixpt
  PORT map
        ( clk                => clk,
        reset                => not sfft_en(0) ,
        clk_enable           => clk_enable   ,
        c_re                 => val1_s2,
        c_im                 => val2_s2,
        ce_out               => open,
        fft_out_re           => fft_val_r,
        fft_out_im           => fft_val_i,
        fft_valid            => fft_valid
        );

      process (clk) begin
    if (rising_edge(clk)) then

        fft_val_r_s1  <= fft_val_r;
        fft_val_i_s1  <= fft_val_i; 
        fft_valid_s1  <= fft_valid;
        
        fft_val_r_s2  <= fft_val_r_s1;
        fft_val_i_s2  <= fft_val_i_s1; 
        fft_valid_s2  <=fft_valid_s1;
  
    end if;
end process;     
        


 
deinterlace_instance_12_fixpt_inst : deinterlace_instance_12_fixpt
  PORT map
        ( clk                => clk,
        reset                => blk_reset,
        clk_enable           => clk_enable,
        fft_val_re           => fft_val_r_s2,
        fft_val_im           => fft_val_i_s2,
        fft_valid            => fft_valid_s2,
        ce_out               => open,
        ch1_val_re           => ch1_val_re,
        ch1_val_im           => ch1_val_im,
        ch2_val_re           => ch2_val_re,
        ch2_val_im           => ch2_val_im,
        bin                  => bin,
        ready                => fft_ready
        );

   
        
       process (clk) begin
    if (rising_edge(clk)) then

        ch1_val_re_s1           <= ch1_val_re;
        ch1_val_im_s1           <= ch1_val_im;
        ch2_val_re_s1           <= ch2_val_re;
        ch2_val_im_s1           <= ch2_val_im;
        bin_s1                  <= bin;
        fft_ready_s1            <= fft_ready;
    end if;
end process;     
    
    correlate_fixpt_inst : entity work.correlate_fixpt
    PORT map
    (   ch1_val_re              => ch1_val_re_s1,
        ch1_val_im              => ch1_val_im_s1,
        ch2_val_re              => ch2_val_re_s1,
        ch2_val_im              => ch2_val_im_s1,
        ch3_val_re              => ch1_val_re_s1,
        ch3_val_im              => ch1_val_im_s1,
        ch4_val_re              => ch2_val_re_s1,
        ch4_val_im              => ch2_val_im_s1,
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
        X34I                    => X34I
        );
       process (clk) begin
    if (rising_edge(clk)) then
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
    end if;
end process;  

 average_instance_P1_fixpt_inst : entity work.average_stage1
  PORT map
        ( clk                => clk,
        reset                => blk_reset,
        clk_enable           => clk_enable,

      P                    => A1,
      count                => bin_s1,
      navg                 => Navg,
      ready_in             => fft_ready_s1,
        
        ce_out               => ce_out_s1,
        error_flag           => open,
        outpk                => pks_s1(0),
        outbin               => outbin_s1,
        ready_out            => ready_s1
        );


   average_instance_P1_fixpt_inst2 : average_instance_P1_fixpt
  PORT map
        ( clk                => clk,
        reset                => blk_reset,
        clk_enable           => clk_enable ,
        
        
        ch1_val_re           => ch2_val_re_s1,
        ch1_val_im           => ch2_val_im_s1,
        ch2_val_re           => ch2_val_re_s1,
        ch2_val_im           => ch2_val_im_s1,
        count                => bin_s1,
        --navg                 => Navg,
        ready_in             => fft_ready_s1,

        ce_out               => open,
        outpk                => pks_s1(1),
        outbin               => open,
        ready_out            => open
        );

        
             process (clk) begin
    if (rising_edge(clk)) then

        ce_out               <= ce_out_s1;
        pks(0)               <= pks_s1(0);
        pks(1)               <= pks_s1(1);
        pks(2)               <= pks_s1(0);
        pks(3)               <= pks_s1(1);
        outbin               <= outbin_s1;
        ready                <= ready_s1;
    end if;
end process;     
          
 
END rtl;

