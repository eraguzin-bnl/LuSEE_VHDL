--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: ADS4245_CNTL.vhd
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

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

library polarfire;
use polarfire.all;

entity ADS4245_CNTL is
port (

    Reset              : IN  std_logic;     -- sample clock 102.4MHz
	Sample_CLK         : IN  std_logic;     -- sample clock 102.4MHz
    
    ADC_CLK_P          : OUT  std_logic;    -- Main ADC clock 
    ADC_CLK_N          : OUT  std_logic;    -- Main ADC clock 
    ADC_CLKOUT_P       : IN  std_logic;     -- Return clock from ADC
    ADC_CLKOUT_N       : IN  std_logic;     -- Return clock from ADC
    ADC_DATA_IN_P      : IN  std_logic_vector(13 downto 0);     -- Data from ADC
    ADC_DATA_IN_N      : IN  std_logic_vector(13 downto 0);     -- Data from ADC

    SW_ADC_reset       : IN  std_logic;
    ADC_REG_START      : IN  std_logic;
    ADC_REG_ADDR       : IN  std_logic_vector(7 downto 0);     -- Data from ADC
    ADC_REG_DIN        : IN  std_logic_vector(7 downto 0);     -- Data from ADC
    ADC_REG_DOUT       : OUT  std_logic_vector(7 downto 0);     -- Data from ADC
    
    ADC_Reset          : OUT  std_logic;  
    ADC_SDATA          : OUT  std_logic; 
    ADC_SDOUT          : IN   std_logic; 
    ADC_SEN            : OUT  std_logic; 
    ADC_SCLK           : OUT  std_logic; 
    
    ADC_DATA_A         : OUT  std_logic_vector(13 downto 0);    -- 14 bit ADC data A
    ADC_DATA_B         : OUT  std_logic_vector(13 downto 0);    -- 14 bit ADC data B
    ADC_S_CLK          : OUT  std_logic    -- ADC recovered data clock
    
);
end ADS4245_CNTL;
architecture architecture_ADS4245_CNTL of ADS4245_CNTL is
 
 
 component PF_IOD_ADC_ADS4245
    port(
        -- Inputs
        RXD             : IN  std_logic_vector(13 downto 0); 
        RXD_N           : IN  std_logic_vector(13 downto 0); 
        RX_CLK_N        : IN   std_logic; 
        RX_CLK_P        : IN   std_logic; 
        -- Outputs
        RX_CLK_G        : OUT  std_logic; 
        L0_RXD_DATA     : OUT  std_logic_vector(1 downto 0);  
        L1_RXD_DATA     : OUT  std_logic_vector(1 downto 0);  
        L2_RXD_DATA     : OUT  std_logic_vector(1 downto 0);  
        L3_RXD_DATA     : OUT  std_logic_vector(1 downto 0);  
        L4_RXD_DATA     : OUT  std_logic_vector(1 downto 0);  
        L5_RXD_DATA     : OUT  std_logic_vector(1 downto 0);  
        L6_RXD_DATA     : OUT  std_logic_vector(1 downto 0);  
        L7_RXD_DATA     : OUT  std_logic_vector(1 downto 0);  
        L8_RXD_DATA     : OUT  std_logic_vector(1 downto 0);  
        L9_RXD_DATA     : OUT  std_logic_vector(1 downto 0);          
        L10_RXD_DATA     : OUT  std_logic_vector(1 downto 0);  
        L11_RXD_DATA     : OUT  std_logic_vector(1 downto 0);  
        L12_RXD_DATA     : OUT  std_logic_vector(1 downto 0);  
        L13_RXD_DATA     : OUT  std_logic_vector(1 downto 0)
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


 component INBUF
    port(
        Y    : out  std_logic;
        PAD  : in std_logic);
end component;

   
    type ADC_Cntl_state_type is (S_idle, S_ADC_SEN_SPI,S_ADC_CLK_L_SPI ,S_ADC_CLK_H_SPI );
                             
    
    signal ADC_Cntl_state    : ADC_Cntl_state_type;


	signal Rate_CNTL         : std_logic_vector(7 downto 0) ; 
	signal ADC_REG_d         : std_logic_vector(15 downto 0) ; -- example
    signal ADC_REG_START_s1  : std_logic;
    signal Start_ADC_SPI     : std_logic;
    signal bit_cnt           : std_logic_vector(7 downto 0) ; 
    signal reg_dout          : std_logic_vector(7 downto 0) ;     
    signal STATE_CLK         : std_logic;
    signal ADC_SDOUT_net     : std_logic;
begin

    ADC_Reset  <=   SW_ADC_reset;
    --
    --INBUF_inst : INBUF 
    --port map( 
        --Y       => ADC_SDOUT_net,
        --PAD     => ADC_SDOUT);

     
     OUTBUF_DIFF_inst : OUTBUF_DIFF 
    port map( 
        D       => Sample_CLK,
        PADP    => ADC_CLK_P,
        PADN    => ADC_CLK_N);

     
    PF_IOD_ADC_ADS4245_inst :     PF_IOD_ADC_ADS4245
    port MAP(
        -- Inputs
        RXD             => ADC_DATA_IN_P,
        RXD_N           => ADC_DATA_IN_N,
        RX_CLK_N        => ADC_CLKOUT_N,
        RX_CLK_P        => ADC_CLKOUT_P,
        -- Outputs
        RX_CLK_G        => ADC_S_CLK,
        L13_RXD_DATA     => ADC_DATA_A(1 downto 0),
        L12_RXD_DATA     => ADC_DATA_A(3 downto 2),
        L11_RXD_DATA     => ADC_DATA_A(5 downto 4),  
        L10_RXD_DATA     => ADC_DATA_A(7 downto 6),
        L9_RXD_DATA     => ADC_DATA_A(9 downto 8),
        L8_RXD_DATA     => ADC_DATA_A(11 downto 10),
        L7_RXD_DATA     => ADC_DATA_A(13 downto 12),
        L6_RXD_DATA     => ADC_DATA_B(1 downto 0),
        L5_RXD_DATA     => ADC_DATA_B(3 downto 2),
        L4_RXD_DATA     => ADC_DATA_B(5 downto 4),        
        L3_RXD_DATA    => ADC_DATA_B(7 downto 6),
        L2_RXD_DATA    => ADC_DATA_B(9 downto 8),
        L1_RXD_DATA    => ADC_DATA_B(11 downto 10), 
        L0_RXD_DATA    => ADC_DATA_B(13 downto 12));

                
    process (Sample_CLK) begin
        if (Reset = '0') then
            STATE_CLK       <= '0';
            Rate_CNTL       <= x"00";
        elsif (rising_edge(Sample_CLK)) then
            Rate_CNTL <= Rate_CNTL + 1;
            STATE_CLK       <= '0';
            if(Rate_CNTL = x"03") then
                Rate_CNTL       <= x"00";
                STATE_CLK       <= '1';
            end if;
        end if;
    end process;
   
  
       process (Sample_CLK) begin
        if ((Reset = '0') or (ADC_Cntl_state = S_ADC_SEN_SPI)) then
            Start_ADC_SPI    <= '0';
        elsif (rising_edge(Sample_CLK)) then
            ADC_REG_START_s1 <= ADC_REG_START;
            if((ADC_REG_START = '1') and (ADC_REG_START_s1 = '0')) then
                Start_ADC_SPI    <= '1';
            end if;
            
        end if;
    end process;     


    process (Sample_CLK) begin
        if (rising_edge(Sample_CLK)) then
            if (Reset = '0') then
                    ADC_SDATA       <= '0';  
                    ADC_SEN         <= '1';
                    ADC_SCLK        <= '1';
                    bit_cnt         <= x"00";
                    ADC_Cntl_state  <= S_idle; 
            elsif(STATE_CLK = '1') then
                case ADC_Cntl_state is
                    when S_idle =>
                        ADC_SDATA       <= '0';  
                        ADC_SEN         <= '1';
                        ADC_SCLK        <= '1';
                        bit_cnt         <= x"00";
                        ADC_REG_d       <=  ADC_REG_ADDR & ADC_REG_DIN;
                        if( Start_ADC_SPI = '1') then
                            ADC_Cntl_state  <= S_ADC_SEN_SPI;
                        end if;
                    when S_ADC_SEN_SPI =>
                        ADC_SEN     <= '0';
                        ADC_SDATA   <= ADC_REG_d(15); 
                        ADC_REG_d   <= ADC_REG_d(14 downto 0) & '0'; 
                        ADC_Cntl_state  <= S_ADC_CLK_L_SPI;
                    when S_ADC_CLK_L_SPI =>
                        ADC_SCLK        <= '0';
                        bit_cnt         <= bit_cnt + 1;
                        reg_dout        <= reg_dout(6 downto 0) & ADC_SDOUT;
                        ADC_Cntl_state  <= S_ADC_CLK_H_SPI ;
                    when S_ADC_CLK_H_SPI =>
                        ADC_SCLK        <= '1';                        
                        ADC_SDATA   <= ADC_REG_d(15); 
                        ADC_REG_d   <= ADC_REG_d(14 downto 0) & '0'; 
                        ADC_Cntl_state  <= S_ADC_CLK_L_SPI;
                        if(bit_cnt >= 16) then
                            ADC_SEN         <= '1';
                            ADC_REG_DOUT    <= reg_dout;
                            ADC_Cntl_state  <= S_idle; 
                        end if;
                    when others =>
                        ADC_Cntl_state <= S_idle;
                end case;
            end if;
        end if;
   end process;
   


end architecture_ADS4245_CNTL;
