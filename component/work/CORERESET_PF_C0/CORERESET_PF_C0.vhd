----------------------------------------------------------------------
-- Created by SmartDesign Thu Jan 12 16:44:20 2023
-- Version: 2022.2 2022.2.0.10
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Component Description (Tcl) 
----------------------------------------------------------------------
--# Exporting Component Description of CORERESET_PF_C0 to TCL
--# Family: PolarFire
--# Part Number: MPF300T-1FCG1152E
--# Create and Configure the core component CORERESET_PF_C0
--create_and_configure_core -core_vlnv {Actel:DirectCore:CORERESET_PF:2.3.100} -component_name {CORERESET_PF_C0} -params { }
--# Exporting Component Description of CORERESET_PF_C0 to TCL done

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library polarfire;
use polarfire.all;
----------------------------------------------------------------------
-- CORERESET_PF_C0 entity declaration
----------------------------------------------------------------------
entity CORERESET_PF_C0 is
    -- Port list
    port(
        -- Inputs
        BANK_x_VDDI_STATUS : in  std_logic;
        BANK_y_VDDI_STATUS : in  std_logic;
        CLK                : in  std_logic;
        EXT_RST_N          : in  std_logic;
        FF_US_RESTORE      : in  std_logic;
        FPGA_POR_N         : in  std_logic;
        INIT_DONE          : in  std_logic;
        PLL_LOCK           : in  std_logic;
        SS_BUSY            : in  std_logic;
        -- Outputs
        FABRIC_RESET_N     : out std_logic;
        PLL_POWERDOWN_B    : out std_logic
        );
end CORERESET_PF_C0;
----------------------------------------------------------------------
-- CORERESET_PF_C0 architecture body
----------------------------------------------------------------------
architecture RTL of CORERESET_PF_C0 is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- CORERESET_PF_C0_CORERESET_PF_C0_0_CORERESET_PF   -   Actel:DirectCore:CORERESET_PF:2.3.100
component CORERESET_PF_C0_CORERESET_PF_C0_0_CORERESET_PF
    -- Port list
    port(
        -- Inputs
        BANK_x_VDDI_STATUS : in  std_logic;
        BANK_y_VDDI_STATUS : in  std_logic;
        CLK                : in  std_logic;
        EXT_RST_N          : in  std_logic;
        FF_US_RESTORE      : in  std_logic;
        FPGA_POR_N         : in  std_logic;
        INIT_DONE          : in  std_logic;
        PLL_LOCK           : in  std_logic;
        SS_BUSY            : in  std_logic;
        -- Outputs
        FABRIC_RESET_N     : out std_logic;
        PLL_POWERDOWN_B    : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal FABRIC_RESET_N_net_0  : std_logic;
signal PLL_POWERDOWN_B_net_0 : std_logic;
signal PLL_POWERDOWN_B_net_1 : std_logic;
signal FABRIC_RESET_N_net_1  : std_logic;

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 PLL_POWERDOWN_B_net_1 <= PLL_POWERDOWN_B_net_0;
 PLL_POWERDOWN_B       <= PLL_POWERDOWN_B_net_1;
 FABRIC_RESET_N_net_1  <= FABRIC_RESET_N_net_0;
 FABRIC_RESET_N        <= FABRIC_RESET_N_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- CORERESET_PF_C0_0   -   Actel:DirectCore:CORERESET_PF:2.3.100
CORERESET_PF_C0_0 : CORERESET_PF_C0_CORERESET_PF_C0_0_CORERESET_PF
    port map( 
        -- Inputs
        CLK                => CLK,
        EXT_RST_N          => EXT_RST_N,
        BANK_x_VDDI_STATUS => BANK_x_VDDI_STATUS,
        BANK_y_VDDI_STATUS => BANK_y_VDDI_STATUS,
        PLL_LOCK           => PLL_LOCK,
        SS_BUSY            => SS_BUSY,
        INIT_DONE          => INIT_DONE,
        FF_US_RESTORE      => FF_US_RESTORE,
        FPGA_POR_N         => FPGA_POR_N,
        -- Outputs
        PLL_POWERDOWN_B    => PLL_POWERDOWN_B_net_0,
        FABRIC_RESET_N     => FABRIC_RESET_N_net_0 
        );

end RTL;
