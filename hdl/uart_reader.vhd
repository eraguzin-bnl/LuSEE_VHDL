--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: uart_reader.vhd
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

entity uart_reader is
port (
    CLK                 : IN std_logic;
    RST                 : IN std_logic;
    
    RX_UART_DATA        : IN  std_logic_vector(7 downto 0); -- example
    TX_UART_DATA_r      : OUT std_logic_vector(7 downto 0); -- example
    FRAMING_ERR         : IN  std_logic; -- example
    OVERFLOW            : IN  std_logic; -- example
    PARITY_ERR          : IN  std_logic; -- example
    RXRDY               : IN  std_logic; -- example
    TXRDY               : IN  std_logic; -- example
    WEN_r               : OUT std_logic;
    OEN                 : OUT std_logic;

    Reg_STRB            : OUT std_logic;
    Reg_OPCODE          : OUT std_logic_vector(7 downto 0);
    Reg_ADDR            : OUT std_logic_vector(15 downto 0);
    Reg_RX_DATA         : OUT std_logic_vector(31 downto 0);
    Reg_TX_DATA         : IN std_logic_vector(31 downto 0);

    FF_DATA             : IN std_logic_vector(31 downto 0);
    FF_CLK              : IN std_logic;
    FF_WE               : IN std_logic;
    FF_AFULL            : OUT std_logic;
    FF_FULL             : OUT std_logic
      
    
    
    

);
end uart_reader;
architecture architecture_uart_reader of uart_reader is
   

   component  UART_FIFO
    -- Port list
    port(

        DATA     : in  std_logic_vector(31 downto 0);
        RCLOCK   : in  std_logic;
        RE       : in  std_logic;
        RRESET_N : in  std_logic;
        WCLOCK   : in  std_logic;
        WE       : in  std_logic;
        WRESET_N : in  std_logic;
        AFULL    : out std_logic;
        EMPTY    : out std_logic;
        FULL     : out std_logic;
        Q        : out std_logic_vector(31 downto 0)
        );
end component;
   
  

    
    type uart_state_type is (s_idle, 
                             s_TX_HS_DATA_0,s_TX_HS_DATA_0_s,s_TX_HS_DATA_0_wait, 
                             s_TX_HS_DATA_1,s_TX_HS_DATA_1_wait, 
                             s_TX_HS_DATA_2,s_TX_HS_DATA_2_wait, 
                             s_TX_HS_DATA_3,s_TX_HS_DATA_3_wait, 
                             s_TX_DATA_0,s_TX_DATA_0_wait, 
                             s_TX_DATA_1,s_TX_DATA_1_wait, 
                             s_TX_DATA_2,s_TX_DATA_2_wait, 
                             s_TX_DATA_3,s_TX_DATA_3_wait);
                              
    signal uart_wr_state    : uart_state_type;

    signal DATA_reg         : Array_7_TO_0(11 DOWNTO 0); --STD_LOGIC_VECTOR(13 downto 0);
    signal RXRDY_buf        : std_logic;
    signal wr_strb          : std_logic;
    signal Reg_STRB_s       : std_logic;
    signal FF_RE            : std_logic;
    signal FF_Q             : std_logic_VECTOR(31 downto 0);
    signal FF_EMPTY         : std_logic;
    signal FF_Q_dly         : std_logic_VECTOR(31 downto 0);
    
    signal TX_UART_DATA     : std_logic_VECTOR(7 downto 0);
    signal WEN              : std_logic;
    
    signal FF_AFULL_L       : std_logic;
begin


  UART_FIFO_inst : UART_FIFO
    port MAP (
        DATA     => FF_DATA,
        RCLOCK   => CLK,
        RE       => FF_RE,
        RRESET_N => RST,
        WCLOCK   => FF_CLK,
        WE       => FF_WE,
        WRESET_N => RST,
        AFULL    => FF_AFULL_L,
        EMPTY    => FF_EMPTY,
        FULL     => FF_FULL,
        Q        => FF_Q
        );

        
      
       process (CLK) begin
            if (rising_edge(CLK)) then
                if( FF_AFULL_L = '1') then 
                    FF_AFULL    <= '1';
                end if;
                if(FF_EMPTY = '1') then
                    FF_AFULL    <= '0';
                end if;
            end if;
       end process;
            
              TX_UART_DATA_r    <= TX_UART_DATA;
              WEN_r             <= WEN; 
        
   
    process (CLK) begin
        if (rising_edge(CLK)) then
            if (RST = '0') then
                WEN     <= '1';
                FF_RE   <= '0';
            else
                case uart_wr_state is
                    when s_idle =>
                        WEN     <= '1';
                        FF_RE   <= '0';
                        if(FF_EMPTY = '0') then
                            FF_RE   <= '1';
                            uart_wr_state <= s_TX_HS_DATA_0;
                        end if;
                        if (wr_strb = '1') then
                            uart_wr_state <= s_TX_DATA_0;
                        end if;
                    when s_TX_HS_DATA_0 =>
                             WEN     <= '1';
                             FF_RE   <= '0';
                             uart_wr_state <= s_TX_HS_DATA_0_s;
                     when s_TX_HS_DATA_0_s =>        
                             TX_UART_DATA    <= FF_Q(7 downto 0);
                             if(TXRDY = '1') then
                                WEN             <= '0';
                                uart_wr_state <= s_TX_HS_DATA_0_wait;
                            end if;
                    when s_TX_HS_DATA_0_wait =>
                            FF_Q_dly    <= FF_Q;
                            WEN <= '1';
                            uart_wr_state <= s_TX_HS_DATA_1;
 
                    when s_TX_HS_DATA_1 =>
                             WEN <= '1';
                             TX_UART_DATA    <= FF_Q_dly(15 downto 8);
                             if(TXRDY = '1') then
                                WEN             <= '0';
                                uart_wr_state <= s_TX_HS_DATA_1_wait;
                            end if;
                            
                    when s_TX_HS_DATA_1_wait =>
                            WEN <= '1';
                            uart_wr_state <= s_TX_HS_DATA_2;               
                            
                    when s_TX_HS_DATA_2 =>
                             WEN <= '1';
                             TX_UART_DATA    <= FF_Q_dly(23 downto 16);
                             if(TXRDY = '1') then
                                WEN             <= '0';
                                uart_wr_state <= s_TX_HS_DATA_2_wait;
                            end if;
                            
                    when s_TX_HS_DATA_2_wait =>
                            WEN <= '1';
                            uart_wr_state <= s_TX_HS_DATA_3;               
                            
                            
                      when s_TX_HS_DATA_3 =>
                             WEN <= '1';
                             TX_UART_DATA    <= FF_Q_dly(31 downto 24);
                             if(TXRDY = '1') then
                                WEN             <= '0';
                                uart_wr_state <= s_TX_HS_DATA_3_wait;
                            end if;                          
                    when s_TX_HS_DATA_3_wait =>   
                            WEN <= '1';
                            if(FF_EMPTY = '0') then
                                FF_RE   <= '1';
                                uart_wr_state <= s_TX_HS_DATA_0;
                            else
                               uart_wr_state <= s_idle;                 
                            end if;
                    when s_TX_DATA_0 =>
                             WEN <= '1';
                             if(TXRDY = '1') then
                                WEN             <= '0';
                                TX_UART_DATA    <= Reg_TX_DATA(31 downto 24);
                                uart_wr_state <= s_TX_DATA_0_wait;
                            end if;
                    when s_TX_DATA_0_wait =>   
                            WEN <= '1';
                            uart_wr_state <= s_TX_DATA_1;
                    when s_TX_DATA_1 =>
                             WEN <= '1';
                             if(TXRDY = '1') then
                                WEN             <= '0';
                                TX_UART_DATA    <= Reg_TX_DATA(23 downto 16);
                                uart_wr_state <= s_TX_DATA_1_wait;
                            end if;
                    when s_TX_DATA_1_wait =>   
                            WEN <= '1';
                            uart_wr_state <= s_TX_DATA_2;

                   when s_TX_DATA_2 =>
                             WEN <= '1';
                             if(TXRDY = '1') then
                                WEN             <= '0';
                                TX_UART_DATA    <= Reg_TX_DATA(15 downto 8);
                                uart_wr_state <= s_TX_DATA_2_wait;
                            end if;
                    when s_TX_DATA_2_wait =>   
                            WEN <= '1';
                            uart_wr_state <= s_TX_DATA_3;
                    when s_TX_DATA_3 =>
                             WEN <= '1';
                             if(TXRDY = '1') then
                                WEN             <= '0';
                                TX_UART_DATA    <= Reg_TX_DATA(7 downto 0);
                                uart_wr_state <= s_TX_DATA_3_wait;
                            end if;
                    when s_TX_DATA_3_wait =>   
                            WEN <= '1';
                            uart_wr_state <= s_idle;
                    when others =>
                        uart_wr_state <= s_idle;
                end case;
            end if;
        end if;
   end process;
   
       process (CLK) begin
            if (rising_edge(CLK)) then
                OEN <= '1';
                RXRDY_buf <= RXRDY;
                if ((RXRDY = '1') and  (RXRDY_buf = '0')) then
                    OEN <= '0';
                end if;
            end if;
       end process;
       
   
       process (CLK) begin
        if (rising_edge(CLK)) then
            if (RST = '0') then
                Reg_STRB        <= '0';
                Reg_STRB_s      <= '0';
                Reg_OPCODE      <= x"FF";
                Reg_ADDR        <= x"0000";
                Reg_RX_DATA     <= x"00000000";
                wr_strb         <= '0';
            else
                Reg_STRB_s  <= '0';
                Reg_STRB    <= Reg_STRB_s;
                wr_strb     <= '0';
                if(OEN = '0') then
                     for i in 0 to 8 loop
                        DATA_reg(i+1) <= DATA_reg(i);
                     end loop;
                     DATA_reg(0) <= RX_UART_DATA;
                     if((DATA_reg(9) = x"DE") and (DATA_reg(8) = x"AD") and (DATA_reg(0) = x"BE") and (RX_UART_DATA = x"EF")) then 
                        Reg_STRB_s    <= '1';
                        Reg_OPCODE  <= DATA_reg(7);
                        Reg_ADDR    <= DATA_reg(6) & DATA_reg(5);
                        Reg_RX_DATA <= DATA_reg(4) & DATA_reg(3) & DATA_reg(2) & DATA_reg(1);
                        if(DATA_reg(7) = x"01") then
                            wr_strb  <= '1';
                        end if;
                     end if;
                end if;
            end if;
        end if;
   end process;
   
   
end architecture_uart_reader;
