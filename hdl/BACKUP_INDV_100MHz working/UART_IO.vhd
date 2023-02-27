--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: UART_IO.vhd
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

use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;
use work.LuSEE_Pkg.all;

entity UART_IO is
port (
 
    clk         : IN std_logic;
    rstn         : IN std_logic;
    rx          : IN  std_logic; -- UART rx
    tx          : OUT std_logic;  -- UART tx
    
    
    DATA_IN     : OUT std_logic_vector(31 downto 0); 
    ADDRESS_OUT : OUT std_logic_vector(15 downto 0); 
    WR          : OUT std_logic;
    DATA_OUT    : IN  std_logic_vector(31 downto 0);
      
      
    HS_DATA     : IN  std_logic_vector(31 downto 0);  
    HS_DATA_clk : IN  std_logic;  
    HS_DATA_WR  : IN  std_logic;  
    HS_DATA_FULL: OUT std_logic
      
);
end UART_IO;
architecture architecture_UART_IO of UART_IO is

    signal BAUD_VAL         : std_logic_vector(12 downto 0);
    signal BIT8             : std_logic;
    signal CSN              : std_logic;
    signal data_in_s        : std_logic_vector(7 downto 0);
    signal ODD_N_EVEN       : std_logic;
    signal oen_s            : std_logic;
    signal PARITY_EN        : std_logic;
    signal wen_s            : std_logic;
    
    signal data_out_s       : std_logic_vector(7 downto 0);
    signal framing_err_s    : std_logic;
    signal overflow_s       : std_logic;
    signal parity_err_s     : std_logic;
    signal rxrdy_s          : std_logic;
    signal txrdy_s          : std_logic;
    signal start_s          : std_logic;
    
    signal Reg_STRB         : std_logic;
    signal OPCODE_s         : std_logic_vector(7 downto 0);
    signal ADDR_s           : std_logic_vector(15 downto 0);
    signal DATA_s           : std_logic_vector(31 downto 0);
    signal BAUD_VAL_FRACTION  : STD_LOGIC_VECTOR(2 DOWNTO 0);  --USED TO ADD EXTRA PRECISION TO BAUD VALUE WHEN BAUD_VAL_FRCTN_EN = 1
begin


--      BAUD_VAL      <= '0' & x"145";      -- 9600      @50MHz
--      BAUD_VAL      <= '0' & x"01A";     -- 115200   @50MHz   26dec .126frac
--      BAUD_VAL_FRACTION <= b"001";        -- 115200  @50MHz     53dec  .126frac

      BAUD_VAL          <= '0' & x"035";   -- 115200      @100MHz     53dec  .253frac
      BAUD_VAL_FRACTION <= b"010";         -- 115200      @100MHz     53dec  .253frac
      BIT8          <= '1';
      CSN           <= '0';
      ODD_N_EVEN    <= '1';
      PARITY_EN     <= '1';

      
      --
    --process (CLK) begin
        --if (rising_edge(CLK)) then
       ----     data_out             <= data_out_s;
        ----    framing_err_out      <= framing_err_s;
        ----    overflow_err_out     <= overflow_s;
      ----      parity_err_out       <= parity_err_s;
      ----      rxrdy_out            <= rxrdy_s;
      ----      txrdy_out            <= txrdy_s;
        --end if;
    --end process;
   -- 
    
    
uart_i : entity work.COREUART_C0
        port map (
            BAUD_VAL    => BAUD_VAL,        -- 325 in hex, to bring 50 MHz clock to 9600 Baud rate      BAUD_VAL      <= '0' & x"145";
            BAUD_VAL_FRACTION =>  BAUD_VAL_FRACTION,
            BIT8        => BIT8,            -- BIT8          <= '1';
            CLK         => clk,
            CSN         => CSN,             -- CSN           <= '0';
            DATA_IN     => data_in_s,
            ODD_N_EVEN  => ODD_N_EVEN,      -- ODD_N_EVEN    <= '1'; 
            OEN         => oen_s,
            PARITY_EN   => PARITY_EN,       -- PARITY_EN     <= '1';
            RESET_N     => rstn,
            RX          => rx,
            WEN         => wen_s,
            
            DATA_OUT    => data_out_s,
            FRAMING_ERR => framing_err_s,
            OVERFLOW    => overflow_s,
            PARITY_ERR  => parity_err_s,
            RXRDY       => rxrdy_s,
            TX          => tx,
            TXRDY       => txrdy_s
        );
        


uart_reader_i : entity work.uart_reader
        port map (
            CLK         => clk,
            RST         => rstn,

            RX_UART_DATA    => data_out_s,
            TX_UART_DATA_r    => data_in_s,
            FRAMING_ERR => framing_err_s,
            OVERFLOW    => overflow_s,
            PARITY_ERR  => parity_err_s,
            RXRDY       => rxrdy_s,
            TXRDY       => txrdy_s,
            OEN         => oen_s,
            WEN_r         => wen_s, 
       
       
            Reg_STRB     => Reg_STRB,
            Reg_OPCODE   => OPCODE_s, 
            Reg_ADDR     => ADDR_s,
            Reg_RX_DATA  => DATA_s,
            Reg_TX_DATA  => DATA_OUT,
            
            FF_DATA      => HS_DATA,
            FF_CLK       => HS_DATA_clk,
            FF_WE        => HS_DATA_WR,
            FF_AFULL     => HS_DATA_FULL,
            FF_FULL      => open
            
        );     
        
        process (CLK) begin
        if (rising_edge(CLK)) then
            WR  <= '0';
            ADDRESS_OUT  <= ADDR_s;
            DATA_IN      <= DATA_s;
            if(Reg_STRB = '1') then
               if(OPCODE_s = x"00") then
                    WR  <= '1';
               end if;
            end if;
        end if;
        
        
   end process;
   
    
        

   -- architecture body
end architecture_UART_IO;
