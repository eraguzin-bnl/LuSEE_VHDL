----------------------------------------------------------------------
-- Created by SmartDesign Wed Nov 30 17:32:54 2022
-- Version: 2022.2 2022.2.0.10
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Component Description (Tcl) 
----------------------------------------------------------------------
--# Exporting Component Description of COREUART_C0 to TCL
--# Family: PolarFire
--# Part Number: MPF300T-1FCG1152E
--# Create and Configure the core component COREUART_C0
--create_and_configure_core -core_vlnv {Actel:DirectCore:COREUART:5.7.100} -component_name {COREUART_C0} -params {\
--"BAUD_VAL_FRCTN_EN:true"  \
--"RX_FIFO:0"  \
--"RX_LEGACY_MODE:0"  \
--"TX_FIFO:0"  \
--"USE_SOFT_FIFO:0"   }
--# Exporting Component Description of COREUART_C0 to TCL done

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library polarfire;
use polarfire.all;
library COREUART_LIB;
use COREUART_LIB.all;
use COREUART_LIB.COREUART_C0_COREUART_C0_0_components.all;
----------------------------------------------------------------------
-- COREUART_C0 entity declaration
----------------------------------------------------------------------
entity COREUART_C0 is
    -- Port list
    port(
        -- Inputs
        BAUD_VAL          : in  std_logic_vector(12 downto 0);
        BAUD_VAL_FRACTION : in  std_logic_vector(2 downto 0);
        BIT8              : in  std_logic;
        CLK               : in  std_logic;
        CSN               : in  std_logic;
        DATA_IN           : in  std_logic_vector(7 downto 0);
        ODD_N_EVEN        : in  std_logic;
        OEN               : in  std_logic;
        PARITY_EN         : in  std_logic;
        RESET_N           : in  std_logic;
        RX                : in  std_logic;
        WEN               : in  std_logic;
        -- Outputs
        DATA_OUT          : out std_logic_vector(7 downto 0);
        FRAMING_ERR       : out std_logic;
        OVERFLOW          : out std_logic;
        PARITY_ERR        : out std_logic;
        RXRDY             : out std_logic;
        TX                : out std_logic;
        TXRDY             : out std_logic
        );
end COREUART_C0;
----------------------------------------------------------------------
-- COREUART_C0 architecture body
----------------------------------------------------------------------
architecture RTL of COREUART_C0 is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- COREUART_C0_COREUART_C0_0_COREUART   -   Actel:DirectCore:COREUART:5.7.100
component COREUART_C0_COREUART_C0_0_COREUART
    generic( 
        BAUD_VAL_FRCTN_EN : integer := 1 ;
        FAMILY            : integer := 26 ;
        RX_FIFO           : integer := 0 ;
        RX_LEGACY_MODE    : integer := 0 ;
        TX_FIFO           : integer := 0 
        );
    -- Port list
    port(
        -- Inputs
        BAUD_VAL          : in  std_logic_vector(12 downto 0);
        BAUD_VAL_FRACTION : in  std_logic_vector(2 downto 0);
        BIT8              : in  std_logic;
        CLK               : in  std_logic;
        CSN               : in  std_logic;
        DATA_IN           : in  std_logic_vector(7 downto 0);
        ODD_N_EVEN        : in  std_logic;
        OEN               : in  std_logic;
        PARITY_EN         : in  std_logic;
        RESET_N           : in  std_logic;
        RX                : in  std_logic;
        WEN               : in  std_logic;
        -- Outputs
        DATA_OUT          : out std_logic_vector(7 downto 0);
        FRAMING_ERR       : out std_logic;
        OVERFLOW          : out std_logic;
        PARITY_ERR        : out std_logic;
        RXRDY             : out std_logic;
        TX                : out std_logic;
        TXRDY             : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal DATA_OUT_net_0    : std_logic_vector(7 downto 0);
signal FRAMING_ERR_net_0 : std_logic;
signal OVERFLOW_net_0    : std_logic;
signal PARITY_ERR_net_0  : std_logic;
signal RXRDY_net_0       : std_logic;
signal TX_net_0          : std_logic;
signal TXRDY_net_0       : std_logic;
signal OVERFLOW_net_1    : std_logic;
signal PARITY_ERR_net_1  : std_logic;
signal RXRDY_net_1       : std_logic;
signal TX_net_1          : std_logic;
signal TXRDY_net_1       : std_logic;
signal FRAMING_ERR_net_1 : std_logic;
signal DATA_OUT_net_1    : std_logic_vector(7 downto 0);

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 OVERFLOW_net_1       <= OVERFLOW_net_0;
 OVERFLOW             <= OVERFLOW_net_1;
 PARITY_ERR_net_1     <= PARITY_ERR_net_0;
 PARITY_ERR           <= PARITY_ERR_net_1;
 RXRDY_net_1          <= RXRDY_net_0;
 RXRDY                <= RXRDY_net_1;
 TX_net_1             <= TX_net_0;
 TX                   <= TX_net_1;
 TXRDY_net_1          <= TXRDY_net_0;
 TXRDY                <= TXRDY_net_1;
 FRAMING_ERR_net_1    <= FRAMING_ERR_net_0;
 FRAMING_ERR          <= FRAMING_ERR_net_1;
 DATA_OUT_net_1       <= DATA_OUT_net_0;
 DATA_OUT(7 downto 0) <= DATA_OUT_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- COREUART_C0_0   -   Actel:DirectCore:COREUART:5.7.100
COREUART_C0_0 : COREUART_C0_COREUART_C0_0_COREUART
    generic map( 
        BAUD_VAL_FRCTN_EN => ( 1 ),
        FAMILY            => ( 26 ),
        RX_FIFO           => ( 0 ),
        RX_LEGACY_MODE    => ( 0 ),
        TX_FIFO           => ( 0 )
        )
    port map( 
        -- Inputs
        BIT8              => BIT8,
        CLK               => CLK,
        CSN               => CSN,
        ODD_N_EVEN        => ODD_N_EVEN,
        OEN               => OEN,
        PARITY_EN         => PARITY_EN,
        RESET_N           => RESET_N,
        RX                => RX,
        WEN               => WEN,
        BAUD_VAL          => BAUD_VAL,
        DATA_IN           => DATA_IN,
        BAUD_VAL_FRACTION => BAUD_VAL_FRACTION,
        -- Outputs
        OVERFLOW          => OVERFLOW_net_0,
        PARITY_ERR        => PARITY_ERR_net_0,
        RXRDY             => RXRDY_net_0,
        TX                => TX_net_0,
        TXRDY             => TXRDY_net_0,
        FRAMING_ERR       => FRAMING_ERR_net_0,
        DATA_OUT          => DATA_OUT_net_0 
        );

end RTL;
