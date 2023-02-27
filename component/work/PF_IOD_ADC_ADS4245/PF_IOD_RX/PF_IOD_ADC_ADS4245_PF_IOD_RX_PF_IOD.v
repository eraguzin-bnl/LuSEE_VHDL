`timescale 1 ns/100 ps
// Version: 2022.3 2022.3.0.8


module PF_IOD_ADC_ADS4245_PF_IOD_RX_PF_IOD(
       EYE_MONITOR_LANE_WIDTH,
       EYE_MONITOR_CLEAR_FLAGS_0,
       EYE_MONITOR_CLEAR_FLAGS_1,
       EYE_MONITOR_CLEAR_FLAGS_2,
       EYE_MONITOR_CLEAR_FLAGS_3,
       EYE_MONITOR_CLEAR_FLAGS_4,
       EYE_MONITOR_CLEAR_FLAGS_5,
       EYE_MONITOR_CLEAR_FLAGS_6,
       EYE_MONITOR_CLEAR_FLAGS_7,
       EYE_MONITOR_CLEAR_FLAGS_8,
       EYE_MONITOR_CLEAR_FLAGS_9,
       EYE_MONITOR_CLEAR_FLAGS_10,
       EYE_MONITOR_CLEAR_FLAGS_11,
       EYE_MONITOR_CLEAR_FLAGS_12,
       EYE_MONITOR_CLEAR_FLAGS_13,
       FAB_CLK,
       EYE_MONITOR_EARLY_0,
       EYE_MONITOR_EARLY_1,
       EYE_MONITOR_EARLY_2,
       EYE_MONITOR_EARLY_3,
       EYE_MONITOR_EARLY_4,
       EYE_MONITOR_EARLY_5,
       EYE_MONITOR_EARLY_6,
       EYE_MONITOR_EARLY_7,
       EYE_MONITOR_EARLY_8,
       EYE_MONITOR_EARLY_9,
       EYE_MONITOR_EARLY_10,
       EYE_MONITOR_EARLY_11,
       EYE_MONITOR_EARLY_12,
       EYE_MONITOR_EARLY_13,
       EYE_MONITOR_LATE_0,
       EYE_MONITOR_LATE_1,
       EYE_MONITOR_LATE_2,
       EYE_MONITOR_LATE_3,
       EYE_MONITOR_LATE_4,
       EYE_MONITOR_LATE_5,
       EYE_MONITOR_LATE_6,
       EYE_MONITOR_LATE_7,
       EYE_MONITOR_LATE_8,
       EYE_MONITOR_LATE_9,
       EYE_MONITOR_LATE_10,
       EYE_MONITOR_LATE_11,
       EYE_MONITOR_LATE_12,
       EYE_MONITOR_LATE_13,
       RX_DATA_0,
       RX_DATA_1,
       RX_DATA_2,
       RX_DATA_3,
       RX_DATA_4,
       RX_DATA_5,
       RX_DATA_6,
       RX_DATA_7,
       RX_DATA_8,
       RX_DATA_9,
       RX_DATA_10,
       RX_DATA_11,
       RX_DATA_12,
       RX_DATA_13,
       PAD_I,
       PAD_I_N
    );
input  [2:0] EYE_MONITOR_LANE_WIDTH;
input  EYE_MONITOR_CLEAR_FLAGS_0;
input  EYE_MONITOR_CLEAR_FLAGS_1;
input  EYE_MONITOR_CLEAR_FLAGS_2;
input  EYE_MONITOR_CLEAR_FLAGS_3;
input  EYE_MONITOR_CLEAR_FLAGS_4;
input  EYE_MONITOR_CLEAR_FLAGS_5;
input  EYE_MONITOR_CLEAR_FLAGS_6;
input  EYE_MONITOR_CLEAR_FLAGS_7;
input  EYE_MONITOR_CLEAR_FLAGS_8;
input  EYE_MONITOR_CLEAR_FLAGS_9;
input  EYE_MONITOR_CLEAR_FLAGS_10;
input  EYE_MONITOR_CLEAR_FLAGS_11;
input  EYE_MONITOR_CLEAR_FLAGS_12;
input  EYE_MONITOR_CLEAR_FLAGS_13;
input  FAB_CLK;
output EYE_MONITOR_EARLY_0;
output EYE_MONITOR_EARLY_1;
output EYE_MONITOR_EARLY_2;
output EYE_MONITOR_EARLY_3;
output EYE_MONITOR_EARLY_4;
output EYE_MONITOR_EARLY_5;
output EYE_MONITOR_EARLY_6;
output EYE_MONITOR_EARLY_7;
output EYE_MONITOR_EARLY_8;
output EYE_MONITOR_EARLY_9;
output EYE_MONITOR_EARLY_10;
output EYE_MONITOR_EARLY_11;
output EYE_MONITOR_EARLY_12;
output EYE_MONITOR_EARLY_13;
output EYE_MONITOR_LATE_0;
output EYE_MONITOR_LATE_1;
output EYE_MONITOR_LATE_2;
output EYE_MONITOR_LATE_3;
output EYE_MONITOR_LATE_4;
output EYE_MONITOR_LATE_5;
output EYE_MONITOR_LATE_6;
output EYE_MONITOR_LATE_7;
output EYE_MONITOR_LATE_8;
output EYE_MONITOR_LATE_9;
output EYE_MONITOR_LATE_10;
output EYE_MONITOR_LATE_11;
output EYE_MONITOR_LATE_12;
output EYE_MONITOR_LATE_13;
output [1:0] RX_DATA_0;
output [1:0] RX_DATA_1;
output [1:0] RX_DATA_2;
output [1:0] RX_DATA_3;
output [1:0] RX_DATA_4;
output [1:0] RX_DATA_5;
output [1:0] RX_DATA_6;
output [1:0] RX_DATA_7;
output [1:0] RX_DATA_8;
output [1:0] RX_DATA_9;
output [1:0] RX_DATA_10;
output [1:0] RX_DATA_11;
output [1:0] RX_DATA_12;
output [1:0] RX_DATA_13;
input  [13:0] PAD_I;
input  [13:0] PAD_I_N;

    wire GND_net, VCC_net, Y_I_INBUF_DIFF_0_net, Y_I_INBUF_DIFF_1_net, 
        Y_I_INBUF_DIFF_2_net, Y_I_INBUF_DIFF_3_net, 
        Y_I_INBUF_DIFF_4_net, Y_I_INBUF_DIFF_5_net, 
        Y_I_INBUF_DIFF_6_net, Y_I_INBUF_DIFF_7_net, 
        Y_I_INBUF_DIFF_8_net, Y_I_INBUF_DIFF_9_net, 
        Y_I_INBUF_DIFF_10_net, Y_I_INBUF_DIFF_11_net, 
        Y_I_INBUF_DIFF_12_net, Y_I_INBUF_DIFF_13_net;
    
    IOD #( .DATA_RATE(200.0), .FORMAL_NAME("RXD%STATIC_DELAY"), .INTERFACE_NAME("RX_DDR_G_C")
        , .DELAY_LINE_SIMULATION_MODE("DISABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b1)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b0), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b01)
        , .RX_MODE(4'b0001), .EYE_MONITOR_MODE(1'b0), .DYN_DELAY_LINE_EN(1'b0)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b1), .TX_MODE(7'b0000000)
        , .TX_CLK_SEL(2'b00), .TX_OE_MODE(3'b111), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b1), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b1), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_12 (
        .EYE_MONITOR_EARLY(EYE_MONITOR_EARLY_12), .EYE_MONITOR_LATE(
        EYE_MONITOR_LATE_12), .RX_DATA({RX_DATA_12[1], RX_DATA_12[0], 
        nc0, nc1, nc2, nc3, nc4, nc5, nc6, nc7}), 
        .DELAY_LINE_OUT_OF_RANGE(), .TX_DATA({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net}), 
        .OE_DATA({GND_net, GND_net, GND_net, GND_net}), .RX_BIT_SLIP(
        GND_net), .EYE_MONITOR_CLEAR_FLAGS(EYE_MONITOR_CLEAR_FLAGS_12), 
        .DELAY_LINE_MOVE(GND_net), .DELAY_LINE_DIRECTION(GND_net), 
        .DELAY_LINE_LOAD(GND_net), .RX_CLK(FAB_CLK), .TX_CLK(GND_net), 
        .ODT_EN(GND_net), .INFF_SL(GND_net), .INFF_EN(GND_net), 
        .OUTFF_SL(GND_net), .OUTFF_EN(GND_net), .AL_N(GND_net), 
        .OEFF_LAT_N(GND_net), .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), 
        .INFF_LAT_N(GND_net), .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), 
        .OUTFF_LAT_N(GND_net), .OUTFF_SD_N(GND_net), .OUTFF_AD_N(
        GND_net), .RX_P(Y_I_INBUF_DIFF_12_net), .RX_N(), .TX_DATA_9(
        GND_net), .TX_DATA_8(GND_net), .ARST_N(VCC_net), .RX_SYNC_RST(
        VCC_net), .TX_SYNC_RST(VCC_net), .HS_IO_CLK({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net}), .RX_DQS_90({GND_net, 
        GND_net}), .TX_DQS(GND_net), .TX_DQS_270(GND_net), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(), .OE(), .CDR_CLK(GND_net), 
        .CDR_NEXT_CLK(GND_net), .EYE_MONITOR_LANE_WIDTH({
        EYE_MONITOR_LANE_WIDTH[2], EYE_MONITOR_LANE_WIDTH[1], 
        EYE_MONITOR_LANE_WIDTH[0]}), .DDR_DO_READ(), .CDR_CLK_A_SEL_8()
        , .CDR_CLK_A_SEL_9(), .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({nc8, 
        nc9, nc10, nc11, nc12, nc13, nc14, nc15, nc16, nc17, nc18}), 
        .SWITCH(), .CDR_CLR_NEXT_CLK_N(), .TX_DATA_OUT_9(), 
        .TX_DATA_OUT_8(), .AL_N_OUT(), .OUTFF_SL_OUT(), .OUTFF_EN_OUT()
        , .INFF_SL_OUT(), .INFF_EN_OUT(), .RX_CLK_OUT(), .TX_CLK_OUT());
    INBUF_DIFF I_INBUF_DIFF_13 (.PADP(PAD_I[13]), .PADN(PAD_I_N[13]), 
        .Y(Y_I_INBUF_DIFF_13_net));
    IOD #( .DATA_RATE(200.0), .FORMAL_NAME("RXD%STATIC_DELAY"), .INTERFACE_NAME("RX_DDR_G_C")
        , .DELAY_LINE_SIMULATION_MODE("DISABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b1)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b0), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b01)
        , .RX_MODE(4'b0001), .EYE_MONITOR_MODE(1'b0), .DYN_DELAY_LINE_EN(1'b0)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b1), .TX_MODE(7'b0000000)
        , .TX_CLK_SEL(2'b00), .TX_OE_MODE(3'b111), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b1), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b1), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_3 (
        .EYE_MONITOR_EARLY(EYE_MONITOR_EARLY_3), .EYE_MONITOR_LATE(
        EYE_MONITOR_LATE_3), .RX_DATA({RX_DATA_3[1], RX_DATA_3[0], 
        nc19, nc20, nc21, nc22, nc23, nc24, nc25, nc26}), 
        .DELAY_LINE_OUT_OF_RANGE(), .TX_DATA({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net}), 
        .OE_DATA({GND_net, GND_net, GND_net, GND_net}), .RX_BIT_SLIP(
        GND_net), .EYE_MONITOR_CLEAR_FLAGS(EYE_MONITOR_CLEAR_FLAGS_3), 
        .DELAY_LINE_MOVE(GND_net), .DELAY_LINE_DIRECTION(GND_net), 
        .DELAY_LINE_LOAD(GND_net), .RX_CLK(FAB_CLK), .TX_CLK(GND_net), 
        .ODT_EN(GND_net), .INFF_SL(GND_net), .INFF_EN(GND_net), 
        .OUTFF_SL(GND_net), .OUTFF_EN(GND_net), .AL_N(GND_net), 
        .OEFF_LAT_N(GND_net), .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), 
        .INFF_LAT_N(GND_net), .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), 
        .OUTFF_LAT_N(GND_net), .OUTFF_SD_N(GND_net), .OUTFF_AD_N(
        GND_net), .RX_P(Y_I_INBUF_DIFF_3_net), .RX_N(), .TX_DATA_9(
        GND_net), .TX_DATA_8(GND_net), .ARST_N(VCC_net), .RX_SYNC_RST(
        VCC_net), .TX_SYNC_RST(VCC_net), .HS_IO_CLK({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net}), .RX_DQS_90({GND_net, 
        GND_net}), .TX_DQS(GND_net), .TX_DQS_270(GND_net), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(), .OE(), .CDR_CLK(GND_net), 
        .CDR_NEXT_CLK(GND_net), .EYE_MONITOR_LANE_WIDTH({
        EYE_MONITOR_LANE_WIDTH[2], EYE_MONITOR_LANE_WIDTH[1], 
        EYE_MONITOR_LANE_WIDTH[0]}), .DDR_DO_READ(), .CDR_CLK_A_SEL_8()
        , .CDR_CLK_A_SEL_9(), .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({
        nc27, nc28, nc29, nc30, nc31, nc32, nc33, nc34, nc35, nc36, 
        nc37}), .SWITCH(), .CDR_CLR_NEXT_CLK_N(), .TX_DATA_OUT_9(), 
        .TX_DATA_OUT_8(), .AL_N_OUT(), .OUTFF_SL_OUT(), .OUTFF_EN_OUT()
        , .INFF_SL_OUT(), .INFF_EN_OUT(), .RX_CLK_OUT(), .TX_CLK_OUT());
    IOD #( .DATA_RATE(200.0), .FORMAL_NAME("RXD%STATIC_DELAY"), .INTERFACE_NAME("RX_DDR_G_C")
        , .DELAY_LINE_SIMULATION_MODE("DISABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b1)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b0), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b01)
        , .RX_MODE(4'b0001), .EYE_MONITOR_MODE(1'b0), .DYN_DELAY_LINE_EN(1'b0)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b1), .TX_MODE(7'b0000000)
        , .TX_CLK_SEL(2'b00), .TX_OE_MODE(3'b111), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b1), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b1), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_11 (
        .EYE_MONITOR_EARLY(EYE_MONITOR_EARLY_11), .EYE_MONITOR_LATE(
        EYE_MONITOR_LATE_11), .RX_DATA({RX_DATA_11[1], RX_DATA_11[0], 
        nc38, nc39, nc40, nc41, nc42, nc43, nc44, nc45}), 
        .DELAY_LINE_OUT_OF_RANGE(), .TX_DATA({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net}), 
        .OE_DATA({GND_net, GND_net, GND_net, GND_net}), .RX_BIT_SLIP(
        GND_net), .EYE_MONITOR_CLEAR_FLAGS(EYE_MONITOR_CLEAR_FLAGS_11), 
        .DELAY_LINE_MOVE(GND_net), .DELAY_LINE_DIRECTION(GND_net), 
        .DELAY_LINE_LOAD(GND_net), .RX_CLK(FAB_CLK), .TX_CLK(GND_net), 
        .ODT_EN(GND_net), .INFF_SL(GND_net), .INFF_EN(GND_net), 
        .OUTFF_SL(GND_net), .OUTFF_EN(GND_net), .AL_N(GND_net), 
        .OEFF_LAT_N(GND_net), .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), 
        .INFF_LAT_N(GND_net), .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), 
        .OUTFF_LAT_N(GND_net), .OUTFF_SD_N(GND_net), .OUTFF_AD_N(
        GND_net), .RX_P(Y_I_INBUF_DIFF_11_net), .RX_N(), .TX_DATA_9(
        GND_net), .TX_DATA_8(GND_net), .ARST_N(VCC_net), .RX_SYNC_RST(
        VCC_net), .TX_SYNC_RST(VCC_net), .HS_IO_CLK({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net}), .RX_DQS_90({GND_net, 
        GND_net}), .TX_DQS(GND_net), .TX_DQS_270(GND_net), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(), .OE(), .CDR_CLK(GND_net), 
        .CDR_NEXT_CLK(GND_net), .EYE_MONITOR_LANE_WIDTH({
        EYE_MONITOR_LANE_WIDTH[2], EYE_MONITOR_LANE_WIDTH[1], 
        EYE_MONITOR_LANE_WIDTH[0]}), .DDR_DO_READ(), .CDR_CLK_A_SEL_8()
        , .CDR_CLK_A_SEL_9(), .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({
        nc46, nc47, nc48, nc49, nc50, nc51, nc52, nc53, nc54, nc55, 
        nc56}), .SWITCH(), .CDR_CLR_NEXT_CLK_N(), .TX_DATA_OUT_9(), 
        .TX_DATA_OUT_8(), .AL_N_OUT(), .OUTFF_SL_OUT(), .OUTFF_EN_OUT()
        , .INFF_SL_OUT(), .INFF_EN_OUT(), .RX_CLK_OUT(), .TX_CLK_OUT());
    IOD #( .DATA_RATE(200.0), .FORMAL_NAME("RXD%STATIC_DELAY"), .INTERFACE_NAME("RX_DDR_G_C")
        , .DELAY_LINE_SIMULATION_MODE("DISABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b1)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b0), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b01)
        , .RX_MODE(4'b0001), .EYE_MONITOR_MODE(1'b0), .DYN_DELAY_LINE_EN(1'b0)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b1), .TX_MODE(7'b0000000)
        , .TX_CLK_SEL(2'b00), .TX_OE_MODE(3'b111), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b1), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b1), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_10 (
        .EYE_MONITOR_EARLY(EYE_MONITOR_EARLY_10), .EYE_MONITOR_LATE(
        EYE_MONITOR_LATE_10), .RX_DATA({RX_DATA_10[1], RX_DATA_10[0], 
        nc57, nc58, nc59, nc60, nc61, nc62, nc63, nc64}), 
        .DELAY_LINE_OUT_OF_RANGE(), .TX_DATA({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net}), 
        .OE_DATA({GND_net, GND_net, GND_net, GND_net}), .RX_BIT_SLIP(
        GND_net), .EYE_MONITOR_CLEAR_FLAGS(EYE_MONITOR_CLEAR_FLAGS_10), 
        .DELAY_LINE_MOVE(GND_net), .DELAY_LINE_DIRECTION(GND_net), 
        .DELAY_LINE_LOAD(GND_net), .RX_CLK(FAB_CLK), .TX_CLK(GND_net), 
        .ODT_EN(GND_net), .INFF_SL(GND_net), .INFF_EN(GND_net), 
        .OUTFF_SL(GND_net), .OUTFF_EN(GND_net), .AL_N(GND_net), 
        .OEFF_LAT_N(GND_net), .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), 
        .INFF_LAT_N(GND_net), .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), 
        .OUTFF_LAT_N(GND_net), .OUTFF_SD_N(GND_net), .OUTFF_AD_N(
        GND_net), .RX_P(Y_I_INBUF_DIFF_10_net), .RX_N(), .TX_DATA_9(
        GND_net), .TX_DATA_8(GND_net), .ARST_N(VCC_net), .RX_SYNC_RST(
        VCC_net), .TX_SYNC_RST(VCC_net), .HS_IO_CLK({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net}), .RX_DQS_90({GND_net, 
        GND_net}), .TX_DQS(GND_net), .TX_DQS_270(GND_net), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(), .OE(), .CDR_CLK(GND_net), 
        .CDR_NEXT_CLK(GND_net), .EYE_MONITOR_LANE_WIDTH({
        EYE_MONITOR_LANE_WIDTH[2], EYE_MONITOR_LANE_WIDTH[1], 
        EYE_MONITOR_LANE_WIDTH[0]}), .DDR_DO_READ(), .CDR_CLK_A_SEL_8()
        , .CDR_CLK_A_SEL_9(), .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({
        nc65, nc66, nc67, nc68, nc69, nc70, nc71, nc72, nc73, nc74, 
        nc75}), .SWITCH(), .CDR_CLR_NEXT_CLK_N(), .TX_DATA_OUT_9(), 
        .TX_DATA_OUT_8(), .AL_N_OUT(), .OUTFF_SL_OUT(), .OUTFF_EN_OUT()
        , .INFF_SL_OUT(), .INFF_EN_OUT(), .RX_CLK_OUT(), .TX_CLK_OUT());
    INBUF_DIFF I_INBUF_DIFF_1 (.PADP(PAD_I[1]), .PADN(PAD_I_N[1]), .Y(
        Y_I_INBUF_DIFF_1_net));
    IOD #( .DATA_RATE(200.0), .FORMAL_NAME("RXD%STATIC_DELAY"), .INTERFACE_NAME("RX_DDR_G_C")
        , .DELAY_LINE_SIMULATION_MODE("DISABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b1)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b0), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b01)
        , .RX_MODE(4'b0001), .EYE_MONITOR_MODE(1'b0), .DYN_DELAY_LINE_EN(1'b0)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b1), .TX_MODE(7'b0000000)
        , .TX_CLK_SEL(2'b00), .TX_OE_MODE(3'b111), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b1), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b1), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_13 (
        .EYE_MONITOR_EARLY(EYE_MONITOR_EARLY_13), .EYE_MONITOR_LATE(
        EYE_MONITOR_LATE_13), .RX_DATA({RX_DATA_13[1], RX_DATA_13[0], 
        nc76, nc77, nc78, nc79, nc80, nc81, nc82, nc83}), 
        .DELAY_LINE_OUT_OF_RANGE(), .TX_DATA({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net}), 
        .OE_DATA({GND_net, GND_net, GND_net, GND_net}), .RX_BIT_SLIP(
        GND_net), .EYE_MONITOR_CLEAR_FLAGS(EYE_MONITOR_CLEAR_FLAGS_13), 
        .DELAY_LINE_MOVE(GND_net), .DELAY_LINE_DIRECTION(GND_net), 
        .DELAY_LINE_LOAD(GND_net), .RX_CLK(FAB_CLK), .TX_CLK(GND_net), 
        .ODT_EN(GND_net), .INFF_SL(GND_net), .INFF_EN(GND_net), 
        .OUTFF_SL(GND_net), .OUTFF_EN(GND_net), .AL_N(GND_net), 
        .OEFF_LAT_N(GND_net), .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), 
        .INFF_LAT_N(GND_net), .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), 
        .OUTFF_LAT_N(GND_net), .OUTFF_SD_N(GND_net), .OUTFF_AD_N(
        GND_net), .RX_P(Y_I_INBUF_DIFF_13_net), .RX_N(), .TX_DATA_9(
        GND_net), .TX_DATA_8(GND_net), .ARST_N(VCC_net), .RX_SYNC_RST(
        VCC_net), .TX_SYNC_RST(VCC_net), .HS_IO_CLK({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net}), .RX_DQS_90({GND_net, 
        GND_net}), .TX_DQS(GND_net), .TX_DQS_270(GND_net), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(), .OE(), .CDR_CLK(GND_net), 
        .CDR_NEXT_CLK(GND_net), .EYE_MONITOR_LANE_WIDTH({
        EYE_MONITOR_LANE_WIDTH[2], EYE_MONITOR_LANE_WIDTH[1], 
        EYE_MONITOR_LANE_WIDTH[0]}), .DDR_DO_READ(), .CDR_CLK_A_SEL_8()
        , .CDR_CLK_A_SEL_9(), .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({
        nc84, nc85, nc86, nc87, nc88, nc89, nc90, nc91, nc92, nc93, 
        nc94}), .SWITCH(), .CDR_CLR_NEXT_CLK_N(), .TX_DATA_OUT_9(), 
        .TX_DATA_OUT_8(), .AL_N_OUT(), .OUTFF_SL_OUT(), .OUTFF_EN_OUT()
        , .INFF_SL_OUT(), .INFF_EN_OUT(), .RX_CLK_OUT(), .TX_CLK_OUT());
    IOD #( .DATA_RATE(200.0), .FORMAL_NAME("RXD%STATIC_DELAY"), .INTERFACE_NAME("RX_DDR_G_C")
        , .DELAY_LINE_SIMULATION_MODE("DISABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b1)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b0), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b01)
        , .RX_MODE(4'b0001), .EYE_MONITOR_MODE(1'b0), .DYN_DELAY_LINE_EN(1'b0)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b1), .TX_MODE(7'b0000000)
        , .TX_CLK_SEL(2'b00), .TX_OE_MODE(3'b111), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b1), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b1), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_0 (
        .EYE_MONITOR_EARLY(EYE_MONITOR_EARLY_0), .EYE_MONITOR_LATE(
        EYE_MONITOR_LATE_0), .RX_DATA({RX_DATA_0[1], RX_DATA_0[0], 
        nc95, nc96, nc97, nc98, nc99, nc100, nc101, nc102}), 
        .DELAY_LINE_OUT_OF_RANGE(), .TX_DATA({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net}), 
        .OE_DATA({GND_net, GND_net, GND_net, GND_net}), .RX_BIT_SLIP(
        GND_net), .EYE_MONITOR_CLEAR_FLAGS(EYE_MONITOR_CLEAR_FLAGS_0), 
        .DELAY_LINE_MOVE(GND_net), .DELAY_LINE_DIRECTION(GND_net), 
        .DELAY_LINE_LOAD(GND_net), .RX_CLK(FAB_CLK), .TX_CLK(GND_net), 
        .ODT_EN(GND_net), .INFF_SL(GND_net), .INFF_EN(GND_net), 
        .OUTFF_SL(GND_net), .OUTFF_EN(GND_net), .AL_N(GND_net), 
        .OEFF_LAT_N(GND_net), .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), 
        .INFF_LAT_N(GND_net), .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), 
        .OUTFF_LAT_N(GND_net), .OUTFF_SD_N(GND_net), .OUTFF_AD_N(
        GND_net), .RX_P(Y_I_INBUF_DIFF_0_net), .RX_N(), .TX_DATA_9(
        GND_net), .TX_DATA_8(GND_net), .ARST_N(VCC_net), .RX_SYNC_RST(
        VCC_net), .TX_SYNC_RST(VCC_net), .HS_IO_CLK({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net}), .RX_DQS_90({GND_net, 
        GND_net}), .TX_DQS(GND_net), .TX_DQS_270(GND_net), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(), .OE(), .CDR_CLK(GND_net), 
        .CDR_NEXT_CLK(GND_net), .EYE_MONITOR_LANE_WIDTH({
        EYE_MONITOR_LANE_WIDTH[2], EYE_MONITOR_LANE_WIDTH[1], 
        EYE_MONITOR_LANE_WIDTH[0]}), .DDR_DO_READ(), .CDR_CLK_A_SEL_8()
        , .CDR_CLK_A_SEL_9(), .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({
        nc103, nc104, nc105, nc106, nc107, nc108, nc109, nc110, nc111, 
        nc112, nc113}), .SWITCH(), .CDR_CLR_NEXT_CLK_N(), 
        .TX_DATA_OUT_9(), .TX_DATA_OUT_8(), .AL_N_OUT(), .OUTFF_SL_OUT(
        ), .OUTFF_EN_OUT(), .INFF_SL_OUT(), .INFF_EN_OUT(), 
        .RX_CLK_OUT(), .TX_CLK_OUT());
    INBUF_DIFF I_INBUF_DIFF_7 (.PADP(PAD_I[7]), .PADN(PAD_I_N[7]), .Y(
        Y_I_INBUF_DIFF_7_net));
    VCC vcc_inst (.Y(VCC_net));
    GND gnd_inst (.Y(GND_net));
    IOD #( .DATA_RATE(200.0), .FORMAL_NAME("RXD%STATIC_DELAY"), .INTERFACE_NAME("RX_DDR_G_C")
        , .DELAY_LINE_SIMULATION_MODE("DISABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b1)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b0), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b01)
        , .RX_MODE(4'b0001), .EYE_MONITOR_MODE(1'b0), .DYN_DELAY_LINE_EN(1'b0)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b1), .TX_MODE(7'b0000000)
        , .TX_CLK_SEL(2'b00), .TX_OE_MODE(3'b111), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b1), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b1), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_8 (
        .EYE_MONITOR_EARLY(EYE_MONITOR_EARLY_8), .EYE_MONITOR_LATE(
        EYE_MONITOR_LATE_8), .RX_DATA({RX_DATA_8[1], RX_DATA_8[0], 
        nc114, nc115, nc116, nc117, nc118, nc119, nc120, nc121}), 
        .DELAY_LINE_OUT_OF_RANGE(), .TX_DATA({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net}), 
        .OE_DATA({GND_net, GND_net, GND_net, GND_net}), .RX_BIT_SLIP(
        GND_net), .EYE_MONITOR_CLEAR_FLAGS(EYE_MONITOR_CLEAR_FLAGS_8), 
        .DELAY_LINE_MOVE(GND_net), .DELAY_LINE_DIRECTION(GND_net), 
        .DELAY_LINE_LOAD(GND_net), .RX_CLK(FAB_CLK), .TX_CLK(GND_net), 
        .ODT_EN(GND_net), .INFF_SL(GND_net), .INFF_EN(GND_net), 
        .OUTFF_SL(GND_net), .OUTFF_EN(GND_net), .AL_N(GND_net), 
        .OEFF_LAT_N(GND_net), .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), 
        .INFF_LAT_N(GND_net), .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), 
        .OUTFF_LAT_N(GND_net), .OUTFF_SD_N(GND_net), .OUTFF_AD_N(
        GND_net), .RX_P(Y_I_INBUF_DIFF_8_net), .RX_N(), .TX_DATA_9(
        GND_net), .TX_DATA_8(GND_net), .ARST_N(VCC_net), .RX_SYNC_RST(
        VCC_net), .TX_SYNC_RST(VCC_net), .HS_IO_CLK({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net}), .RX_DQS_90({GND_net, 
        GND_net}), .TX_DQS(GND_net), .TX_DQS_270(GND_net), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(), .OE(), .CDR_CLK(GND_net), 
        .CDR_NEXT_CLK(GND_net), .EYE_MONITOR_LANE_WIDTH({
        EYE_MONITOR_LANE_WIDTH[2], EYE_MONITOR_LANE_WIDTH[1], 
        EYE_MONITOR_LANE_WIDTH[0]}), .DDR_DO_READ(), .CDR_CLK_A_SEL_8()
        , .CDR_CLK_A_SEL_9(), .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({
        nc122, nc123, nc124, nc125, nc126, nc127, nc128, nc129, nc130, 
        nc131, nc132}), .SWITCH(), .CDR_CLR_NEXT_CLK_N(), 
        .TX_DATA_OUT_9(), .TX_DATA_OUT_8(), .AL_N_OUT(), .OUTFF_SL_OUT(
        ), .OUTFF_EN_OUT(), .INFF_SL_OUT(), .INFF_EN_OUT(), 
        .RX_CLK_OUT(), .TX_CLK_OUT());
    IOD #( .DATA_RATE(200.0), .FORMAL_NAME("RXD%STATIC_DELAY"), .INTERFACE_NAME("RX_DDR_G_C")
        , .DELAY_LINE_SIMULATION_MODE("DISABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b1)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b0), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b01)
        , .RX_MODE(4'b0001), .EYE_MONITOR_MODE(1'b0), .DYN_DELAY_LINE_EN(1'b0)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b1), .TX_MODE(7'b0000000)
        , .TX_CLK_SEL(2'b00), .TX_OE_MODE(3'b111), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b1), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b1), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_2 (
        .EYE_MONITOR_EARLY(EYE_MONITOR_EARLY_2), .EYE_MONITOR_LATE(
        EYE_MONITOR_LATE_2), .RX_DATA({RX_DATA_2[1], RX_DATA_2[0], 
        nc133, nc134, nc135, nc136, nc137, nc138, nc139, nc140}), 
        .DELAY_LINE_OUT_OF_RANGE(), .TX_DATA({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net}), 
        .OE_DATA({GND_net, GND_net, GND_net, GND_net}), .RX_BIT_SLIP(
        GND_net), .EYE_MONITOR_CLEAR_FLAGS(EYE_MONITOR_CLEAR_FLAGS_2), 
        .DELAY_LINE_MOVE(GND_net), .DELAY_LINE_DIRECTION(GND_net), 
        .DELAY_LINE_LOAD(GND_net), .RX_CLK(FAB_CLK), .TX_CLK(GND_net), 
        .ODT_EN(GND_net), .INFF_SL(GND_net), .INFF_EN(GND_net), 
        .OUTFF_SL(GND_net), .OUTFF_EN(GND_net), .AL_N(GND_net), 
        .OEFF_LAT_N(GND_net), .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), 
        .INFF_LAT_N(GND_net), .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), 
        .OUTFF_LAT_N(GND_net), .OUTFF_SD_N(GND_net), .OUTFF_AD_N(
        GND_net), .RX_P(Y_I_INBUF_DIFF_2_net), .RX_N(), .TX_DATA_9(
        GND_net), .TX_DATA_8(GND_net), .ARST_N(VCC_net), .RX_SYNC_RST(
        VCC_net), .TX_SYNC_RST(VCC_net), .HS_IO_CLK({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net}), .RX_DQS_90({GND_net, 
        GND_net}), .TX_DQS(GND_net), .TX_DQS_270(GND_net), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(), .OE(), .CDR_CLK(GND_net), 
        .CDR_NEXT_CLK(GND_net), .EYE_MONITOR_LANE_WIDTH({
        EYE_MONITOR_LANE_WIDTH[2], EYE_MONITOR_LANE_WIDTH[1], 
        EYE_MONITOR_LANE_WIDTH[0]}), .DDR_DO_READ(), .CDR_CLK_A_SEL_8()
        , .CDR_CLK_A_SEL_9(), .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({
        nc141, nc142, nc143, nc144, nc145, nc146, nc147, nc148, nc149, 
        nc150, nc151}), .SWITCH(), .CDR_CLR_NEXT_CLK_N(), 
        .TX_DATA_OUT_9(), .TX_DATA_OUT_8(), .AL_N_OUT(), .OUTFF_SL_OUT(
        ), .OUTFF_EN_OUT(), .INFF_SL_OUT(), .INFF_EN_OUT(), 
        .RX_CLK_OUT(), .TX_CLK_OUT());
    INBUF_DIFF I_INBUF_DIFF_3 (.PADP(PAD_I[3]), .PADN(PAD_I_N[3]), .Y(
        Y_I_INBUF_DIFF_3_net));
    INBUF_DIFF I_INBUF_DIFF_12 (.PADP(PAD_I[12]), .PADN(PAD_I_N[12]), 
        .Y(Y_I_INBUF_DIFF_12_net));
    IOD #( .DATA_RATE(200.0), .FORMAL_NAME("RXD%STATIC_DELAY"), .INTERFACE_NAME("RX_DDR_G_C")
        , .DELAY_LINE_SIMULATION_MODE("DISABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b1)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b0), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b01)
        , .RX_MODE(4'b0001), .EYE_MONITOR_MODE(1'b0), .DYN_DELAY_LINE_EN(1'b0)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b1), .TX_MODE(7'b0000000)
        , .TX_CLK_SEL(2'b00), .TX_OE_MODE(3'b111), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b1), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b1), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_7 (
        .EYE_MONITOR_EARLY(EYE_MONITOR_EARLY_7), .EYE_MONITOR_LATE(
        EYE_MONITOR_LATE_7), .RX_DATA({RX_DATA_7[1], RX_DATA_7[0], 
        nc152, nc153, nc154, nc155, nc156, nc157, nc158, nc159}), 
        .DELAY_LINE_OUT_OF_RANGE(), .TX_DATA({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net}), 
        .OE_DATA({GND_net, GND_net, GND_net, GND_net}), .RX_BIT_SLIP(
        GND_net), .EYE_MONITOR_CLEAR_FLAGS(EYE_MONITOR_CLEAR_FLAGS_7), 
        .DELAY_LINE_MOVE(GND_net), .DELAY_LINE_DIRECTION(GND_net), 
        .DELAY_LINE_LOAD(GND_net), .RX_CLK(FAB_CLK), .TX_CLK(GND_net), 
        .ODT_EN(GND_net), .INFF_SL(GND_net), .INFF_EN(GND_net), 
        .OUTFF_SL(GND_net), .OUTFF_EN(GND_net), .AL_N(GND_net), 
        .OEFF_LAT_N(GND_net), .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), 
        .INFF_LAT_N(GND_net), .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), 
        .OUTFF_LAT_N(GND_net), .OUTFF_SD_N(GND_net), .OUTFF_AD_N(
        GND_net), .RX_P(Y_I_INBUF_DIFF_7_net), .RX_N(), .TX_DATA_9(
        GND_net), .TX_DATA_8(GND_net), .ARST_N(VCC_net), .RX_SYNC_RST(
        VCC_net), .TX_SYNC_RST(VCC_net), .HS_IO_CLK({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net}), .RX_DQS_90({GND_net, 
        GND_net}), .TX_DQS(GND_net), .TX_DQS_270(GND_net), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(), .OE(), .CDR_CLK(GND_net), 
        .CDR_NEXT_CLK(GND_net), .EYE_MONITOR_LANE_WIDTH({
        EYE_MONITOR_LANE_WIDTH[2], EYE_MONITOR_LANE_WIDTH[1], 
        EYE_MONITOR_LANE_WIDTH[0]}), .DDR_DO_READ(), .CDR_CLK_A_SEL_8()
        , .CDR_CLK_A_SEL_9(), .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({
        nc160, nc161, nc162, nc163, nc164, nc165, nc166, nc167, nc168, 
        nc169, nc170}), .SWITCH(), .CDR_CLR_NEXT_CLK_N(), 
        .TX_DATA_OUT_9(), .TX_DATA_OUT_8(), .AL_N_OUT(), .OUTFF_SL_OUT(
        ), .OUTFF_EN_OUT(), .INFF_SL_OUT(), .INFF_EN_OUT(), 
        .RX_CLK_OUT(), .TX_CLK_OUT());
    INBUF_DIFF I_INBUF_DIFF_10 (.PADP(PAD_I[10]), .PADN(PAD_I_N[10]), 
        .Y(Y_I_INBUF_DIFF_10_net));
    IOD #( .DATA_RATE(200.0), .FORMAL_NAME("RXD%STATIC_DELAY"), .INTERFACE_NAME("RX_DDR_G_C")
        , .DELAY_LINE_SIMULATION_MODE("DISABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b1)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b0), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b01)
        , .RX_MODE(4'b0001), .EYE_MONITOR_MODE(1'b0), .DYN_DELAY_LINE_EN(1'b0)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b1), .TX_MODE(7'b0000000)
        , .TX_CLK_SEL(2'b00), .TX_OE_MODE(3'b111), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b1), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b1), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_4 (
        .EYE_MONITOR_EARLY(EYE_MONITOR_EARLY_4), .EYE_MONITOR_LATE(
        EYE_MONITOR_LATE_4), .RX_DATA({RX_DATA_4[1], RX_DATA_4[0], 
        nc171, nc172, nc173, nc174, nc175, nc176, nc177, nc178}), 
        .DELAY_LINE_OUT_OF_RANGE(), .TX_DATA({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net}), 
        .OE_DATA({GND_net, GND_net, GND_net, GND_net}), .RX_BIT_SLIP(
        GND_net), .EYE_MONITOR_CLEAR_FLAGS(EYE_MONITOR_CLEAR_FLAGS_4), 
        .DELAY_LINE_MOVE(GND_net), .DELAY_LINE_DIRECTION(GND_net), 
        .DELAY_LINE_LOAD(GND_net), .RX_CLK(FAB_CLK), .TX_CLK(GND_net), 
        .ODT_EN(GND_net), .INFF_SL(GND_net), .INFF_EN(GND_net), 
        .OUTFF_SL(GND_net), .OUTFF_EN(GND_net), .AL_N(GND_net), 
        .OEFF_LAT_N(GND_net), .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), 
        .INFF_LAT_N(GND_net), .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), 
        .OUTFF_LAT_N(GND_net), .OUTFF_SD_N(GND_net), .OUTFF_AD_N(
        GND_net), .RX_P(Y_I_INBUF_DIFF_4_net), .RX_N(), .TX_DATA_9(
        GND_net), .TX_DATA_8(GND_net), .ARST_N(VCC_net), .RX_SYNC_RST(
        VCC_net), .TX_SYNC_RST(VCC_net), .HS_IO_CLK({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net}), .RX_DQS_90({GND_net, 
        GND_net}), .TX_DQS(GND_net), .TX_DQS_270(GND_net), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(), .OE(), .CDR_CLK(GND_net), 
        .CDR_NEXT_CLK(GND_net), .EYE_MONITOR_LANE_WIDTH({
        EYE_MONITOR_LANE_WIDTH[2], EYE_MONITOR_LANE_WIDTH[1], 
        EYE_MONITOR_LANE_WIDTH[0]}), .DDR_DO_READ(), .CDR_CLK_A_SEL_8()
        , .CDR_CLK_A_SEL_9(), .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({
        nc179, nc180, nc181, nc182, nc183, nc184, nc185, nc186, nc187, 
        nc188, nc189}), .SWITCH(), .CDR_CLR_NEXT_CLK_N(), 
        .TX_DATA_OUT_9(), .TX_DATA_OUT_8(), .AL_N_OUT(), .OUTFF_SL_OUT(
        ), .OUTFF_EN_OUT(), .INFF_SL_OUT(), .INFF_EN_OUT(), 
        .RX_CLK_OUT(), .TX_CLK_OUT());
    INBUF_DIFF I_INBUF_DIFF_5 (.PADP(PAD_I[5]), .PADN(PAD_I_N[5]), .Y(
        Y_I_INBUF_DIFF_5_net));
    IOD #( .DATA_RATE(200.0), .FORMAL_NAME("RXD%STATIC_DELAY"), .INTERFACE_NAME("RX_DDR_G_C")
        , .DELAY_LINE_SIMULATION_MODE("DISABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b1)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b0), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b01)
        , .RX_MODE(4'b0001), .EYE_MONITOR_MODE(1'b0), .DYN_DELAY_LINE_EN(1'b0)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b1), .TX_MODE(7'b0000000)
        , .TX_CLK_SEL(2'b00), .TX_OE_MODE(3'b111), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b1), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b1), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_6 (
        .EYE_MONITOR_EARLY(EYE_MONITOR_EARLY_6), .EYE_MONITOR_LATE(
        EYE_MONITOR_LATE_6), .RX_DATA({RX_DATA_6[1], RX_DATA_6[0], 
        nc190, nc191, nc192, nc193, nc194, nc195, nc196, nc197}), 
        .DELAY_LINE_OUT_OF_RANGE(), .TX_DATA({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net}), 
        .OE_DATA({GND_net, GND_net, GND_net, GND_net}), .RX_BIT_SLIP(
        GND_net), .EYE_MONITOR_CLEAR_FLAGS(EYE_MONITOR_CLEAR_FLAGS_6), 
        .DELAY_LINE_MOVE(GND_net), .DELAY_LINE_DIRECTION(GND_net), 
        .DELAY_LINE_LOAD(GND_net), .RX_CLK(FAB_CLK), .TX_CLK(GND_net), 
        .ODT_EN(GND_net), .INFF_SL(GND_net), .INFF_EN(GND_net), 
        .OUTFF_SL(GND_net), .OUTFF_EN(GND_net), .AL_N(GND_net), 
        .OEFF_LAT_N(GND_net), .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), 
        .INFF_LAT_N(GND_net), .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), 
        .OUTFF_LAT_N(GND_net), .OUTFF_SD_N(GND_net), .OUTFF_AD_N(
        GND_net), .RX_P(Y_I_INBUF_DIFF_6_net), .RX_N(), .TX_DATA_9(
        GND_net), .TX_DATA_8(GND_net), .ARST_N(VCC_net), .RX_SYNC_RST(
        VCC_net), .TX_SYNC_RST(VCC_net), .HS_IO_CLK({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net}), .RX_DQS_90({GND_net, 
        GND_net}), .TX_DQS(GND_net), .TX_DQS_270(GND_net), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(), .OE(), .CDR_CLK(GND_net), 
        .CDR_NEXT_CLK(GND_net), .EYE_MONITOR_LANE_WIDTH({
        EYE_MONITOR_LANE_WIDTH[2], EYE_MONITOR_LANE_WIDTH[1], 
        EYE_MONITOR_LANE_WIDTH[0]}), .DDR_DO_READ(), .CDR_CLK_A_SEL_8()
        , .CDR_CLK_A_SEL_9(), .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({
        nc198, nc199, nc200, nc201, nc202, nc203, nc204, nc205, nc206, 
        nc207, nc208}), .SWITCH(), .CDR_CLR_NEXT_CLK_N(), 
        .TX_DATA_OUT_9(), .TX_DATA_OUT_8(), .AL_N_OUT(), .OUTFF_SL_OUT(
        ), .OUTFF_EN_OUT(), .INFF_SL_OUT(), .INFF_EN_OUT(), 
        .RX_CLK_OUT(), .TX_CLK_OUT());
    IOD #( .DATA_RATE(200.0), .FORMAL_NAME("RXD%STATIC_DELAY"), .INTERFACE_NAME("RX_DDR_G_C")
        , .DELAY_LINE_SIMULATION_MODE("DISABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b1)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b0), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b01)
        , .RX_MODE(4'b0001), .EYE_MONITOR_MODE(1'b0), .DYN_DELAY_LINE_EN(1'b0)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b1), .TX_MODE(7'b0000000)
        , .TX_CLK_SEL(2'b00), .TX_OE_MODE(3'b111), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b1), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b1), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_1 (
        .EYE_MONITOR_EARLY(EYE_MONITOR_EARLY_1), .EYE_MONITOR_LATE(
        EYE_MONITOR_LATE_1), .RX_DATA({RX_DATA_1[1], RX_DATA_1[0], 
        nc209, nc210, nc211, nc212, nc213, nc214, nc215, nc216}), 
        .DELAY_LINE_OUT_OF_RANGE(), .TX_DATA({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net}), 
        .OE_DATA({GND_net, GND_net, GND_net, GND_net}), .RX_BIT_SLIP(
        GND_net), .EYE_MONITOR_CLEAR_FLAGS(EYE_MONITOR_CLEAR_FLAGS_1), 
        .DELAY_LINE_MOVE(GND_net), .DELAY_LINE_DIRECTION(GND_net), 
        .DELAY_LINE_LOAD(GND_net), .RX_CLK(FAB_CLK), .TX_CLK(GND_net), 
        .ODT_EN(GND_net), .INFF_SL(GND_net), .INFF_EN(GND_net), 
        .OUTFF_SL(GND_net), .OUTFF_EN(GND_net), .AL_N(GND_net), 
        .OEFF_LAT_N(GND_net), .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), 
        .INFF_LAT_N(GND_net), .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), 
        .OUTFF_LAT_N(GND_net), .OUTFF_SD_N(GND_net), .OUTFF_AD_N(
        GND_net), .RX_P(Y_I_INBUF_DIFF_1_net), .RX_N(), .TX_DATA_9(
        GND_net), .TX_DATA_8(GND_net), .ARST_N(VCC_net), .RX_SYNC_RST(
        VCC_net), .TX_SYNC_RST(VCC_net), .HS_IO_CLK({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net}), .RX_DQS_90({GND_net, 
        GND_net}), .TX_DQS(GND_net), .TX_DQS_270(GND_net), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(), .OE(), .CDR_CLK(GND_net), 
        .CDR_NEXT_CLK(GND_net), .EYE_MONITOR_LANE_WIDTH({
        EYE_MONITOR_LANE_WIDTH[2], EYE_MONITOR_LANE_WIDTH[1], 
        EYE_MONITOR_LANE_WIDTH[0]}), .DDR_DO_READ(), .CDR_CLK_A_SEL_8()
        , .CDR_CLK_A_SEL_9(), .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({
        nc217, nc218, nc219, nc220, nc221, nc222, nc223, nc224, nc225, 
        nc226, nc227}), .SWITCH(), .CDR_CLR_NEXT_CLK_N(), 
        .TX_DATA_OUT_9(), .TX_DATA_OUT_8(), .AL_N_OUT(), .OUTFF_SL_OUT(
        ), .OUTFF_EN_OUT(), .INFF_SL_OUT(), .INFF_EN_OUT(), 
        .RX_CLK_OUT(), .TX_CLK_OUT());
    IOD #( .DATA_RATE(200.0), .FORMAL_NAME("RXD%STATIC_DELAY"), .INTERFACE_NAME("RX_DDR_G_C")
        , .DELAY_LINE_SIMULATION_MODE("DISABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b1)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b0), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b01)
        , .RX_MODE(4'b0001), .EYE_MONITOR_MODE(1'b0), .DYN_DELAY_LINE_EN(1'b0)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b1), .TX_MODE(7'b0000000)
        , .TX_CLK_SEL(2'b00), .TX_OE_MODE(3'b111), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b1), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b1), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_5 (
        .EYE_MONITOR_EARLY(EYE_MONITOR_EARLY_5), .EYE_MONITOR_LATE(
        EYE_MONITOR_LATE_5), .RX_DATA({RX_DATA_5[1], RX_DATA_5[0], 
        nc228, nc229, nc230, nc231, nc232, nc233, nc234, nc235}), 
        .DELAY_LINE_OUT_OF_RANGE(), .TX_DATA({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net}), 
        .OE_DATA({GND_net, GND_net, GND_net, GND_net}), .RX_BIT_SLIP(
        GND_net), .EYE_MONITOR_CLEAR_FLAGS(EYE_MONITOR_CLEAR_FLAGS_5), 
        .DELAY_LINE_MOVE(GND_net), .DELAY_LINE_DIRECTION(GND_net), 
        .DELAY_LINE_LOAD(GND_net), .RX_CLK(FAB_CLK), .TX_CLK(GND_net), 
        .ODT_EN(GND_net), .INFF_SL(GND_net), .INFF_EN(GND_net), 
        .OUTFF_SL(GND_net), .OUTFF_EN(GND_net), .AL_N(GND_net), 
        .OEFF_LAT_N(GND_net), .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), 
        .INFF_LAT_N(GND_net), .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), 
        .OUTFF_LAT_N(GND_net), .OUTFF_SD_N(GND_net), .OUTFF_AD_N(
        GND_net), .RX_P(Y_I_INBUF_DIFF_5_net), .RX_N(), .TX_DATA_9(
        GND_net), .TX_DATA_8(GND_net), .ARST_N(VCC_net), .RX_SYNC_RST(
        VCC_net), .TX_SYNC_RST(VCC_net), .HS_IO_CLK({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net}), .RX_DQS_90({GND_net, 
        GND_net}), .TX_DQS(GND_net), .TX_DQS_270(GND_net), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(), .OE(), .CDR_CLK(GND_net), 
        .CDR_NEXT_CLK(GND_net), .EYE_MONITOR_LANE_WIDTH({
        EYE_MONITOR_LANE_WIDTH[2], EYE_MONITOR_LANE_WIDTH[1], 
        EYE_MONITOR_LANE_WIDTH[0]}), .DDR_DO_READ(), .CDR_CLK_A_SEL_8()
        , .CDR_CLK_A_SEL_9(), .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({
        nc236, nc237, nc238, nc239, nc240, nc241, nc242, nc243, nc244, 
        nc245, nc246}), .SWITCH(), .CDR_CLR_NEXT_CLK_N(), 
        .TX_DATA_OUT_9(), .TX_DATA_OUT_8(), .AL_N_OUT(), .OUTFF_SL_OUT(
        ), .OUTFF_EN_OUT(), .INFF_SL_OUT(), .INFF_EN_OUT(), 
        .RX_CLK_OUT(), .TX_CLK_OUT());
    INBUF_DIFF I_INBUF_DIFF_6 (.PADP(PAD_I[6]), .PADN(PAD_I_N[6]), .Y(
        Y_I_INBUF_DIFF_6_net));
    INBUF_DIFF I_INBUF_DIFF_0 (.PADP(PAD_I[0]), .PADN(PAD_I_N[0]), .Y(
        Y_I_INBUF_DIFF_0_net));
    INBUF_DIFF I_INBUF_DIFF_11 (.PADP(PAD_I[11]), .PADN(PAD_I_N[11]), 
        .Y(Y_I_INBUF_DIFF_11_net));
    INBUF_DIFF I_INBUF_DIFF_9 (.PADP(PAD_I[9]), .PADN(PAD_I_N[9]), .Y(
        Y_I_INBUF_DIFF_9_net));
    IOD #( .DATA_RATE(200.0), .FORMAL_NAME("RXD%STATIC_DELAY"), .INTERFACE_NAME("RX_DDR_G_C")
        , .DELAY_LINE_SIMULATION_MODE("DISABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b1)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b0), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b01)
        , .RX_MODE(4'b0001), .EYE_MONITOR_MODE(1'b0), .DYN_DELAY_LINE_EN(1'b0)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b1), .TX_MODE(7'b0000000)
        , .TX_CLK_SEL(2'b00), .TX_OE_MODE(3'b111), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b1), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b1), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_9 (
        .EYE_MONITOR_EARLY(EYE_MONITOR_EARLY_9), .EYE_MONITOR_LATE(
        EYE_MONITOR_LATE_9), .RX_DATA({RX_DATA_9[1], RX_DATA_9[0], 
        nc247, nc248, nc249, nc250, nc251, nc252, nc253, nc254}), 
        .DELAY_LINE_OUT_OF_RANGE(), .TX_DATA({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net}), 
        .OE_DATA({GND_net, GND_net, GND_net, GND_net}), .RX_BIT_SLIP(
        GND_net), .EYE_MONITOR_CLEAR_FLAGS(EYE_MONITOR_CLEAR_FLAGS_9), 
        .DELAY_LINE_MOVE(GND_net), .DELAY_LINE_DIRECTION(GND_net), 
        .DELAY_LINE_LOAD(GND_net), .RX_CLK(FAB_CLK), .TX_CLK(GND_net), 
        .ODT_EN(GND_net), .INFF_SL(GND_net), .INFF_EN(GND_net), 
        .OUTFF_SL(GND_net), .OUTFF_EN(GND_net), .AL_N(GND_net), 
        .OEFF_LAT_N(GND_net), .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), 
        .INFF_LAT_N(GND_net), .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), 
        .OUTFF_LAT_N(GND_net), .OUTFF_SD_N(GND_net), .OUTFF_AD_N(
        GND_net), .RX_P(Y_I_INBUF_DIFF_9_net), .RX_N(), .TX_DATA_9(
        GND_net), .TX_DATA_8(GND_net), .ARST_N(VCC_net), .RX_SYNC_RST(
        VCC_net), .TX_SYNC_RST(VCC_net), .HS_IO_CLK({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net}), .RX_DQS_90({GND_net, 
        GND_net}), .TX_DQS(GND_net), .TX_DQS_270(GND_net), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(), .OE(), .CDR_CLK(GND_net), 
        .CDR_NEXT_CLK(GND_net), .EYE_MONITOR_LANE_WIDTH({
        EYE_MONITOR_LANE_WIDTH[2], EYE_MONITOR_LANE_WIDTH[1], 
        EYE_MONITOR_LANE_WIDTH[0]}), .DDR_DO_READ(), .CDR_CLK_A_SEL_8()
        , .CDR_CLK_A_SEL_9(), .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({
        nc255, nc256, nc257, nc258, nc259, nc260, nc261, nc262, nc263, 
        nc264, nc265}), .SWITCH(), .CDR_CLR_NEXT_CLK_N(), 
        .TX_DATA_OUT_9(), .TX_DATA_OUT_8(), .AL_N_OUT(), .OUTFF_SL_OUT(
        ), .OUTFF_EN_OUT(), .INFF_SL_OUT(), .INFF_EN_OUT(), 
        .RX_CLK_OUT(), .TX_CLK_OUT());
    INBUF_DIFF I_INBUF_DIFF_4 (.PADP(PAD_I[4]), .PADN(PAD_I_N[4]), .Y(
        Y_I_INBUF_DIFF_4_net));
    INBUF_DIFF I_INBUF_DIFF_8 (.PADP(PAD_I[8]), .PADN(PAD_I_N[8]), .Y(
        Y_I_INBUF_DIFF_8_net));
    INBUF_DIFF I_INBUF_DIFF_2 (.PADP(PAD_I[2]), .PADN(PAD_I_N[2]), .Y(
        Y_I_INBUF_DIFF_2_net));
    
endmodule
