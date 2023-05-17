--*********************************************************
--* FILE  : IO_registers.VHD
--* Author: Jack Fried
--*
--* Last Modified: 5/19/2013
--*  
--* Description: interface to the TSE UDP IO
--*		 		               
--*
--*
--*********************************************************

library IEEE;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
USE work.spectrometer_fixpt_pkg.ALL;


library polarfire;
use polarfire.all;


entity LuSEE_PF_EVAL is
  port(
        -- Inputs
        
        reset               : in  std_logic;
        clk_50MHz           : in  std_logic;
        RX                  : in  std_logic;
        TX                  : out std_logic;  
  
        ADC_CLK_P          : OUT  std_logic;    -- Main ADC clock 
        ADC_CLK_N          : OUT  std_logic;    -- Main ADC clock 
        
        ADC_CLK_MISC_IO    : OUT  std_logic;    -- Main ADC clock 
        ADC_CLKOUT_P       : IN  std_logic;     -- Return clock from ADC
        ADC_CLKOUT_N       : IN  std_logic;     -- Return clock from ADC
        
        ADC_CLKOUT_FiXi_P  : IN  std_logic;     -- Return clock from ADC
        ADC_CLKOUT_Fixi_N  : IN  std_logic;     -- Return clock from ADC
        
        ADC_CLKOUT_FiXo_P  : OUT  std_logic;     -- Return clock from ADC
        ADC_CLKOUT_Fixo_N  : OUT  std_logic;     -- Return clock from ADC
        
        
        ADC_DATA_IN_P      : IN  std_logic_vector(13 downto 0);     -- Data from ADC
        ADC_DATA_IN_N      : IN  std_logic_vector(13 downto 0);     -- Data from ADC

        ADC_Reset          : OUT  std_logic;  
        ADC_SDATA          : OUT  std_logic; 
        ADC_SDOUT          : IN   std_logic; 
        ADC_SEN            : OUT  std_logic; 
        ADC_SCLK           : OUT  std_logic;   
        

  
        led       : out std_logic_vector(7 downto 0)
        );
end LuSEE_PF_EVAL;


architecture architecture_LuSEE_PF_EVAL of LuSEE_PF_EVAL is



----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------

component LED_DIMMER_s
    -- Port list
    port(
        -- Inputs
        DIMMER_CNTL  : in  std_logic_vector(15 downto 0);
        FIXED_DIMMER : in  std_logic;
        clk_40Mhz    : in  std_logic;
        reset        : in  std_logic;
        -- Outputs
        LED_DIM      : out std_logic;
        LED_OUT_s    : out std_logic_vector(7 downto 0)
        );
end component;


component PF_CCC_C0
    port(
        REF_CLK_0     : in  std_logic;
        OUT0_FABCLK_0 : out std_logic;
        PLL_LOCK_0    : out std_logic
        );
end component;




component UART_IO
    port(
        DATA_OUT    : in  std_logic_vector(31 downto 0);
        clk         : in  std_logic;
        rstn        : in  std_logic;
        rx          : in  std_logic;
        ADDRESS_OUT : out std_logic_vector(15 downto 0);
        DATA_IN     : out std_logic_vector(31 downto 0);
        WR          : out std_logic;
        tx          : out std_logic;
              
        HS_DATA     : IN  std_logic_vector(31 downto 0);  
        HS_DATA_clk : IN  std_logic;  
        HS_DATA_WR  : IN  std_logic;  
        HS_DATA_FULL: OUT std_logic
        );
end component;


 component OUTBUF_DIFF
    -- Port list
    port(
        -- Inputs
        D    : in  std_logic;
        -- Outputs
        PADN : out std_logic;
        PADP : out std_logic
        );
end component;


 component INBUF_DIFF
    -- Port list
    port(
        -- Inputs
        Y    : out  std_logic;
        -- Outputs
        PADN : in std_logic;
        PADP : in std_logic
        );
end component;


 component   CLKINT 
    port (
        A : in std_logic;
        Y : OUT std_logic
        );
end component;





----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------

signal clk_100MHz_out               : std_logic;
SIGNAL  Reset_OUT       : std_logic;
SIGNAL	nRESET_SYS      : std_logic;
SIGNAL	RESET_SYS       : std_logic;
SIGNAL	WR_address		:  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	wr_strb         : std_logic;
SIGNAL	DATA_IN 	    :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	DATA_OUT 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg0_p 			:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg1_p 			:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg2_p 			:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg3_p 			:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg4_p 			:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg5_p 			:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg6_p 			:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg7_p 			:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg8_p 			:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg9_p 			:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg10_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg11_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg12_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg13_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg14_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg15_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg16_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg17_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg18_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg19_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg20_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg21_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg22_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg23_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg24_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg25_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg26_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg27_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg28_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg29_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg30_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg31_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg32_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg33_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg34_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg35_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg36_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg37_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg38_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg39_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg40_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg41_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg42_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg43_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg44_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg45_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg46_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg47_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg48_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg49_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg50_p 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);

SIGNAL	reg3_p_i 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg13_p_i 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reg12_p_i 		:  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SW_ADC_reset    :  STD_LOGIC;
SIGNAL	ADC_REG_START   :  STD_LOGIC;
SIGNAL	ADC_REG_ADDR    :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	ADC_REG_DIN     :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	ADC_REG_DOUT    :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	ADC_CLK_FIX     :  STD_LOGIC;

SIGNAL	ADC_DATA_A      : std_logic_vector(13 downto 0);    -- 14 bit ADC data A
SIGNAL	ADC_DATA_B      : std_logic_vector(13 downto 0);    -- 14 bit ADC data B

SIGNAL	ADC_DATA_A_s      : std_logic_vector(13 downto 0);    -- 14 bit ADC data A
SIGNAL	ADC_DATA_B_s      : std_logic_vector(13 downto 0);    -- 14 bit ADC data B

SIGNAL	ADC_S_CLK       : std_logic;    -- ADC recovered data clock
SIGNAL	ADC_S_CLK_i       : std_logic;    -- ADC recovered data clock


SIGNAL	HS_DATA         :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL  HS_DATA_clk     :  STD_LOGIC;
SIGNAL	HS_DATA_WR      :  STD_LOGIC;
SIGNAL	HS_DATA_FULL    :  STD_LOGIC;


SIGNAL	Start_ADC_data  :  STD_LOGIC;
SIGNAL	Start_UART_data :  STD_LOGIC;
SIGNAL	Num_Samples     :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Mode_sel        :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	FIFO_RST        :  STD_LOGIC;



SIGNAL  Start_Spectrometer_data     : STD_LOGIC;   
SIGNAL  ce_out_s                      : std_logic_vector(15 DOWNTO 0);
SIGNAL  pks_s                         : vector_of_std_logic_vector32(15 downto 0);
SIGNAL  outbin_s                      : vector_of_std_logic_vector11(15 downto 0);
SIGNAL  ready_s                       : std_logic_vector(15 DOWNTO 0);

SIGNAL  Navg_notch       :      std_logic_vector(9 DOWNTO 0);  -- sfix14
SIGNAL  Navg_main        :      std_logic_vector(9 DOWNTO 0);  -- sfix14


SIGNAL  nstart                            : std_logic;
SIGNAL  Streamer_DLY                      : std_logic_vector(3 DOWNTO 0); 
SIGNAL  weight_fold_DLY                   : std_logic_vector(3 DOWNTO 0); 
SIGNAL  sfft_DLY                          : std_logic_vector(3 DOWNTO 0);  
SIGNAL  deinterlace_DLY                   : std_logic_vector(3 DOWNTO 0); 
SIGNAL  AVG_DLY                           : std_logic_vector(3 DOWNTO 0);

SIGNAL  notch_en                          : std_logic;
SIGNAL  error_subtract_s                  : std_logic_vector(15 DOWNTO 0);
SIGNAL  error_main_s                      : std_logic_vector(15 DOWNTO 0);
SIGNAL  error_notch_s                     : std_logic_vector(15 DOWNTO 0);
SIGNAL  corr_array                        : vector_of_std_logic_vector5(15 downto 0);
SIGNAL  notch_array                       : vector_of_std_logic_vector5(15 downto 0);

begin
   
 
    PF_RESET_inst : entity work.PF_RESET
    port map(

        SYS_CLK     => clk_50MHz,
        Reset_IN    => not reg0_p(31),
        Reset_OUT   => Reset_OUT
    );
         
    nRESET_SYS <= reset and (not reg0_p(0)) and Reset_OUT;
    RESET_SYS   <= not nRESET_SYS;
    OUTBUF_DIFF_inst : OUTBUF_DIFF 
    port map(D => ADC_CLK_FIX, PADP    => ADC_CLKOUT_FiXo_P , PADN    => ADC_CLKOUT_FiXo_N );
    
    INBUF_DIFF_inst : INBUF_DIFF 
    port map(Y => ADC_CLK_FIX, PADP    => ADC_CLKOUT_FiXi_P , PADN    =>ADC_CLKOUT_FiXi_N );

    
    
    ADC_CLK_MISC_IO <=  clk_100MHz_out; -- clk_50MHz;  -- clk_100MHz_out; --

    SW_ADC_reset       <= reg2_p(1);
    ADC_REG_START      <= reg2_p(0);
    ADC_REG_ADDR       <= reg3_p(7 downto 0);
    ADC_REG_DIN        <= reg3_p(15 downto 8);
    reg3_p_i           <= x"00" & ADC_REG_DOUT & reg3_p(15 downto 0);

    Start_UART_data    <= reg4_p(0);
    Start_ADC_data     <= reg4_p(1);
    Start_Spectrometer_data <= reg4_p(2);
    
    
    Num_Samples        <= reg5_p;        
    Mode_sel           <= reg6_p(7 downto 0);   
    FIFO_RST           <= not reg7_p(0);    
    Navg_notch         <= reg8_p(9 downto 0);  
      
    
    nstart             <= reg9_p(0);  
    Streamer_DLY       <= reg10_p(3 downto 0);  
    weight_fold_DLY    <= reg10_p(7 downto 4);  
    sfft_DLY           <= reg10_p(11 downto 8);  
    deinterlace_DLY    <= reg10_p(15 downto 12);  
    AVG_DLY            <= reg10_p(19 downto 16); 
    Navg_main          <= reg11_p(9 downto 0); 
    
    reg13_p_i           <= error_main_s & error_notch_s;
    reg12_p_i           <= x"0000" & error_subtract_s;
    
    notch_en           <= reg19_p(0);

    corr_array(0)      <= reg20_p(4 downto 0);
    corr_array(1)      <= reg20_p(9 downto 5);
    corr_array(2)      <= reg20_p(14 downto 10);
    corr_array(3)      <= reg20_p(19 downto 15);
    corr_array(4)      <= reg20_p(24 downto 20);
    corr_array(5)      <= reg20_p(29 downto 25);
    
    corr_array(6)      <= reg21_p(4 downto 0);
    corr_array(7)      <= reg21_p(9 downto 5);
    corr_array(8)      <= reg21_p(14 downto 10);
    corr_array(9)      <= reg21_p(19 downto 15);
    corr_array(10)     <= reg21_p(24 downto 20);
    corr_array(11)     <= reg21_p(29 downto 25);
    
    corr_array(12)     <= reg22_p(4 downto 0);
    corr_array(13)     <= reg22_p(9 downto 5);
    corr_array(14)     <= reg22_p(14 downto 10);
    corr_array(15)     <= reg22_p(19 downto 15);
    
    notch_array(0)      <= reg23_p(4 downto 0);
    notch_array(1)      <= reg23_p(9 downto 5);
    notch_array(2)      <= reg23_p(14 downto 10);
    notch_array(3)      <= reg23_p(19 downto 15);
    notch_array(4)      <= reg23_p(24 downto 20);
    notch_array(5)      <= reg23_p(29 downto 25);
    
    notch_array(6)      <= reg24_p(4 downto 0);
    notch_array(7)      <= reg24_p(9 downto 5);
    notch_array(8)      <= reg24_p(14 downto 10);
    notch_array(9)      <= reg24_p(19 downto 15);
    notch_array(10)     <= reg24_p(24 downto 20);
    notch_array(11)     <= reg24_p(29 downto 25);
    
    notch_array(12)     <= reg25_p(4 downto 0);
    notch_array(13)     <= reg25_p(9 downto 5);
    notch_array(14)     <= reg25_p(14 downto 10);
    notch_array(15)     <= reg25_p(19 downto 15);
    
LED_DIMMER_s_0 : LED_DIMMER_s
    port map( 
        -- Inputs
        reset        => nRESET_SYS,
        clk_40Mhz    => clk_100MHz_out,
        FIXED_DIMMER => '0',
        DIMMER_CNTL  => x"0600",
        -- Outputs
        LED_DIM      => OPEN,
        LED_OUT_s    => led
        );


PF_CCC_C0_0 : PF_CCC_C0
    port map( 

        REF_CLK_0     => clk_50MHz,
        OUT0_FABCLK_0 => clk_100MHz_out,
        PLL_LOCK_0    => OPEN 
        );



   
ADC_UART_RDOUT_inst  : entity work.ADC_UART_RDOUT
port map (

    nRESET_SYS         => nRESET_SYS,
	sys_clk            => clk_100MHz_out,

    Start_ADC_data     => Start_ADC_data,
    ADC_DATA_A         => ADC_DATA_A,
    ADC_DATA_B         => ADC_DATA_B,
    ADC_S_CLK          => ADC_S_CLK, 

    Start_Spectrometer_data => Start_Spectrometer_data,
    
    ce_out             => ce_out_s(0),
    pks                => pks_s(3 DOWNTO 0), 
    outbin             => outbin_s(0),
    ready              => ready_s(0),  
    
    Start_UART_data    => Start_UART_data,
    Num_Samples        => Num_Samples,
    Mode_sel           => Mode_sel,
    
    FIFO_RST           => FIFO_RST, 

    HS_DATA_clk        => HS_DATA_clk,
    HS_DATA            => HS_DATA,
    HS_DATA_WR         => HS_DATA_WR,
    HS_DATA_FULL       => HS_DATA_FULL 
);
      
   
UART_IO_0 : UART_IO
    port map( 

        clk             => clk_100MHz_out,
        rstn            => nRESET_SYS,
        rx              => RX,
        tx              => TX,
        DATA_OUT        => DATA_OUT,
        DATA_IN         => DATA_IN,
        ADDRESS_OUT     => WR_address,
        WR              => wr_strb,
        HS_DATA         => HS_DATA,
        HS_DATA_clk     => HS_DATA_clk,
        HS_DATA_WR      => HS_DATA_WR,
        HS_DATA_FULL    => HS_DATA_FULL
                
        
        );
          
io_registers_inst : entity work.IO_registers
PORT MAP(	    nrst 		      => nRESET_SYS,
				Ver_ID		      => x"00000306",
				clk 		      => clk_100MHz_out,
				WR 			      => wr_strb,
				WR_address 	      => WR_address,
				RD_address 	      => WR_address,
				data 			  => DATA_IN,
				data_out 	      => DATA_OUT,
				reg0_i 	    => reg0_p,
				reg1_i	    => reg1_p,		 
				reg2_i 	    => reg2_p,		 
				reg3_i 	    => reg3_p_i,
				reg4_i 	    => reg4_p,
				reg5_i 	    => reg5_p,
				reg6_i 	    => reg6_p,
				reg7_i 	    => reg7_p,
				reg8_i 	    => reg8_p,
				reg9_i 	    => reg9_p,
				reg10_i 	=> reg10_p,
				reg11_i 	=> reg11_p,
				reg12_i 	=> reg12_p_i,
                reg13_i 	=> reg13_p_i,
				reg14_i 	=> reg14_p,
				reg15_i 	=> reg15_p,
				reg16_i 	=> reg16_p,				
				reg17_i 	=> reg17_p,
				reg18_i 	=> reg18_p,
				reg19_i 	=> reg19_p,
				reg20_i 	=> reg20_p,
				reg21_i 	=> reg21_p,
				reg22_i 	=> reg22_p,
				reg23_i 	=> reg23_p,
				reg24_i 	=> reg24_p,
				reg25_i 	=> reg25_p,
				reg26_i 	=> reg26_p,
				reg27_i 	=> reg27_p,
				reg28_i 	=> reg28_p,
				reg29_i 	=> reg29_p,
				reg30_i 	=> reg30_p,
				reg31_i 	=> reg31_p,
				reg32_i 	=> reg32_p,	
				reg33_i 	=> reg33_p,
				reg34_i 	=> reg34_p,
				reg35_i 	=> reg35_p,			
				reg36_i 	=> reg36_p,	
				reg37_i 	=> reg37_p,			
				reg38_i 	=> reg38_p,
				reg39_i 	=> reg39_p,
				reg40_i 	=> reg40_p,	
				reg41_i 	=> reg41_p,	
				reg42_i 	=> reg42_p,
				reg43_i 	=> reg43_p,
	            reg44_i 	=> reg44_p,
				reg45_i 	=> reg45_p,
				reg46_i 	=> reg46_p,
				reg47_i 	=> reg47_p,
				reg48_i 	=> reg48_p,
				reg49_i 	=> reg49_p,
				reg50_i 	=> reg50_p,

	
				reg0_o => reg0_p,
				reg1_o => reg1_p,				
				reg2_o => reg2_p,		
				reg3_o => reg3_p,		
				reg4_o => reg4_p,
				reg5_o => reg5_p,
				reg6_o => reg6_p,
				reg7_o => reg7_p,
				reg8_o => reg8_p,
				reg9_o => reg9_p,		
				reg10_o => reg10_p,
				reg11_o => reg11_p,
				reg12_o => reg12_p,
				reg13_o => reg13_p,
				reg14_o => reg14_p,
				reg15_o => reg15_p,
				reg16_o => reg16_p,				
				reg17_o => reg17_p,
				reg18_o => reg18_p,
				reg19_o => reg19_p,
				reg20_o => reg20_p,
				reg21_o => reg21_p,
				reg22_o => reg22_p,
				reg23_o => reg23_p,
				reg24_o => reg24_p,
				reg25_o => reg25_p,
				reg26_o => reg26_p,
				reg27_o => reg27_p,
				reg28_o => reg28_p,
				reg29_o => reg29_p,
				reg30_o => reg30_p,
				reg31_o => reg31_p,
            	reg32_o => reg32_p,
				reg33_o => reg33_p,
				reg34_o => reg34_p,
				reg35_o => reg35_p,		
				reg36_o => reg36_p,
				reg37_o => reg37_p,
				reg38_o => reg38_p,				
				reg39_o => reg39_p,
				reg40_o => reg40_p,
				reg41_o => reg41_p,
				reg42_o => reg42_p,
				reg43_o => reg43_p,
				reg44_o => reg44_p,
				reg45_o => reg45_p,
				reg46_o => reg46_p,
				reg47_o => reg47_p,
				reg48_o => reg48_p,
				reg49_o => reg49_p,
				reg50_o => reg50_p
				);			    
        
    

ADS4245_CNTL_inst : entity work.ADS4245_CNTL
port MAP (

    Reset              => nRESET_SYS,
	Sample_CLK         => clk_100MHz_out,
    
    ADC_CLK_P          => ADC_CLK_P,
    ADC_CLK_N          => ADC_CLK_N,
    ADC_CLKOUT_P       => ADC_CLKOUT_P,
    ADC_CLKOUT_N       => ADC_CLKOUT_N, 
    ADC_DATA_IN_P      => ADC_DATA_IN_P,
    ADC_DATA_IN_N      => ADC_DATA_IN_N,

    SW_ADC_reset       => SW_ADC_reset,
    ADC_REG_START      => ADC_REG_START,
    ADC_REG_ADDR       => ADC_REG_ADDR, 
    ADC_REG_DIN        => ADC_REG_DIN, 
    ADC_REG_DOUT       => ADC_REG_DOUT, 
    
    ADC_Reset          => ADC_Reset,
    ADC_SDATA          => ADC_SDATA, 
    ADC_SDOUT          => ADC_SDOUT,
    ADC_SEN            => ADC_SEN, 
    ADC_SCLK           => ADC_SCLK,
    
    ADC_DATA_A         => ADC_DATA_A,
    ADC_DATA_B         => ADC_DATA_B ,
    ADC_S_CLK          => ADC_S_CLK );

    

        
       process (ADC_S_CLK) begin
            if (rising_edge(ADC_S_CLK)) then
                 ADC_DATA_A_s   <= ADC_DATA_A;
                 ADC_DATA_B_s   <= ADC_DATA_B;
            end if;
       end process; 
    
    
   

    spectrometer_fixpt_inst : entity  work.spectrometer_fixpt
    PORT MAP( clk         => ADC_S_CLK, 
              reset       => RESET_SYS,
              clk_enable  => '1',
              Navg_notch  =>  Navg_notch,
              Navg_main   =>  Navg_main,
              sample1     => ADC_DATA_A_s,
              sample2     => ADC_DATA_B_s,
              
              nstart            => nstart,  
              Streamer_DLY      => Streamer_DLY,   
              weight_fold_DLY   => weight_fold_DLY, 
              sfft_DLY          => sfft_DLY,  
              deinterlace_DLY   => deinterlace_DLY, 
              AVG_DLY           => AVG_DLY,
              
              notch_en          => notch_en,
              index_array       => corr_array,
              index_array_notch => notch_array,
              error_main        => error_main_s,
              error_notch       => error_notch_s,
              error_subtract    => error_subtract_s,
              
              ce_out      => ce_out_s,
              pks         => pks_s,
              outbin      => outbin_s,
              ready       => ready_s
              );     
    


end architecture_LuSEE_PF_EVAL;
