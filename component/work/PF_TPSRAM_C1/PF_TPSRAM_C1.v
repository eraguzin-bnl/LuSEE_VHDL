//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu May 18 15:30:19 2023
// Version: 2022.3 2022.3.0.8
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of PF_TPSRAM_C1 to TCL
# Family: PolarFire
# Part Number: MPF300T-1FCG1152E
# Create and Configure the core component PF_TPSRAM_C1
create_and_configure_core -core_vlnv {Actel:SgCore:PF_TPSRAM:1.1.108} -component_name {PF_TPSRAM_C1} -params {\
"A_DOUT_EN_PN:R_DATA_EN"  \
"A_DOUT_EN_POLARITY:2"  \
"A_DOUT_SRST_PN:R_DATA_SRST_N"  \
"A_DOUT_SRST_POLARITY:2"  \
"A_WBYTE_EN_PN:WBYTE_EN"  \
"BUSY_FLAG:0"  \
"BYTE_ENABLE_WIDTH:0"  \
"BYTEENABLES:0"  \
"CASCADE:0"  \
"CLK_EDGE:RISE"  \
"CLKS:1"  \
"CLOCK_PN:CLK"  \
"DATA_IN_PN:W_DATA"  \
"DATA_OUT_PN:R_DATA"  \
"ECC:0"  \
"IMPORT_FILE:"  \
"INIT_RAM:F"  \
"LPM_HINT:0"  \
"LPMTYPE:LPM_RAM"  \
"PMODE2:1"  \
"PTYPE:1"  \
"RADDRESS_PN:R_ADDR"  \
"RCLK_EDGE:RISE"  \
"RCLOCK_PN:R_CLK"  \
"RDEPTH:2048"  \
"RE_PN:R_EN"  \
"RE_POLARITY:2"  \
"RESET_PN:R_DATA_ARST_N"  \
"RESET_POLARITY:2"  \
"RWIDTH:32"  \
"SII_LOCK:0"  \
"WADDRESS_PN:W_ADDR"  \
"WCLK_EDGE:RISE"  \
"WCLOCK_PN:W_CLK"  \
"WDEPTH:2048"  \
"WE_PN:W_EN"  \
"WE_POLARITY:1"  \
"WWIDTH:32"   }
# Exporting Component Description of PF_TPSRAM_C1 to TCL done
*/

// PF_TPSRAM_C1
module PF_TPSRAM_C1(
    // Inputs
    CLK,
    R_ADDR,
    W_ADDR,
    W_DATA,
    W_EN,
    // Outputs
    R_DATA
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         CLK;
input  [10:0] R_ADDR;
input  [10:0] W_ADDR;
input  [31:0] W_DATA;
input         W_EN;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [31:0] R_DATA;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          CLK;
wire   [10:0] R_ADDR;
wire   [31:0] R_DATA_net_0;
wire   [10:0] W_ADDR;
wire   [31:0] W_DATA;
wire          W_EN;
wire   [31:0] R_DATA_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net    = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign R_DATA_net_1 = R_DATA_net_0;
assign R_DATA[31:0] = R_DATA_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------PF_TPSRAM_C1_PF_TPSRAM_C1_0_PF_TPSRAM   -   Actel:SgCore:PF_TPSRAM:1.1.108
PF_TPSRAM_C1_PF_TPSRAM_C1_0_PF_TPSRAM PF_TPSRAM_C1_0(
        // Inputs
        .W_EN   ( W_EN ),
        .CLK    ( CLK ),
        .W_DATA ( W_DATA ),
        .W_ADDR ( W_ADDR ),
        .R_ADDR ( R_ADDR ),
        // Outputs
        .R_DATA ( R_DATA_net_0 ) 
        );


endmodule
