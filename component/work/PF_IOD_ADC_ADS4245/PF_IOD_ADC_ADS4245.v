//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Jan 19 12:58:30 2023
// Version: 2022.3 2022.3.0.8
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of PF_IOD_ADC_ADS4245 to TCL
# Family: PolarFire
# Part Number: MPF300T-1FCG1152E
# Create and Configure the core component PF_IOD_ADC_ADS4245
create_and_configure_core -core_vlnv {Actel:SystemBuilder:PF_IOD_GENERIC_RX:2.1.110} -component_name {PF_IOD_ADC_ADS4245} -params {\
"CLOCK_DELAY_VALUE:0" \
"DATA_RATE:200" \
"DATA_RATIO:2" \
"DATA_WIDTH:1" \
"DDR_MODE:DDR" \
"DELAY_LINE_SIMULATION_MODE_EN:false" \
"DYN_USE_WIDE_MODE:false" \
"EXPOSE_CLK_TRAIN_PORTS:false" \
"EXPOSE_DYNAMIC_DELAY_CTRL:false" \
"EXPOSE_EXTRA_TRAINING_PORTS:false" \
"EXPOSE_FA_CLK_DATA:false" \
"EXPOSE_RX_RAW_DATA:false" \
"FABRIC_CLK_SOURCE:GLOBAL" \
"FRACTIONAL_CLOCK_RATIO:RATIO" \
"ICB_BCLK_OFFSET:0" \
"ICB_USE_WIDE_MODE:true" \
"IO_NUMBER:14" \
"NEED_LANECTRL:false" \
"NEED_TIP:false" \
"PLL_BCLK_OFFSET:3" \
"RATIO:1" \
"RXCTL_SPLIT_WIDTH:1" \
"RXD_LVDS_FAILSAFE_EN:false" \
"RXD_SPLIT_WIDTH:14" \
"RX_BIT_SLIP_EN:false" \
"RX_CLK_DIFFERENTIAL:true" \
"RX_CLK_LVDS_FAILSAFE_EN:false" \
"RX_CLK_SOURCE:FABRIC" \
"RX_CLK_TO_DATA:CENTERED" \
"RX_DATA_BUS_MODE:RX_DATA_PER_IO" \
"RX_DATA_DIFFERENTIAL:true" \
"RX_ENABLED:true" \
"RX_INTERFACE_NAME:RX_DDR_G_C" \
"RX_IOG_ARCHETYPE:RX_DDR_GR" \
"RX_MIPI_MODE:false" \
"SIMULATION_MODE:FULL" \
"USE_SHARED_PLL:false" \
"X1_ADD_DELAY_LINE_ON_CLOCK:false" }
# Exporting Component Description of PF_IOD_ADC_ADS4245 to TCL done
*/

// PF_IOD_ADC_ADS4245
module PF_IOD_ADC_ADS4245(
    // Inputs
    RXD,
    RXD_N,
    RX_CLK_N,
    RX_CLK_P,
    // Outputs
    L0_RXD_DATA,
    L10_RXD_DATA,
    L11_RXD_DATA,
    L12_RXD_DATA,
    L13_RXD_DATA,
    L1_RXD_DATA,
    L2_RXD_DATA,
    L3_RXD_DATA,
    L4_RXD_DATA,
    L5_RXD_DATA,
    L6_RXD_DATA,
    L7_RXD_DATA,
    L8_RXD_DATA,
    L9_RXD_DATA,
    RX_CLK_G
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [13:0] RXD;
input  [13:0] RXD_N;
input         RX_CLK_N;
input         RX_CLK_P;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [1:0]  L0_RXD_DATA;
output [1:0]  L10_RXD_DATA;
output [1:0]  L11_RXD_DATA;
output [1:0]  L12_RXD_DATA;
output [1:0]  L13_RXD_DATA;
output [1:0]  L1_RXD_DATA;
output [1:0]  L2_RXD_DATA;
output [1:0]  L3_RXD_DATA;
output [1:0]  L4_RXD_DATA;
output [1:0]  L5_RXD_DATA;
output [1:0]  L6_RXD_DATA;
output [1:0]  L7_RXD_DATA;
output [1:0]  L8_RXD_DATA;
output [1:0]  L9_RXD_DATA;
output        RX_CLK_G;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          CLK_0_Y;
wire   [1:0]  L0_RXD_DATA_net_0;
wire   [1:0]  L1_RXD_DATA_net_0;
wire   [1:0]  L2_RXD_DATA_net_0;
wire   [1:0]  L3_RXD_DATA_net_0;
wire   [1:0]  L4_RXD_DATA_net_0;
wire   [1:0]  L5_RXD_DATA_net_0;
wire   [1:0]  L6_RXD_DATA_net_0;
wire   [1:0]  L7_RXD_DATA_net_0;
wire   [1:0]  L8_RXD_DATA_net_0;
wire   [1:0]  L9_RXD_DATA_net_0;
wire   [1:0]  L10_RXD_DATA_net_0;
wire   [1:0]  L11_RXD_DATA_net_0;
wire   [1:0]  L12_RXD_DATA_net_0;
wire   [1:0]  L13_RXD_DATA_net_0;
wire          RX_CLK_G_net_0;
wire          RX_CLK_N;
wire          RX_CLK_P;
wire   [13:0] RXD;
wire   [13:0] RXD_N;
wire   [1:0]  L0_RXD_DATA_net_1;
wire   [1:0]  L1_RXD_DATA_net_1;
wire   [1:0]  L2_RXD_DATA_net_1;
wire   [1:0]  L3_RXD_DATA_net_1;
wire   [1:0]  L4_RXD_DATA_net_1;
wire   [1:0]  L5_RXD_DATA_net_1;
wire   [1:0]  L6_RXD_DATA_net_1;
wire   [1:0]  L7_RXD_DATA_net_1;
wire   [1:0]  L8_RXD_DATA_net_1;
wire   [1:0]  L9_RXD_DATA_net_1;
wire   [1:0]  L10_RXD_DATA_net_1;
wire   [1:0]  L11_RXD_DATA_net_1;
wire   [1:0]  L12_RXD_DATA_net_1;
wire   [1:0]  L13_RXD_DATA_net_1;
wire          RX_CLK_G_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire          VCC_net;
wire   [1:0]  RX_DQS_90_const_net_0;
wire   [2:0]  FIFO_WR_PTR_const_net_0;
wire   [2:0]  FIFO_RD_PTR_const_net_0;
wire   [2:0]  EYE_MONITOR_LANE_WIDTH_const_net_0;
wire   [1:0]  TX_DATA_0_const_net_0;
wire   [1:0]  TX_DATA_1_const_net_0;
wire   [1:0]  TX_DATA_2_const_net_0;
wire   [1:0]  TX_DATA_3_const_net_0;
wire   [1:0]  TX_DATA_4_const_net_0;
wire   [1:0]  TX_DATA_5_const_net_0;
wire   [1:0]  TX_DATA_6_const_net_0;
wire   [1:0]  TX_DATA_7_const_net_0;
wire   [1:0]  TX_DATA_8_const_net_0;
wire   [1:0]  TX_DATA_9_const_net_0;
wire   [1:0]  TX_DATA_10_const_net_0;
wire   [1:0]  TX_DATA_11_const_net_0;
wire   [1:0]  TX_DATA_12_const_net_0;
wire   [1:0]  TX_DATA_13_const_net_0;
wire   [1:0]  TX_DATA_14_const_net_0;
wire   [1:0]  TX_DATA_15_const_net_0;
wire   [1:0]  TX_DATA_16_const_net_0;
wire   [1:0]  TX_DATA_17_const_net_0;
wire   [1:0]  TX_DATA_18_const_net_0;
wire   [1:0]  TX_DATA_19_const_net_0;
wire   [1:0]  TX_DATA_20_const_net_0;
wire   [1:0]  TX_DATA_21_const_net_0;
wire   [1:0]  TX_DATA_22_const_net_0;
wire   [1:0]  TX_DATA_23_const_net_0;
wire   [1:0]  TX_DATA_24_const_net_0;
wire   [1:0]  TX_DATA_25_const_net_0;
wire   [1:0]  TX_DATA_26_const_net_0;
wire   [1:0]  TX_DATA_27_const_net_0;
wire   [1:0]  TX_DATA_28_const_net_0;
wire   [1:0]  TX_DATA_29_const_net_0;
wire   [1:0]  TX_DATA_30_const_net_0;
wire   [1:0]  TX_DATA_31_const_net_0;
wire   [1:0]  TX_DATA_32_const_net_0;
wire   [1:0]  TX_DATA_33_const_net_0;
wire   [1:0]  TX_DATA_34_const_net_0;
wire   [1:0]  TX_DATA_35_const_net_0;
wire   [1:0]  TX_DATA_36_const_net_0;
wire   [1:0]  TX_DATA_37_const_net_0;
wire   [1:0]  TX_DATA_38_const_net_0;
wire   [1:0]  TX_DATA_39_const_net_0;
wire   [1:0]  TX_DATA_40_const_net_0;
wire   [1:0]  TX_DATA_41_const_net_0;
wire   [1:0]  TX_DATA_42_const_net_0;
wire   [1:0]  TX_DATA_43_const_net_0;
wire   [1:0]  TX_DATA_44_const_net_0;
wire   [1:0]  TX_DATA_45_const_net_0;
wire   [1:0]  TX_DATA_46_const_net_0;
wire   [1:0]  TX_DATA_47_const_net_0;
wire   [1:0]  TX_DATA_48_const_net_0;
wire   [1:0]  TX_DATA_49_const_net_0;
wire   [1:0]  TX_DATA_50_const_net_0;
wire   [1:0]  TX_DATA_51_const_net_0;
wire   [1:0]  TX_DATA_52_const_net_0;
wire   [1:0]  TX_DATA_53_const_net_0;
wire   [1:0]  TX_DATA_54_const_net_0;
wire   [1:0]  TX_DATA_55_const_net_0;
wire   [1:0]  TX_DATA_56_const_net_0;
wire   [1:0]  TX_DATA_57_const_net_0;
wire   [1:0]  TX_DATA_58_const_net_0;
wire   [1:0]  TX_DATA_59_const_net_0;
wire   [1:0]  TX_DATA_60_const_net_0;
wire   [1:0]  TX_DATA_61_const_net_0;
wire   [1:0]  TX_DATA_62_const_net_0;
wire   [1:0]  TX_DATA_63_const_net_0;
wire   [1:0]  TX_DATA_64_const_net_0;
wire   [1:0]  TX_DATA_65_const_net_0;
wire   [1:0]  TX_DATA_66_const_net_0;
wire   [1:0]  TX_DATA_67_const_net_0;
wire   [1:0]  TX_DATA_68_const_net_0;
wire   [1:0]  TX_DATA_69_const_net_0;
wire   [1:0]  TX_DATA_70_const_net_0;
wire   [1:0]  TX_DATA_71_const_net_0;
wire   [1:0]  TX_DATA_72_const_net_0;
wire   [1:0]  TX_DATA_73_const_net_0;
wire   [1:0]  TX_DATA_74_const_net_0;
wire   [1:0]  TX_DATA_75_const_net_0;
wire   [1:0]  TX_DATA_76_const_net_0;
wire   [1:0]  TX_DATA_77_const_net_0;
wire   [1:0]  TX_DATA_78_const_net_0;
wire   [1:0]  TX_DATA_79_const_net_0;
wire   [1:0]  TX_DATA_80_const_net_0;
wire   [1:0]  TX_DATA_81_const_net_0;
wire   [1:0]  TX_DATA_82_const_net_0;
wire   [1:0]  TX_DATA_83_const_net_0;
wire   [1:0]  TX_DATA_84_const_net_0;
wire   [1:0]  TX_DATA_85_const_net_0;
wire   [1:0]  TX_DATA_86_const_net_0;
wire   [1:0]  TX_DATA_87_const_net_0;
wire   [1:0]  TX_DATA_88_const_net_0;
wire   [1:0]  TX_DATA_89_const_net_0;
wire   [1:0]  TX_DATA_90_const_net_0;
wire   [1:0]  TX_DATA_91_const_net_0;
wire   [1:0]  TX_DATA_92_const_net_0;
wire   [1:0]  TX_DATA_93_const_net_0;
wire   [1:0]  TX_DATA_94_const_net_0;
wire   [1:0]  TX_DATA_95_const_net_0;
wire   [1:0]  TX_DATA_96_const_net_0;
wire   [1:0]  TX_DATA_97_const_net_0;
wire   [1:0]  TX_DATA_98_const_net_0;
wire   [1:0]  TX_DATA_99_const_net_0;
wire   [1:0]  TX_DATA_100_const_net_0;
wire   [1:0]  TX_DATA_101_const_net_0;
wire   [1:0]  TX_DATA_102_const_net_0;
wire   [1:0]  TX_DATA_103_const_net_0;
wire   [1:0]  TX_DATA_104_const_net_0;
wire   [1:0]  TX_DATA_105_const_net_0;
wire   [1:0]  TX_DATA_106_const_net_0;
wire   [1:0]  TX_DATA_107_const_net_0;
wire   [1:0]  TX_DATA_108_const_net_0;
wire   [1:0]  TX_DATA_109_const_net_0;
wire   [1:0]  TX_DATA_110_const_net_0;
wire   [1:0]  TX_DATA_111_const_net_0;
wire   [1:0]  TX_DATA_112_const_net_0;
wire   [1:0]  TX_DATA_113_const_net_0;
wire   [1:0]  TX_DATA_114_const_net_0;
wire   [1:0]  TX_DATA_115_const_net_0;
wire   [1:0]  TX_DATA_116_const_net_0;
wire   [1:0]  TX_DATA_117_const_net_0;
wire   [1:0]  TX_DATA_118_const_net_0;
wire   [1:0]  TX_DATA_119_const_net_0;
wire   [1:0]  TX_DATA_120_const_net_0;
wire   [1:0]  TX_DATA_121_const_net_0;
wire   [1:0]  TX_DATA_122_const_net_0;
wire   [1:0]  TX_DATA_123_const_net_0;
wire   [1:0]  TX_DATA_124_const_net_0;
wire   [1:0]  TX_DATA_125_const_net_0;
wire   [1:0]  TX_DATA_126_const_net_0;
wire   [1:0]  TX_DATA_127_const_net_0;
wire   [13:0] PAD_const_net_0;
wire   [13:0] PAD_N_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                            = 1'b0;
assign VCC_net                            = 1'b1;
assign RX_DQS_90_const_net_0              = 2'h0;
assign FIFO_WR_PTR_const_net_0            = 3'h0;
assign FIFO_RD_PTR_const_net_0            = 3'h0;
assign EYE_MONITOR_LANE_WIDTH_const_net_0 = 3'h0;
assign TX_DATA_0_const_net_0              = 2'h0;
assign TX_DATA_1_const_net_0              = 2'h0;
assign TX_DATA_2_const_net_0              = 2'h0;
assign TX_DATA_3_const_net_0              = 2'h0;
assign TX_DATA_4_const_net_0              = 2'h0;
assign TX_DATA_5_const_net_0              = 2'h0;
assign TX_DATA_6_const_net_0              = 2'h0;
assign TX_DATA_7_const_net_0              = 2'h0;
assign TX_DATA_8_const_net_0              = 2'h0;
assign TX_DATA_9_const_net_0              = 2'h0;
assign TX_DATA_10_const_net_0             = 2'h0;
assign TX_DATA_11_const_net_0             = 2'h0;
assign TX_DATA_12_const_net_0             = 2'h0;
assign TX_DATA_13_const_net_0             = 2'h0;
assign TX_DATA_14_const_net_0             = 2'h0;
assign TX_DATA_15_const_net_0             = 2'h0;
assign TX_DATA_16_const_net_0             = 2'h0;
assign TX_DATA_17_const_net_0             = 2'h0;
assign TX_DATA_18_const_net_0             = 2'h0;
assign TX_DATA_19_const_net_0             = 2'h0;
assign TX_DATA_20_const_net_0             = 2'h0;
assign TX_DATA_21_const_net_0             = 2'h0;
assign TX_DATA_22_const_net_0             = 2'h0;
assign TX_DATA_23_const_net_0             = 2'h0;
assign TX_DATA_24_const_net_0             = 2'h0;
assign TX_DATA_25_const_net_0             = 2'h0;
assign TX_DATA_26_const_net_0             = 2'h0;
assign TX_DATA_27_const_net_0             = 2'h0;
assign TX_DATA_28_const_net_0             = 2'h0;
assign TX_DATA_29_const_net_0             = 2'h0;
assign TX_DATA_30_const_net_0             = 2'h0;
assign TX_DATA_31_const_net_0             = 2'h0;
assign TX_DATA_32_const_net_0             = 2'h0;
assign TX_DATA_33_const_net_0             = 2'h0;
assign TX_DATA_34_const_net_0             = 2'h0;
assign TX_DATA_35_const_net_0             = 2'h0;
assign TX_DATA_36_const_net_0             = 2'h0;
assign TX_DATA_37_const_net_0             = 2'h0;
assign TX_DATA_38_const_net_0             = 2'h0;
assign TX_DATA_39_const_net_0             = 2'h0;
assign TX_DATA_40_const_net_0             = 2'h0;
assign TX_DATA_41_const_net_0             = 2'h0;
assign TX_DATA_42_const_net_0             = 2'h0;
assign TX_DATA_43_const_net_0             = 2'h0;
assign TX_DATA_44_const_net_0             = 2'h0;
assign TX_DATA_45_const_net_0             = 2'h0;
assign TX_DATA_46_const_net_0             = 2'h0;
assign TX_DATA_47_const_net_0             = 2'h0;
assign TX_DATA_48_const_net_0             = 2'h0;
assign TX_DATA_49_const_net_0             = 2'h0;
assign TX_DATA_50_const_net_0             = 2'h0;
assign TX_DATA_51_const_net_0             = 2'h0;
assign TX_DATA_52_const_net_0             = 2'h0;
assign TX_DATA_53_const_net_0             = 2'h0;
assign TX_DATA_54_const_net_0             = 2'h0;
assign TX_DATA_55_const_net_0             = 2'h0;
assign TX_DATA_56_const_net_0             = 2'h0;
assign TX_DATA_57_const_net_0             = 2'h0;
assign TX_DATA_58_const_net_0             = 2'h0;
assign TX_DATA_59_const_net_0             = 2'h0;
assign TX_DATA_60_const_net_0             = 2'h0;
assign TX_DATA_61_const_net_0             = 2'h0;
assign TX_DATA_62_const_net_0             = 2'h0;
assign TX_DATA_63_const_net_0             = 2'h0;
assign TX_DATA_64_const_net_0             = 2'h0;
assign TX_DATA_65_const_net_0             = 2'h0;
assign TX_DATA_66_const_net_0             = 2'h0;
assign TX_DATA_67_const_net_0             = 2'h0;
assign TX_DATA_68_const_net_0             = 2'h0;
assign TX_DATA_69_const_net_0             = 2'h0;
assign TX_DATA_70_const_net_0             = 2'h0;
assign TX_DATA_71_const_net_0             = 2'h0;
assign TX_DATA_72_const_net_0             = 2'h0;
assign TX_DATA_73_const_net_0             = 2'h0;
assign TX_DATA_74_const_net_0             = 2'h0;
assign TX_DATA_75_const_net_0             = 2'h0;
assign TX_DATA_76_const_net_0             = 2'h0;
assign TX_DATA_77_const_net_0             = 2'h0;
assign TX_DATA_78_const_net_0             = 2'h0;
assign TX_DATA_79_const_net_0             = 2'h0;
assign TX_DATA_80_const_net_0             = 2'h0;
assign TX_DATA_81_const_net_0             = 2'h0;
assign TX_DATA_82_const_net_0             = 2'h0;
assign TX_DATA_83_const_net_0             = 2'h0;
assign TX_DATA_84_const_net_0             = 2'h0;
assign TX_DATA_85_const_net_0             = 2'h0;
assign TX_DATA_86_const_net_0             = 2'h0;
assign TX_DATA_87_const_net_0             = 2'h0;
assign TX_DATA_88_const_net_0             = 2'h0;
assign TX_DATA_89_const_net_0             = 2'h0;
assign TX_DATA_90_const_net_0             = 2'h0;
assign TX_DATA_91_const_net_0             = 2'h0;
assign TX_DATA_92_const_net_0             = 2'h0;
assign TX_DATA_93_const_net_0             = 2'h0;
assign TX_DATA_94_const_net_0             = 2'h0;
assign TX_DATA_95_const_net_0             = 2'h0;
assign TX_DATA_96_const_net_0             = 2'h0;
assign TX_DATA_97_const_net_0             = 2'h0;
assign TX_DATA_98_const_net_0             = 2'h0;
assign TX_DATA_99_const_net_0             = 2'h0;
assign TX_DATA_100_const_net_0            = 2'h0;
assign TX_DATA_101_const_net_0            = 2'h0;
assign TX_DATA_102_const_net_0            = 2'h0;
assign TX_DATA_103_const_net_0            = 2'h0;
assign TX_DATA_104_const_net_0            = 2'h0;
assign TX_DATA_105_const_net_0            = 2'h0;
assign TX_DATA_106_const_net_0            = 2'h0;
assign TX_DATA_107_const_net_0            = 2'h0;
assign TX_DATA_108_const_net_0            = 2'h0;
assign TX_DATA_109_const_net_0            = 2'h0;
assign TX_DATA_110_const_net_0            = 2'h0;
assign TX_DATA_111_const_net_0            = 2'h0;
assign TX_DATA_112_const_net_0            = 2'h0;
assign TX_DATA_113_const_net_0            = 2'h0;
assign TX_DATA_114_const_net_0            = 2'h0;
assign TX_DATA_115_const_net_0            = 2'h0;
assign TX_DATA_116_const_net_0            = 2'h0;
assign TX_DATA_117_const_net_0            = 2'h0;
assign TX_DATA_118_const_net_0            = 2'h0;
assign TX_DATA_119_const_net_0            = 2'h0;
assign TX_DATA_120_const_net_0            = 2'h0;
assign TX_DATA_121_const_net_0            = 2'h0;
assign TX_DATA_122_const_net_0            = 2'h0;
assign TX_DATA_123_const_net_0            = 2'h0;
assign TX_DATA_124_const_net_0            = 2'h0;
assign TX_DATA_125_const_net_0            = 2'h0;
assign TX_DATA_126_const_net_0            = 2'h0;
assign TX_DATA_127_const_net_0            = 2'h0;
assign PAD_const_net_0                    = 14'h0000;
assign PAD_N_const_net_0                  = 14'h0000;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign L0_RXD_DATA_net_1  = L0_RXD_DATA_net_0;
assign L0_RXD_DATA[1:0]   = L0_RXD_DATA_net_1;
assign L1_RXD_DATA_net_1  = L1_RXD_DATA_net_0;
assign L1_RXD_DATA[1:0]   = L1_RXD_DATA_net_1;
assign L2_RXD_DATA_net_1  = L2_RXD_DATA_net_0;
assign L2_RXD_DATA[1:0]   = L2_RXD_DATA_net_1;
assign L3_RXD_DATA_net_1  = L3_RXD_DATA_net_0;
assign L3_RXD_DATA[1:0]   = L3_RXD_DATA_net_1;
assign L4_RXD_DATA_net_1  = L4_RXD_DATA_net_0;
assign L4_RXD_DATA[1:0]   = L4_RXD_DATA_net_1;
assign L5_RXD_DATA_net_1  = L5_RXD_DATA_net_0;
assign L5_RXD_DATA[1:0]   = L5_RXD_DATA_net_1;
assign L6_RXD_DATA_net_1  = L6_RXD_DATA_net_0;
assign L6_RXD_DATA[1:0]   = L6_RXD_DATA_net_1;
assign L7_RXD_DATA_net_1  = L7_RXD_DATA_net_0;
assign L7_RXD_DATA[1:0]   = L7_RXD_DATA_net_1;
assign L8_RXD_DATA_net_1  = L8_RXD_DATA_net_0;
assign L8_RXD_DATA[1:0]   = L8_RXD_DATA_net_1;
assign L9_RXD_DATA_net_1  = L9_RXD_DATA_net_0;
assign L9_RXD_DATA[1:0]   = L9_RXD_DATA_net_1;
assign L10_RXD_DATA_net_1 = L10_RXD_DATA_net_0;
assign L10_RXD_DATA[1:0]  = L10_RXD_DATA_net_1;
assign L11_RXD_DATA_net_1 = L11_RXD_DATA_net_0;
assign L11_RXD_DATA[1:0]  = L11_RXD_DATA_net_1;
assign L12_RXD_DATA_net_1 = L12_RXD_DATA_net_0;
assign L12_RXD_DATA[1:0]  = L12_RXD_DATA_net_1;
assign L13_RXD_DATA_net_1 = L13_RXD_DATA_net_0;
assign L13_RXD_DATA[1:0]  = L13_RXD_DATA_net_1;
assign RX_CLK_G_net_1     = RX_CLK_G_net_0;
assign RX_CLK_G           = RX_CLK_G_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------CLKBUF_DIFF
CLKBUF_DIFF CLK_0(
        // Inputs
        .PADP ( RX_CLK_P ),
        .PADN ( RX_CLK_N ),
        // Outputs
        .Y    ( CLK_0_Y ) 
        );

//--------CLKINT
CLKINT CLKINT_0(
        // Inputs
        .A ( CLK_0_Y ),
        // Outputs
        .Y ( RX_CLK_G_net_0 ) 
        );

//--------PF_IOD_ADC_ADS4245_PF_IOD_RX_PF_IOD   -   Actel:SgCore:PF_IOD:1.0.218
PF_IOD_ADC_ADS4245_PF_IOD_RX_PF_IOD PF_IOD_RX(
        // Inputs
        .EYE_MONITOR_LANE_WIDTH     ( EYE_MONITOR_LANE_WIDTH_const_net_0 ), // tied to 3'h0 from definition
        .EYE_MONITOR_CLEAR_FLAGS_0  ( GND_net ), // tied to 1'b0 from definition
        .EYE_MONITOR_CLEAR_FLAGS_1  ( GND_net ), // tied to 1'b0 from definition
        .EYE_MONITOR_CLEAR_FLAGS_2  ( GND_net ), // tied to 1'b0 from definition
        .EYE_MONITOR_CLEAR_FLAGS_3  ( GND_net ), // tied to 1'b0 from definition
        .EYE_MONITOR_CLEAR_FLAGS_4  ( GND_net ), // tied to 1'b0 from definition
        .EYE_MONITOR_CLEAR_FLAGS_5  ( GND_net ), // tied to 1'b0 from definition
        .EYE_MONITOR_CLEAR_FLAGS_6  ( GND_net ), // tied to 1'b0 from definition
        .EYE_MONITOR_CLEAR_FLAGS_7  ( GND_net ), // tied to 1'b0 from definition
        .EYE_MONITOR_CLEAR_FLAGS_8  ( GND_net ), // tied to 1'b0 from definition
        .EYE_MONITOR_CLEAR_FLAGS_9  ( GND_net ), // tied to 1'b0 from definition
        .EYE_MONITOR_CLEAR_FLAGS_10 ( GND_net ), // tied to 1'b0 from definition
        .EYE_MONITOR_CLEAR_FLAGS_11 ( GND_net ), // tied to 1'b0 from definition
        .EYE_MONITOR_CLEAR_FLAGS_12 ( GND_net ), // tied to 1'b0 from definition
        .EYE_MONITOR_CLEAR_FLAGS_13 ( GND_net ), // tied to 1'b0 from definition
        .FAB_CLK                    ( RX_CLK_G_net_0 ),
        .PAD_I                      ( RXD ),
        .PAD_I_N                    ( RXD_N ),
        // Outputs
        .EYE_MONITOR_EARLY_0        (  ),
        .EYE_MONITOR_EARLY_1        (  ),
        .EYE_MONITOR_EARLY_2        (  ),
        .EYE_MONITOR_EARLY_3        (  ),
        .EYE_MONITOR_EARLY_4        (  ),
        .EYE_MONITOR_EARLY_5        (  ),
        .EYE_MONITOR_EARLY_6        (  ),
        .EYE_MONITOR_EARLY_7        (  ),
        .EYE_MONITOR_EARLY_8        (  ),
        .EYE_MONITOR_EARLY_9        (  ),
        .EYE_MONITOR_EARLY_10       (  ),
        .EYE_MONITOR_EARLY_11       (  ),
        .EYE_MONITOR_EARLY_12       (  ),
        .EYE_MONITOR_EARLY_13       (  ),
        .EYE_MONITOR_LATE_0         (  ),
        .EYE_MONITOR_LATE_1         (  ),
        .EYE_MONITOR_LATE_2         (  ),
        .EYE_MONITOR_LATE_3         (  ),
        .EYE_MONITOR_LATE_4         (  ),
        .EYE_MONITOR_LATE_5         (  ),
        .EYE_MONITOR_LATE_6         (  ),
        .EYE_MONITOR_LATE_7         (  ),
        .EYE_MONITOR_LATE_8         (  ),
        .EYE_MONITOR_LATE_9         (  ),
        .EYE_MONITOR_LATE_10        (  ),
        .EYE_MONITOR_LATE_11        (  ),
        .EYE_MONITOR_LATE_12        (  ),
        .EYE_MONITOR_LATE_13        (  ),
        .RX_DATA_0                  ( L0_RXD_DATA_net_0 ),
        .RX_DATA_1                  ( L1_RXD_DATA_net_0 ),
        .RX_DATA_2                  ( L2_RXD_DATA_net_0 ),
        .RX_DATA_3                  ( L3_RXD_DATA_net_0 ),
        .RX_DATA_4                  ( L4_RXD_DATA_net_0 ),
        .RX_DATA_5                  ( L5_RXD_DATA_net_0 ),
        .RX_DATA_6                  ( L6_RXD_DATA_net_0 ),
        .RX_DATA_7                  ( L7_RXD_DATA_net_0 ),
        .RX_DATA_8                  ( L8_RXD_DATA_net_0 ),
        .RX_DATA_9                  ( L9_RXD_DATA_net_0 ),
        .RX_DATA_10                 ( L10_RXD_DATA_net_0 ),
        .RX_DATA_11                 ( L11_RXD_DATA_net_0 ),
        .RX_DATA_12                 ( L12_RXD_DATA_net_0 ),
        .RX_DATA_13                 ( L13_RXD_DATA_net_0 ) 
        );


endmodule
