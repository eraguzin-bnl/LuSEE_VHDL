--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: PF_RESET.vhd
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

library ieee;
use ieee.std_logic_1164.all;

library polarfire;
use polarfire.all;


entity PF_RESET is
port (

	SYS_CLK     : IN  std_logic; 
    Reset_IN    : IN  std_logic; 
    Reset_OUT   : OUT std_logic  
);
end PF_RESET;
architecture architecture_PF_RESET of PF_RESET is


component CORERESET_PF_C0
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


component PF_INIT_MONITOR_C0
    -- Port list
    port(
        -- Outputs
        AUTOCALIB_DONE             : out std_logic;
        BANK_0_VDDI_STATUS         : out std_logic;
        BANK_1_VDDI_STATUS         : out std_logic;
        BANK_2_VDDI_STATUS         : out std_logic;
        BANK_4_VDDI_STATUS         : out std_logic;
        BANK_5_VDDI_STATUS         : out std_logic;
        BANK_6_VDDI_STATUS         : out std_logic;
        BANK_7_VDDI_STATUS         : out std_logic;
        DEVICE_INIT_DONE           : out std_logic;
        FABRIC_POR_N               : out std_logic;
        PCIE_INIT_DONE             : out std_logic;
        SRAM_INIT_DONE             : out std_logic;
        SRAM_INIT_FROM_SNVM_DONE   : out std_logic;
        SRAM_INIT_FROM_SPI_DONE    : out std_logic;
        SRAM_INIT_FROM_UPROM_DONE  : out std_logic;
        USRAM_INIT_DONE            : out std_logic;
        USRAM_INIT_FROM_SNVM_DONE  : out std_logic;
        USRAM_INIT_FROM_SPI_DONE   : out std_logic;
        USRAM_INIT_FROM_UPROM_DONE : out std_logic;
        XCVR_INIT_DONE             : out std_logic
        );
end component;


	signal FABRIC_POR_N               : std_logic;
	signal BANK_0_VDDI_STATUS         : std_logic;
	signal BANK_1_VDDI_STATUS         : std_logic;
	signal BANK_2_VDDI_STATUS         : std_logic;
	signal BANK_4_VDDI_STATUS         : std_logic;
	signal BANK_5_VDDI_STATUS         : std_logic;
	signal BANK_6_VDDI_STATUS         : std_logic;
	signal BANK_7_VDDI_STATUS         : std_logic;
	signal DEVICE_INIT_DONE           : std_logic;

    
begin

CORERESET_PF_C0_0 : CORERESET_PF_C0
    port map( 
        -- Inputs
        CLK                => SYS_CLK,
        EXT_RST_N          => Reset_IN ,
        BANK_x_VDDI_STATUS => BANK_0_VDDI_STATUS,
        BANK_y_VDDI_STATUS => BANK_6_VDDI_STATUS, 
        PLL_LOCK           => '1',
        SS_BUSY            => '0',
        INIT_DONE          =>  DEVICE_INIT_DONE, 
        FF_US_RESTORE      => '0',
        FPGA_POR_N         => FABRIC_POR_N,
        -- Outputs
        PLL_POWERDOWN_B    => open,
        FABRIC_RESET_N     => Reset_OUT 
        );
        
        
-- PF_INIT_MONITOR_C0_0
PF_INIT_MONITOR_C0_0 : PF_INIT_MONITOR_C0
    port map( 
        -- Outputs
        FABRIC_POR_N               => FABRIC_POR_N,
        PCIE_INIT_DONE             => OPEN,
        USRAM_INIT_DONE            => OPEN,
        SRAM_INIT_DONE             => OPEN,
        DEVICE_INIT_DONE           => DEVICE_INIT_DONE, 
        BANK_0_VDDI_STATUS         => BANK_0_VDDI_STATUS,
        BANK_1_VDDI_STATUS         => BANK_1_VDDI_STATUS,
        BANK_2_VDDI_STATUS         => BANK_2_VDDI_STATUS, 
        BANK_4_VDDI_STATUS         => BANK_4_VDDI_STATUS, 
        BANK_5_VDDI_STATUS         => BANK_5_VDDI_STATUS, 
        BANK_6_VDDI_STATUS         => BANK_6_VDDI_STATUS, 
        BANK_7_VDDI_STATUS         => BANK_7_VDDI_STATUS, 
        XCVR_INIT_DONE             => OPEN,
        USRAM_INIT_FROM_SNVM_DONE  => OPEN,
        USRAM_INIT_FROM_UPROM_DONE => OPEN,
        USRAM_INIT_FROM_SPI_DONE   => OPEN,
        SRAM_INIT_FROM_SNVM_DONE   => OPEN,
        SRAM_INIT_FROM_UPROM_DONE  => OPEN,
        SRAM_INIT_FROM_SPI_DONE    => OPEN,
        AUTOCALIB_DONE             => OPEN 
        );

end architecture_PF_RESET;
