`timescale 1 ns/100 ps
// Version: 2022.3 2022.3.0.8


module PF_DPSRAM_C0_PF_DPSRAM_C0_0_PF_DPSRAM(
       A_DIN,
       A_DOUT,
       B_DIN,
       B_DOUT,
       A_ADDR,
       B_ADDR,
       CLK,
       A_WEN,
       B_WEN
    );
input  [12:0] A_DIN;
output [12:0] A_DOUT;
input  [12:0] B_DIN;
output [12:0] B_DOUT;
input  [6:0] A_ADDR;
input  [6:0] B_ADDR;
input  CLK;
input  A_WEN;
input  B_WEN;

    wire \ACCESS_BUSY[0][0] , VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("PF_DPSRAM_C0_0%69-69%13-13%SPEED%0%0%DUAL-PORT%ECC_EN-0")
         )  PF_DPSRAM_C0_PF_DPSRAM_C0_0_PF_DPSRAM_R0C0 (.A_DOUT({nc0, 
        nc1, nc2, nc3, A_DOUT[12], A_DOUT[11], A_DOUT[10], A_DOUT[9], 
        A_DOUT[8], A_DOUT[7], nc4, nc5, nc6, A_DOUT[6], A_DOUT[5], 
        A_DOUT[4], A_DOUT[3], A_DOUT[2], A_DOUT[1], A_DOUT[0]}), 
        .B_DOUT({nc7, nc8, nc9, nc10, B_DOUT[12], B_DOUT[11], 
        B_DOUT[10], B_DOUT[9], B_DOUT[8], B_DOUT[7], nc11, nc12, nc13, 
        B_DOUT[6], B_DOUT[5], B_DOUT[4], B_DOUT[3], B_DOUT[2], 
        B_DOUT[1], B_DOUT[0]}), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), .A_ADDR({GND, GND, GND, 
        A_ADDR[6], A_ADDR[5], A_ADDR[4], A_ADDR[3], A_ADDR[2], 
        A_ADDR[1], A_ADDR[0], GND, GND, GND, GND}), .A_BLK_EN({VCC, 
        VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, A_DIN[12], 
        A_DIN[11], A_DIN[10], A_DIN[9], A_DIN[8], A_DIN[7], GND, GND, 
        GND, A_DIN[6], A_DIN[5], A_DIN[4], A_DIN[3], A_DIN[2], 
        A_DIN[1], A_DIN[0]}), .A_REN(VCC), .A_WEN({A_WEN, A_WEN}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({GND, GND, GND, B_ADDR[6], B_ADDR[5], B_ADDR[4], 
        B_ADDR[3], B_ADDR[2], B_ADDR[1], B_ADDR[0], GND, GND, GND, GND})
        , .B_BLK_EN({VCC, VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, GND, 
        GND, GND, B_DIN[12], B_DIN[11], B_DIN[10], B_DIN[9], B_DIN[8], 
        B_DIN[7], GND, GND, GND, B_DIN[6], B_DIN[5], B_DIN[4], 
        B_DIN[3], B_DIN[2], B_DIN[1], B_DIN[0]}), .B_REN(VCC), .B_WEN({
        B_WEN, B_WEN}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
