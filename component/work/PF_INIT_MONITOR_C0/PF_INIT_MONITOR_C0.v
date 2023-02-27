//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Jan 12 16:46:07 2023
// Version: 2022.2 2022.2.0.10
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of PF_INIT_MONITOR_C0 to TCL
# Family: PolarFire
# Part Number: MPF300T-1FCG1152E
# Create and Configure the core component PF_INIT_MONITOR_C0
create_and_configure_core -core_vlnv {Actel:SgCore:PF_INIT_MONITOR:2.0.304} -component_name {PF_INIT_MONITOR_C0} -params {\
"BANK_0_CALIB_STATUS_ENABLED:false"  \
"BANK_0_CALIB_STATUS_SIMULATION_DELAY:1"  \
"BANK_0_RECALIBRATION_ENABLED:false"  \
"BANK_0_VDDI_STATUS_ENABLED:true"  \
"BANK_0_VDDI_STATUS_SIMULATION_DELAY:1"  \
"BANK_1_CALIB_STATUS_ENABLED:false"  \
"BANK_1_CALIB_STATUS_SIMULATION_DELAY:1"  \
"BANK_1_RECALIBRATION_ENABLED:false"  \
"BANK_1_VDDI_STATUS_ENABLED:true"  \
"BANK_1_VDDI_STATUS_SIMULATION_DELAY:1"  \
"BANK_2_CALIB_STATUS_ENABLED:false"  \
"BANK_2_CALIB_STATUS_SIMULATION_DELAY:1"  \
"BANK_2_RECALIBRATION_ENABLED:false"  \
"BANK_2_VDDI_STATUS_ENABLED:true"  \
"BANK_2_VDDI_STATUS_SIMULATION_DELAY:1"  \
"BANK_4_CALIB_STATUS_ENABLED:false"  \
"BANK_4_CALIB_STATUS_SIMULATION_DELAY:1"  \
"BANK_4_RECALIBRATION_ENABLED:false"  \
"BANK_4_VDDI_STATUS_ENABLED:true"  \
"BANK_4_VDDI_STATUS_SIMULATION_DELAY:1"  \
"BANK_5_CALIB_STATUS_ENABLED:false"  \
"BANK_5_CALIB_STATUS_SIMULATION_DELAY:1"  \
"BANK_5_RECALIBRATION_ENABLED:false"  \
"BANK_5_VDDI_STATUS_ENABLED:true"  \
"BANK_5_VDDI_STATUS_SIMULATION_DELAY:1"  \
"BANK_6_CALIB_STATUS_ENABLED:false"  \
"BANK_6_CALIB_STATUS_SIMULATION_DELAY:1"  \
"BANK_6_RECALIBRATION_ENABLED:false"  \
"BANK_6_VDDI_STATUS_ENABLED:true"  \
"BANK_6_VDDI_STATUS_SIMULATION_DELAY:1"  \
"BANK_7_CALIB_STATUS_ENABLED:false"  \
"BANK_7_CALIB_STATUS_SIMULATION_DELAY:1"  \
"BANK_7_RECALIBRATION_ENABLED:false"  \
"BANK_7_VDDI_STATUS_ENABLED:true"  \
"BANK_7_VDDI_STATUS_SIMULATION_DELAY:1"  \
"DEVICE_INIT_DONE_SIMULATION_DELAY:7"  \
"FABRIC_POR_N_SIMULATION_DELAY:1"  \
"LATCH_SC_OUTPUTS:false"  \
"PCIE_INIT_DONE_SIMULATION_DELAY:4"  \
"SHOW_BANK_0_CALIB_STATUS_ENABLED:true"  \
"SHOW_BANK_0_RECALIBRATION_ENABLED:true"  \
"SHOW_BANK_0_VDDI_STATUS_ENABLED:true"  \
"SHOW_BANK_1_CALIB_STATUS_ENABLED:true"  \
"SHOW_BANK_1_RECALIBRATION_ENABLED:true"  \
"SHOW_BANK_1_VDDI_STATUS_ENABLED:true"  \
"SHOW_BANK_2_CALIB_STATUS_ENABLED:true"  \
"SHOW_BANK_2_RECALIBRATION_ENABLED:true"  \
"SHOW_BANK_2_VDDI_STATUS_ENABLED:true"  \
"SHOW_BANK_4_CALIB_STATUS_ENABLED:true"  \
"SHOW_BANK_4_RECALIBRATION_ENABLED:true"  \
"SHOW_BANK_4_VDDI_STATUS_ENABLED:true"  \
"SHOW_BANK_5_CALIB_STATUS_ENABLED:true"  \
"SHOW_BANK_5_RECALIBRATION_ENABLED:true"  \
"SHOW_BANK_5_VDDI_STATUS_ENABLED:true"  \
"SHOW_BANK_6_CALIB_STATUS_ENABLED:true"  \
"SHOW_BANK_6_RECALIBRATION_ENABLED:true"  \
"SHOW_BANK_6_VDDI_STATUS_ENABLED:true"  \
"SHOW_BANK_7_CALIB_STATUS_ENABLED:true"  \
"SHOW_BANK_7_RECALIBRATION_ENABLED:true"  \
"SHOW_BANK_7_VDDI_STATUS_ENABLED:true"  \
"SRAM_INIT_DONE_SIMULATION_DELAY:6"  \
"USRAM_INIT_DONE_SIMULATION_DELAY:5"   }
# Exporting Component Description of PF_INIT_MONITOR_C0 to TCL done
*/

// PF_INIT_MONITOR_C0
module PF_INIT_MONITOR_C0(
    // Outputs
    AUTOCALIB_DONE,
    BANK_0_VDDI_STATUS,
    BANK_1_VDDI_STATUS,
    BANK_2_VDDI_STATUS,
    BANK_4_VDDI_STATUS,
    BANK_5_VDDI_STATUS,
    BANK_6_VDDI_STATUS,
    BANK_7_VDDI_STATUS,
    DEVICE_INIT_DONE,
    FABRIC_POR_N,
    PCIE_INIT_DONE,
    SRAM_INIT_DONE,
    SRAM_INIT_FROM_SNVM_DONE,
    SRAM_INIT_FROM_SPI_DONE,
    SRAM_INIT_FROM_UPROM_DONE,
    USRAM_INIT_DONE,
    USRAM_INIT_FROM_SNVM_DONE,
    USRAM_INIT_FROM_SPI_DONE,
    USRAM_INIT_FROM_UPROM_DONE,
    XCVR_INIT_DONE
);

//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output AUTOCALIB_DONE;
output BANK_0_VDDI_STATUS;
output BANK_1_VDDI_STATUS;
output BANK_2_VDDI_STATUS;
output BANK_4_VDDI_STATUS;
output BANK_5_VDDI_STATUS;
output BANK_6_VDDI_STATUS;
output BANK_7_VDDI_STATUS;
output DEVICE_INIT_DONE;
output FABRIC_POR_N;
output PCIE_INIT_DONE;
output SRAM_INIT_DONE;
output SRAM_INIT_FROM_SNVM_DONE;
output SRAM_INIT_FROM_SPI_DONE;
output SRAM_INIT_FROM_UPROM_DONE;
output USRAM_INIT_DONE;
output USRAM_INIT_FROM_SNVM_DONE;
output USRAM_INIT_FROM_SPI_DONE;
output USRAM_INIT_FROM_UPROM_DONE;
output XCVR_INIT_DONE;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   AUTOCALIB_DONE_net_0;
wire   BANK_0_VDDI_STATUS_net_0;
wire   BANK_1_VDDI_STATUS_net_0;
wire   BANK_2_VDDI_STATUS_net_0;
wire   BANK_4_VDDI_STATUS_net_0;
wire   BANK_5_VDDI_STATUS_net_0;
wire   BANK_6_VDDI_STATUS_net_0;
wire   BANK_7_VDDI_STATUS_net_0;
wire   DEVICE_INIT_DONE_net_0;
wire   FABRIC_POR_N_net_0;
wire   PCIE_INIT_DONE_net_0;
wire   SRAM_INIT_DONE_net_0;
wire   SRAM_INIT_FROM_SNVM_DONE_net_0;
wire   SRAM_INIT_FROM_SPI_DONE_net_0;
wire   SRAM_INIT_FROM_UPROM_DONE_net_0;
wire   USRAM_INIT_DONE_net_0;
wire   USRAM_INIT_FROM_SNVM_DONE_net_0;
wire   USRAM_INIT_FROM_SPI_DONE_net_0;
wire   USRAM_INIT_FROM_UPROM_DONE_net_0;
wire   XCVR_INIT_DONE_net_0;
wire   FABRIC_POR_N_net_1;
wire   PCIE_INIT_DONE_net_1;
wire   USRAM_INIT_DONE_net_1;
wire   SRAM_INIT_DONE_net_1;
wire   DEVICE_INIT_DONE_net_1;
wire   BANK_0_VDDI_STATUS_net_1;
wire   BANK_1_VDDI_STATUS_net_1;
wire   BANK_2_VDDI_STATUS_net_1;
wire   BANK_4_VDDI_STATUS_net_1;
wire   BANK_5_VDDI_STATUS_net_1;
wire   BANK_6_VDDI_STATUS_net_1;
wire   BANK_7_VDDI_STATUS_net_1;
wire   XCVR_INIT_DONE_net_1;
wire   USRAM_INIT_FROM_SNVM_DONE_net_1;
wire   USRAM_INIT_FROM_UPROM_DONE_net_1;
wire   USRAM_INIT_FROM_SPI_DONE_net_1;
wire   SRAM_INIT_FROM_SNVM_DONE_net_1;
wire   SRAM_INIT_FROM_UPROM_DONE_net_1;
wire   SRAM_INIT_FROM_SPI_DONE_net_1;
wire   AUTOCALIB_DONE_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   GND_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign FABRIC_POR_N_net_1               = FABRIC_POR_N_net_0;
assign FABRIC_POR_N                     = FABRIC_POR_N_net_1;
assign PCIE_INIT_DONE_net_1             = PCIE_INIT_DONE_net_0;
assign PCIE_INIT_DONE                   = PCIE_INIT_DONE_net_1;
assign USRAM_INIT_DONE_net_1            = USRAM_INIT_DONE_net_0;
assign USRAM_INIT_DONE                  = USRAM_INIT_DONE_net_1;
assign SRAM_INIT_DONE_net_1             = SRAM_INIT_DONE_net_0;
assign SRAM_INIT_DONE                   = SRAM_INIT_DONE_net_1;
assign DEVICE_INIT_DONE_net_1           = DEVICE_INIT_DONE_net_0;
assign DEVICE_INIT_DONE                 = DEVICE_INIT_DONE_net_1;
assign BANK_0_VDDI_STATUS_net_1         = BANK_0_VDDI_STATUS_net_0;
assign BANK_0_VDDI_STATUS               = BANK_0_VDDI_STATUS_net_1;
assign BANK_1_VDDI_STATUS_net_1         = BANK_1_VDDI_STATUS_net_0;
assign BANK_1_VDDI_STATUS               = BANK_1_VDDI_STATUS_net_1;
assign BANK_2_VDDI_STATUS_net_1         = BANK_2_VDDI_STATUS_net_0;
assign BANK_2_VDDI_STATUS               = BANK_2_VDDI_STATUS_net_1;
assign BANK_4_VDDI_STATUS_net_1         = BANK_4_VDDI_STATUS_net_0;
assign BANK_4_VDDI_STATUS               = BANK_4_VDDI_STATUS_net_1;
assign BANK_5_VDDI_STATUS_net_1         = BANK_5_VDDI_STATUS_net_0;
assign BANK_5_VDDI_STATUS               = BANK_5_VDDI_STATUS_net_1;
assign BANK_6_VDDI_STATUS_net_1         = BANK_6_VDDI_STATUS_net_0;
assign BANK_6_VDDI_STATUS               = BANK_6_VDDI_STATUS_net_1;
assign BANK_7_VDDI_STATUS_net_1         = BANK_7_VDDI_STATUS_net_0;
assign BANK_7_VDDI_STATUS               = BANK_7_VDDI_STATUS_net_1;
assign XCVR_INIT_DONE_net_1             = XCVR_INIT_DONE_net_0;
assign XCVR_INIT_DONE                   = XCVR_INIT_DONE_net_1;
assign USRAM_INIT_FROM_SNVM_DONE_net_1  = USRAM_INIT_FROM_SNVM_DONE_net_0;
assign USRAM_INIT_FROM_SNVM_DONE        = USRAM_INIT_FROM_SNVM_DONE_net_1;
assign USRAM_INIT_FROM_UPROM_DONE_net_1 = USRAM_INIT_FROM_UPROM_DONE_net_0;
assign USRAM_INIT_FROM_UPROM_DONE       = USRAM_INIT_FROM_UPROM_DONE_net_1;
assign USRAM_INIT_FROM_SPI_DONE_net_1   = USRAM_INIT_FROM_SPI_DONE_net_0;
assign USRAM_INIT_FROM_SPI_DONE         = USRAM_INIT_FROM_SPI_DONE_net_1;
assign SRAM_INIT_FROM_SNVM_DONE_net_1   = SRAM_INIT_FROM_SNVM_DONE_net_0;
assign SRAM_INIT_FROM_SNVM_DONE         = SRAM_INIT_FROM_SNVM_DONE_net_1;
assign SRAM_INIT_FROM_UPROM_DONE_net_1  = SRAM_INIT_FROM_UPROM_DONE_net_0;
assign SRAM_INIT_FROM_UPROM_DONE        = SRAM_INIT_FROM_UPROM_DONE_net_1;
assign SRAM_INIT_FROM_SPI_DONE_net_1    = SRAM_INIT_FROM_SPI_DONE_net_0;
assign SRAM_INIT_FROM_SPI_DONE          = SRAM_INIT_FROM_SPI_DONE_net_1;
assign AUTOCALIB_DONE_net_1             = AUTOCALIB_DONE_net_0;
assign AUTOCALIB_DONE                   = AUTOCALIB_DONE_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------PF_INIT_MONITOR_C0_PF_INIT_MONITOR_C0_0_PF_INIT_MONITOR   -   Actel:SgCore:PF_INIT_MONITOR:2.0.304
PF_INIT_MONITOR_C0_PF_INIT_MONITOR_C0_0_PF_INIT_MONITOR PF_INIT_MONITOR_C0_0(
        // Outputs
        .FABRIC_POR_N               ( FABRIC_POR_N_net_0 ),
        .PCIE_INIT_DONE             ( PCIE_INIT_DONE_net_0 ),
        .USRAM_INIT_DONE            ( USRAM_INIT_DONE_net_0 ),
        .SRAM_INIT_DONE             ( SRAM_INIT_DONE_net_0 ),
        .DEVICE_INIT_DONE           ( DEVICE_INIT_DONE_net_0 ),
        .BANK_0_VDDI_STATUS         ( BANK_0_VDDI_STATUS_net_0 ),
        .BANK_1_VDDI_STATUS         ( BANK_1_VDDI_STATUS_net_0 ),
        .BANK_2_VDDI_STATUS         ( BANK_2_VDDI_STATUS_net_0 ),
        .BANK_4_VDDI_STATUS         ( BANK_4_VDDI_STATUS_net_0 ),
        .BANK_5_VDDI_STATUS         ( BANK_5_VDDI_STATUS_net_0 ),
        .BANK_6_VDDI_STATUS         ( BANK_6_VDDI_STATUS_net_0 ),
        .BANK_7_VDDI_STATUS         ( BANK_7_VDDI_STATUS_net_0 ),
        .XCVR_INIT_DONE             ( XCVR_INIT_DONE_net_0 ),
        .USRAM_INIT_FROM_SNVM_DONE  ( USRAM_INIT_FROM_SNVM_DONE_net_0 ),
        .USRAM_INIT_FROM_UPROM_DONE ( USRAM_INIT_FROM_UPROM_DONE_net_0 ),
        .USRAM_INIT_FROM_SPI_DONE   ( USRAM_INIT_FROM_SPI_DONE_net_0 ),
        .SRAM_INIT_FROM_SNVM_DONE   ( SRAM_INIT_FROM_SNVM_DONE_net_0 ),
        .SRAM_INIT_FROM_UPROM_DONE  ( SRAM_INIT_FROM_UPROM_DONE_net_0 ),
        .SRAM_INIT_FROM_SPI_DONE    ( SRAM_INIT_FROM_SPI_DONE_net_0 ),
        .AUTOCALIB_DONE             ( AUTOCALIB_DONE_net_0 ) 
        );


endmodule
