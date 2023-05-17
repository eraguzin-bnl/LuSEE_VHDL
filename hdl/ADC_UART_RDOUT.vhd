--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: ADC_UART_RDOUT.vhd
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
library IEEE;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
USE work.spectrometer_fixpt_pkg.ALL;

library polarfire;
use polarfire.all;

entity ADC_UART_RDOUT is
port (

    nRESET_SYS         : IN STD_LOGIC;				-- state machine reset
	sys_clk            : IN STD_LOGIC;

    Start_ADC_data     : IN  STD_LOGIC;
    ADC_DATA_A         : IN  std_logic_vector(13 downto 0);    -- 14 bit ADC data A
    ADC_DATA_B         : IN  std_logic_vector(13 downto 0);    -- 14 bit ADC data B
    ADC_S_CLK          : IN  std_logic;    -- ADC recovered data clock

    Start_Spectrometer_data     : IN  STD_LOGIC;   
    
    ce_out             : IN   std_logic;
    pks                : IN   vector_of_std_logic_vector32(3 DOWNTO 0);  -- sfix32_E18 [4]
    outbin             : IN   std_logic_vector(10 DOWNTO 0);  -- ufix11
    ready              : IN   std_logic;
    
    Start_UART_data    : IN  STD_LOGIC;
    Num_Samples        : IN  std_logic_vector(31 downto 0);    -- Samples to read
    Mode_sel           : IN  std_logic_vector(7 downto 0);     --  0 = disabled   1= ADC A  2 = ADC B 3 =  counter
    
    FIFO_RST           : IN  STD_LOGIC;

    
    HS_DATA_clk        : OUT STD_LOGIC;
    HS_DATA            : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    HS_DATA_WR         : OUT STD_LOGIC;
    HS_DATA_FULL       : IN  STD_LOGIC
);
end ADC_UART_RDOUT;
architecture architecture_ADC_UART_RDOUT of ADC_UART_RDOUT is


 component  COREFIFO_C0
    port(
        -- Inputs
        DATA     : in  std_logic_vector(13 downto 0);
        RCLOCK   : in  std_logic;
        RE       : in  std_logic;
        RRESET_N : in  std_logic;
        WCLOCK   : in  std_logic;
        WE       : in  std_logic;
        WRESET_N : in  std_logic;
        -- Outputs
        EMPTY    : out std_logic;
        FULL     : out std_logic;
        Q        : out std_logic_vector(13 downto 0)
        );
end  component ;

 component  COREFIFO_Spectrometer
    port(
        -- Inputs
        DATA     : in  std_logic_vector(15 downto 0);
        RCLOCK   : in  std_logic;
        RE       : in  std_logic;
        RRESET_N : in  std_logic;
        WCLOCK   : in  std_logic;
        WE       : in  std_logic;
        WRESET_N : in  std_logic;
        -- Outputs
        EMPTY    : out std_logic;
        FULL     : out std_logic;
        Q        : out std_logic_vector(15 downto 0)
        );
end  component ;


SIGNAL	FF_A_RE         :  STD_LOGIC;
SIGNAL	FF_WE           :  STD_LOGIC;
SIGNAL	FF_A_EMPTY      :  STD_LOGIC;
SIGNAL	FF_FULL         :  STD_LOGIC;
SIGNAL	FF_A_Q          : std_logic_vector(13 downto 0);  

SIGNAL	FF_B_RE         :  STD_LOGIC;
SIGNAL	FF_B_EMPTY      :  STD_LOGIC;
SIGNAL	FF_B_Q          :  STD_LOGIC_VECTOR(13 DOWNTO 0);


SIGNAL	FF_spec_WE      :  STD_LOGIC;
SIGNAL	FF_spec_FULL    :  STD_LOGIC;

SIGNAL	FF_spec_A_RE    :  STD_LOGIC;
SIGNAL	FF_spec_B_RE    :  STD_LOGIC;
SIGNAL	FF_spec_C_RE    :  STD_LOGIC;
SIGNAL	FF_spec_D_RE    :  STD_LOGIC;
SIGNAL	FF_spec_bin_RE  :  STD_LOGIC;

SIGNAL	FF_spec_A_EMPTY      :  STD_LOGIC;
SIGNAL	FF_spec_B_EMPTY      :  STD_LOGIC;
SIGNAL	FF_spec_C_EMPTY      :  STD_LOGIC;
SIGNAL	FF_spec_D_EMPTY      :  STD_LOGIC;
SIGNAL	FF_spec_bin_EMPTY    :  STD_LOGIC;

SIGNAL	FF_spec_A_Q     : std_logic_vector(31 downto 0);  
SIGNAL	FF_spec_B_Q     : std_logic_vector(31 downto 0);  
SIGNAL	FF_spec_C_Q     : std_logic_vector(31 downto 0);  
SIGNAL	FF_spec_D_Q     : std_logic_vector(31 downto 0);  
SIGNAL	FF_spec_bin_Q   : std_logic_vector(31 downto 0);  


SIGNAL	Start_UART_data_DLY  :  STD_LOGIC;
SIGNAL	CNT_TEST        :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	CNT_EN          :  STD_LOGIC;

SIGNAL  Start_ADC_data_s1  :  STD_LOGIC;
SIGNAL  Start_ADC_data_s2  :  STD_LOGIC;
SIGNAL  RD_FF_A            :  STD_LOGIC;
SIGNAL  RD_FF_B            :  STD_LOGIC;


SIGNAL  Start_Spectrometer_data_s1   :  STD_LOGIC;
SIGNAL  Start_Spectrometer_data_s2   :  STD_LOGIC;

SIGNAL  RD_spec_FF_A            :  STD_LOGIC;
SIGNAL  RD_spec_FF_B            :  STD_LOGIC;
SIGNAL  RD_spec_FF_C            :  STD_LOGIC;
SIGNAL  RD_spec_FF_D            :  STD_LOGIC;
SIGNAL  RD_spec_FF_bin          :  STD_LOGIC;

SIGNAL  ready_s1                :  STD_LOGIC;
SIGNAL  ready_s2                :  STD_LOGIC;
SIGNAL  FF_spec_WE_srt          :  STD_LOGIC;

begin

    HS_DATA_clk         <= sys_clk;

    HS_DATA             <= x"00000000"                          when (Mode_sel = x"00") else
                           b"00" & FF_A_Q  & b"00" & FF_B_Q     when (Mode_sel = x"01") else
                           CNT_TEST                             when (Mode_sel = x"02") else
                           FF_spec_A_Q                          when (Mode_sel = x"03") else
                           FF_spec_B_Q                          when (Mode_sel = x"04") else
                           FF_spec_C_Q                          when (Mode_sel = x"05") else
                           FF_spec_D_Q                          when (Mode_sel = x"06") else   
                           FF_spec_bin_Q                        when (Mode_sel = x"07") else   
                           
                           x"00000000";
                            
       process (sys_clk) begin
            if (rising_edge(sys_clk)) then
                Start_UART_data_DLY    <=  Start_UART_data;
                HS_DATA_WR      <= '0';
                FF_A_RE         <= '0';
                FF_B_RE         <= '0';
                FF_spec_A_RE    <= '0'; 
                FF_spec_B_RE    <= '0'; 
                FF_spec_C_RE    <= '0'; 
                FF_spec_D_RE    <= '0'; 
                FF_spec_bin_RE  <= '0'; 
                
                if (nRESET_SYS = '0') then
                    CNT_TEST <= x"00000000";
                    CNT_EN   <= '0';
                    RD_FF_A <= '0';
                    RD_FF_B <= '0';
                    RD_spec_FF_A    <= '0';
                    RD_spec_FF_B    <= '0';
                    RD_spec_FF_C    <= '0';
                    RD_spec_FF_D    <= '0';
                    RD_spec_FF_bin    <= '0';
                    
                elsif ((Start_UART_data = '1') and  (Start_UART_data_DLY = '0')  and  (HS_DATA_FULL = '0') and (Mode_sel = x"02") ) then
                    CNT_TEST    <= x"00000000";
                    HS_DATA_WR  <= '1';
                    CNT_EN      <= '1';
                elsif ((Start_UART_data = '1') and  (Start_UART_data_DLY = '0')  and  (HS_DATA_FULL = '0') and (Mode_sel = x"01") ) then
                    RD_FF_A     <= '1';
                    RD_FF_B     <= '1';
                    FF_A_RE     <= '1';
                elsif ((Start_UART_data = '1') and  (Start_UART_data_DLY = '0')  and  (HS_DATA_FULL = '0') and (Mode_sel = x"03") ) then
                    RD_spec_FF_A    <= '1';
                    FF_spec_A_RE    <= '1';     
                elsif ((Start_UART_data = '1') and  (Start_UART_data_DLY = '0')  and  (HS_DATA_FULL = '0') and (Mode_sel = x"04") ) then
                    RD_spec_FF_B    <= '1';
                    FF_spec_B_RE    <= '1'; 
                elsif ((Start_UART_data = '1') and  (Start_UART_data_DLY = '0')  and  (HS_DATA_FULL = '0') and (Mode_sel = x"05") ) then
                    RD_spec_FF_C    <= '1';
                    FF_spec_C_RE    <= '1'; 
                elsif ((Start_UART_data = '1') and  (Start_UART_data_DLY = '0')  and  (HS_DATA_FULL = '0') and (Mode_sel = x"06") ) then
                    RD_spec_FF_D    <= '1';
                    FF_spec_D_RE    <= '1';                     
                elsif ((Start_UART_data = '1') and  (Start_UART_data_DLY = '0')  and  (HS_DATA_FULL = '0') and (Mode_sel = x"07") ) then
                    RD_spec_FF_bin    <= '1';
                    FF_spec_bin_RE    <= '1';                     
                end if;
                
                
                
                if((CNT_EN = '1') and  (HS_DATA_FULL = '0')) then
                    CNT_TEST    <= CNT_TEST + 1;
                    HS_DATA_WR  <= '1';
                    if(CNT_TEST = Num_Samples(15 downto 0)) then
                        CNT_EN      <= '0';
                        HS_DATA_WR  <= '0';
                    end if;
                end if;
                
                if((RD_FF_A = '1') and  (HS_DATA_FULL = '0')) then
                    FF_A_RE     <= '1';
                    HS_DATA_WR  <= '1';
                end if;    
                if((RD_FF_B = '1') and  (HS_DATA_FULL = '0')) then
                    FF_B_RE     <= '1';
                    HS_DATA_WR  <= '1';
                end if;    
                
                
                if((RD_spec_FF_A = '1') and  (HS_DATA_FULL = '0')) then
                    FF_spec_A_RE    <= '1';
                    HS_DATA_WR      <= '1';
                end if;    
                if((RD_spec_FF_B = '1') and  (HS_DATA_FULL = '0')) then
                    FF_spec_B_RE    <= '1';
                    HS_DATA_WR      <= '1';
                end if;                
                 if((RD_spec_FF_C = '1') and  (HS_DATA_FULL = '0')) then
                    FF_spec_C_RE    <= '1';
                    HS_DATA_WR      <= '1';
                end if;    
                if((RD_spec_FF_D = '1') and  (HS_DATA_FULL = '0')) then
                    FF_spec_D_RE    <= '1';
                    HS_DATA_WR      <= '1';
                end if;                    
                if((RD_spec_FF_bin = '1') and  (HS_DATA_FULL = '0')) then
                    FF_spec_bin_RE    <= '1';
                    HS_DATA_WR      <= '1';
                end if;                     
               
            
            
                if(FF_A_EMPTY = '1') then
                     RD_FF_A     <= '0';
                end if;
                if(FF_B_EMPTY = '1') then
                     RD_FF_B     <= '0';
                end if;
                if(FF_spec_A_EMPTY = '1') then
                     RD_spec_FF_A     <= '0';
                end if;
                if(FF_spec_B_EMPTY = '1') then
                     RD_spec_FF_B     <= '0';
                end if;
                  if(FF_spec_C_EMPTY = '1') then
                     RD_spec_FF_C     <= '0';
                end if;
                if(FF_spec_D_EMPTY = '1') then
                     RD_spec_FF_D     <= '0';
                end if;
                if(FF_spec_bin_EMPTY = '1') then
                     RD_spec_FF_bin     <= '0';
                end if;
                
                
            end if;
       end process;   
    
       process (ADC_S_CLK) begin
            if (rising_edge(ADC_S_CLK)) then
                Start_ADC_data_s1   <= Start_ADC_data;
                Start_ADC_data_s2   <= Start_ADC_data_s1;
            end if;
       end process; 
    
    
       process (ADC_S_CLK) begin
            if (rising_edge(ADC_S_CLK)) then
                if (nRESET_SYS = '0') then
                    FF_WE <= '0';
                elsif ((Start_ADC_data_s1 = '1') and  (Start_ADC_data_s2 = '0')) then
                    FF_WE <= '1';
                end if;
                if(FF_FULL = '1') then
                    FF_WE <= '0';
                end if;
            end if;
       end process;    
    

         process (ADC_S_CLK) begin
            if (rising_edge(ADC_S_CLK)) then
                Start_Spectrometer_data_s1    <= Start_Spectrometer_data;
                Start_Spectrometer_data_s2    <= Start_Spectrometer_data_s1;
                ready_s1    <= ready;
                ready_s2    <= ready_s1;
            end if;
       end process; 
    
    
       process (ADC_S_CLK) begin
            if (rising_edge(ADC_S_CLK)) then
                if (nRESET_SYS = '0') then
                    FF_spec_WE_srt <= '0';
                elsif ((Start_Spectrometer_data_s1 = '1') and  (Start_Spectrometer_data_s2 = '0')) then
                    FF_spec_WE_srt <= '1';
                end if;
                
                if (nRESET_SYS = '0') then
                    FF_spec_WE <= '0';
                elsif ((ready_s1  = '1') and  (ready_s2  = '0')) then
                    FF_spec_WE <= FF_spec_WE_srt;
                end if;
   
                if(FF_spec_FULL = '1') then
                    FF_spec_WE <= '0';
                    FF_spec_WE_srt <= '0';
                end if;
            end if;
       end process;  
       
       

COREFIFO_Spectrometer_A_inst :  entity work.COREFIFO_Spectrometer
    port MAP(
        -- Inputs
        DATA         =>  pks(0),
        RCLOCK       => sys_clk,
        RE           => FF_spec_A_RE,
        RRESET_N     => nRESET_SYS and FIFO_RST,
        WCLOCK       => ADC_S_CLK, 
        WE           => FF_spec_WE,
        WRESET_N     => nRESET_SYS and FIFO_RST,
        -- Outputs
        EMPTY        => FF_spec_A_EMPTY,
        FULL         => FF_spec_FULL,
        Q            => FF_spec_A_Q);

COREFIFO_Spectrometer_B_inst :  entity work.COREFIFO_Spectrometer
    port MAP(
        -- Inputs
        DATA         =>  pks(1),
        RCLOCK       => sys_clk,
        RE           => FF_spec_B_RE,
        RRESET_N     => nRESET_SYS and FIFO_RST,
        WCLOCK       => ADC_S_CLK, 
        WE           => FF_spec_WE,
        WRESET_N     => nRESET_SYS and FIFO_RST,
        -- Outputs
        EMPTY        => FF_spec_B_EMPTY,
        FULL         => open,
        Q            => FF_spec_B_Q);


COREFIFO_Spectrometer_C_inst :  entity work.COREFIFO_Spectrometer
    port MAP(
        -- Inputs
        DATA         =>  pks(2),
        RCLOCK       => sys_clk,
        RE           => FF_spec_C_RE,
        RRESET_N     => nRESET_SYS and FIFO_RST,
        WCLOCK       => ADC_S_CLK, 
        WE           => FF_spec_WE,
        WRESET_N     => nRESET_SYS and FIFO_RST,
        -- Outputs
        EMPTY        => FF_spec_C_EMPTY,
        FULL         => open,
        Q            => FF_spec_C_Q);


COREFIFO_Spectrometer_D_inst :  entity work.COREFIFO_Spectrometer
    port MAP(
        -- Inputs
        DATA         => pks(3),
        RCLOCK       => sys_clk,
        RE           => FF_spec_D_RE,
        RRESET_N     => nRESET_SYS and FIFO_RST,
        WCLOCK       => ADC_S_CLK, 
        WE           => FF_spec_WE,
        WRESET_N     => nRESET_SYS and FIFO_RST,
        -- Outputs
        EMPTY        => FF_spec_D_EMPTY,
        FULL         => open,
        Q            => FF_spec_D_Q);

        
   COREFIFO_Spectrometer_BIN_inst :  entity work.COREFIFO_Spectrometer
    port MAP(
        -- Inputs
        DATA         => x"0000" & b"00000"  & outbin,
        RCLOCK       => sys_clk,
        RE           => FF_spec_bin_RE,
        RRESET_N     => nRESET_SYS and FIFO_RST,
        WCLOCK       => ADC_S_CLK, 
        WE           => FF_spec_WE,
        WRESET_N     => nRESET_SYS and FIFO_RST,
        -- Outputs
        EMPTY        => FF_spec_bin_EMPTY,
        FULL         => open,
        Q            => FF_spec_bin_Q);

             
        
                
COREFIFO_C0_A_inst :  entity work.COREFIFO_C0
    port MAP(
        -- Inputs
        DATA         => ADC_DATA_A,
        RCLOCK       => sys_clk,
        RE           => FF_A_RE,
        RRESET_N     => nRESET_SYS and FIFO_RST,
        WCLOCK       => ADC_S_CLK, 
        WE           => FF_WE,
        WRESET_N     => nRESET_SYS and FIFO_RST,
        -- Outputs
        EMPTY        => FF_A_EMPTY,
        FULL         => FF_FULL,
        Q            => FF_A_Q);
    
COREFIFO_C0_B_inst :  entity work.COREFIFO_C0
    port MAP(
        -- Inputs
        DATA         => ADC_DATA_B,
        RCLOCK       => sys_clk,
        RE           => FF_B_RE,
        RRESET_N     => nRESET_SYS and FIFO_RST,
        WCLOCK       => ADC_S_CLK, 
        WE           => FF_WE,
        WRESET_N     => nRESET_SYS and FIFO_RST,
        -- Outputs
        EMPTY        => FF_B_EMPTY,
        FULL         => OPEN,
        Q            => FF_B_Q);
    

     
    
    
end architecture_ADC_UART_RDOUT;