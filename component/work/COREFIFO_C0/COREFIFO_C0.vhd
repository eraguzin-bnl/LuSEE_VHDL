----------------------------------------------------------------------
-- Created by SmartDesign Tue Nov 22 11:44:30 2022
-- Version: 2022.2 2022.2.0.10
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Component Description (Tcl) 
----------------------------------------------------------------------
--# Exporting Component Description of COREFIFO_C0 to TCL
--# Family: PolarFire
--# Part Number: MPF300T-1FCG1152E
--# Create and Configure the core component COREFIFO_C0
--create_and_configure_core -core_vlnv {Actel:DirectCore:COREFIFO:3.0.101} -component_name {COREFIFO_C0} -params {\
--"AE_STATIC_EN:false"  \
--"AEVAL:4"  \
--"AF_STATIC_EN:false"  \
--"AFVAL:1020"  \
--"CTRL_TYPE:2"  \
--"DIE_SIZE:15"  \
--"ECC:0"  \
--"ESTOP:true"  \
--"FSTOP:true"  \
--"FWFT:false"  \
--"NUM_STAGES:2"  \
--"OVERFLOW_EN:false"  \
--"PIPE:1"  \
--"PREFETCH:false"  \
--"RAM_OPT:0"  \
--"RDCNT_EN:false"  \
--"RDEPTH:40960"  \
--"RE_POLARITY:0"  \
--"READ_DVALID:false"  \
--"RWIDTH:14"  \
--"SYNC:0"  \
--"SYNC_RESET:1"  \
--"UNDERFLOW_EN:false"  \
--"WDEPTH:40960"  \
--"WE_POLARITY:0"  \
--"WRCNT_EN:false"  \
--"WRITE_ACK:false"  \
--"WWIDTH:14"   }
--# Exporting Component Description of COREFIFO_C0 to TCL done

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library polarfire;
use polarfire.all;
library COREFIFO_LIB;
use COREFIFO_LIB.all;
----------------------------------------------------------------------
-- COREFIFO_C0 entity declaration
----------------------------------------------------------------------
entity COREFIFO_C0 is
    -- Port list
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
end COREFIFO_C0;
----------------------------------------------------------------------
-- COREFIFO_C0 architecture body
----------------------------------------------------------------------
architecture RTL of COREFIFO_C0 is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- COREFIFO_C0_COREFIFO_C0_0_COREFIFO   -   Actel:DirectCore:COREFIFO:3.0.101
component COREFIFO_C0_COREFIFO_C0_0_COREFIFO
    generic( 
        AE_STATIC_EN : integer := 0 ;
        AEVAL        : integer := 4 ;
        AF_STATIC_EN : integer := 0 ;
        AFVAL        : integer := 1020 ;
        CTRL_TYPE    : integer := 2 ;
        DIE_SIZE     : integer := 15 ;
        ECC          : integer := 0 ;
        ESTOP        : integer := 1 ;
        FAMILY       : integer := 26 ;
        FSTOP        : integer := 1 ;
        FWFT         : integer := 0 ;
        NUM_STAGES   : integer := 2 ;
        OVERFLOW_EN  : integer := 0 ;
        PIPE         : integer := 1 ;
        PREFETCH     : integer := 0 ;
        RAM_OPT      : integer := 0 ;
        RDCNT_EN     : integer := 0 ;
        RDEPTH       : integer := 40960 ;
        RE_POLARITY  : integer := 0 ;
        READ_DVALID  : integer := 0 ;
        RWIDTH       : integer := 14 ;
        SYNC         : integer := 0 ;
        SYNC_RESET   : integer := 1 ;
        UNDERFLOW_EN : integer := 0 ;
        WDEPTH       : integer := 40960 ;
        WE_POLARITY  : integer := 0 ;
        WRCNT_EN     : integer := 0 ;
        WRITE_ACK    : integer := 0 ;
        WWIDTH       : integer := 14 
        );
    -- Port list
    port(
        -- Inputs
        CLK        : in  std_logic;
        DATA       : in  std_logic_vector(13 downto 0);
        MEMRD      : in  std_logic_vector(13 downto 0);
        RCLOCK     : in  std_logic;
        RE         : in  std_logic;
        RESET_N    : in  std_logic;
        RRESET_N   : in  std_logic;
        WCLOCK     : in  std_logic;
        WE         : in  std_logic;
        WRESET_N   : in  std_logic;
        -- Outputs
        AEMPTY     : out std_logic;
        AFULL      : out std_logic;
        DB_DETECT  : out std_logic;
        DVLD       : out std_logic;
        EMPTY      : out std_logic;
        FULL       : out std_logic;
        MEMRADDR   : out std_logic_vector(15 downto 0);
        MEMRE      : out std_logic;
        MEMWADDR   : out std_logic_vector(15 downto 0);
        MEMWD      : out std_logic_vector(13 downto 0);
        MEMWE      : out std_logic;
        OVERFLOW   : out std_logic;
        Q          : out std_logic_vector(13 downto 0);
        RDCNT      : out std_logic_vector(16 downto 0);
        SB_CORRECT : out std_logic;
        UNDERFLOW  : out std_logic;
        WACK       : out std_logic;
        WRCNT      : out std_logic_vector(16 downto 0)
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal EMPTY_net_0 : std_logic;
signal FULL_net_0  : std_logic;
signal Q_net_0     : std_logic_vector(13 downto 0);
signal FULL_net_1  : std_logic;
signal EMPTY_net_1 : std_logic;
signal Q_net_1     : std_logic_vector(13 downto 0);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal GND_net     : std_logic;
signal MEMRD_const_net_0: std_logic_vector(13 downto 0);

begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 GND_net           <= '0';
 MEMRD_const_net_0 <= B"00000000000000";
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 FULL_net_1     <= FULL_net_0;
 FULL           <= FULL_net_1;
 EMPTY_net_1    <= EMPTY_net_0;
 EMPTY          <= EMPTY_net_1;
 Q_net_1        <= Q_net_0;
 Q(13 downto 0) <= Q_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- COREFIFO_C0_0   -   Actel:DirectCore:COREFIFO:3.0.101
COREFIFO_C0_0 : COREFIFO_C0_COREFIFO_C0_0_COREFIFO
    generic map( 
        AE_STATIC_EN => ( 0 ),
        AEVAL        => ( 4 ),
        AF_STATIC_EN => ( 0 ),
        AFVAL        => ( 1020 ),
        CTRL_TYPE    => ( 2 ),
        DIE_SIZE     => ( 15 ),
        ECC          => ( 0 ),
        ESTOP        => ( 1 ),
        FAMILY       => ( 26 ),
        FSTOP        => ( 1 ),
        FWFT         => ( 0 ),
        NUM_STAGES   => ( 2 ),
        OVERFLOW_EN  => ( 0 ),
        PIPE         => ( 1 ),
        PREFETCH     => ( 0 ),
        RAM_OPT      => ( 0 ),
        RDCNT_EN     => ( 0 ),
        RDEPTH       => ( 40960 ),
        RE_POLARITY  => ( 0 ),
        READ_DVALID  => ( 0 ),
        RWIDTH       => ( 14 ),
        SYNC         => ( 0 ),
        SYNC_RESET   => ( 1 ),
        UNDERFLOW_EN => ( 0 ),
        WDEPTH       => ( 40960 ),
        WE_POLARITY  => ( 0 ),
        WRCNT_EN     => ( 0 ),
        WRITE_ACK    => ( 0 ),
        WWIDTH       => ( 14 )
        )
    port map( 
        -- Inputs
        CLK        => GND_net, -- tied to '0' from definition
        WCLOCK     => WCLOCK,
        RCLOCK     => RCLOCK,
        RESET_N    => GND_net, -- tied to '0' from definition
        WRESET_N   => WRESET_N,
        RRESET_N   => RRESET_N,
        WE         => WE,
        RE         => RE,
        DATA       => DATA,
        MEMRD      => MEMRD_const_net_0, -- tied to X"0" from definition
        -- Outputs
        FULL       => FULL_net_0,
        EMPTY      => EMPTY_net_0,
        AFULL      => OPEN,
        AEMPTY     => OPEN,
        OVERFLOW   => OPEN,
        UNDERFLOW  => OPEN,
        WACK       => OPEN,
        DVLD       => OPEN,
        MEMWE      => OPEN,
        MEMRE      => OPEN,
        SB_CORRECT => OPEN,
        DB_DETECT  => OPEN,
        Q          => Q_net_0,
        WRCNT      => OPEN,
        RDCNT      => OPEN,
        MEMWADDR   => OPEN,
        MEMRADDR   => OPEN,
        MEMWD      => OPEN 
        );

end RTL;
