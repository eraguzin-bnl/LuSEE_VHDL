`timescale 1 ns/100 ps
// Version: 2022.3 2022.3.0.8


module PF_TPSRAM_C0_PF_TPSRAM_C0_0_PF_TPSRAM(
       W_DATA,
       R_DATA,
       W_ADDR,
       R_ADDR,
       W_EN,
       CLK
    );
input  [51:0] W_DATA;
output [51:0] R_DATA;
input  [11:0] W_ADDR;
input  [11:0] R_ADDR;
input  W_EN;
input  CLK;

    wire \ACCESS_BUSY[0][0] , \ACCESS_BUSY[0][1] , \ACCESS_BUSY[0][2] , 
        \ACCESS_BUSY[0][3] , \ACCESS_BUSY[0][4] , \ACCESS_BUSY[0][5] , 
        \ACCESS_BUSY[0][6] , \ACCESS_BUSY[0][7] , \ACCESS_BUSY[0][8] , 
        \ACCESS_BUSY[0][9] , \ACCESS_BUSY[0][10] , VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("PF_TPSRAM_C0_0%4096-4096%52-52%SPEED%0%2%TWO-PORT%ECC_EN-0")
         )  PF_TPSRAM_C0_PF_TPSRAM_C0_0_PF_TPSRAM_R0C2 (.A_DOUT({nc0, 
        nc1, nc2, nc3, nc4, nc5, nc6, nc7, nc8, nc9, nc10, nc11, nc12, 
        nc13, nc14, R_DATA[14], R_DATA[13], R_DATA[12], R_DATA[11], 
        R_DATA[10]}), .B_DOUT({nc15, nc16, nc17, nc18, nc19, nc20, 
        nc21, nc22, nc23, nc24, nc25, nc26, nc27, nc28, nc29, nc30, 
        nc31, nc32, nc33, nc34}), .DB_DETECT(), .SB_CORRECT(), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][2] ), .A_ADDR({R_ADDR[11], 
        R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], R_ADDR[6], 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND}), .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), 
        .A_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND}), .A_REN(VCC), 
        .A_WEN({GND, GND}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, 
        GND}), .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, W_DATA[14], W_DATA[13], W_DATA[12], W_DATA[11], 
        W_DATA[10]}), .B_REN(VCC), .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, VCC, GND}), .A_WMODE({GND, GND}), 
        .A_BYPASS(GND), .B_WIDTH({GND, VCC, GND}), .B_WMODE({GND, GND})
        , .B_BYPASS(GND), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_TPSRAM_C0_0%4096-4096%52-52%SPEED%0%5%TWO-PORT%ECC_EN-0")
         )  PF_TPSRAM_C0_PF_TPSRAM_C0_0_PF_TPSRAM_R0C5 (.A_DOUT({nc35, 
        nc36, nc37, nc38, nc39, nc40, nc41, nc42, nc43, nc44, nc45, 
        nc46, nc47, nc48, nc49, R_DATA[29], R_DATA[28], R_DATA[27], 
        R_DATA[26], R_DATA[25]}), .B_DOUT({nc50, nc51, nc52, nc53, 
        nc54, nc55, nc56, nc57, nc58, nc59, nc60, nc61, nc62, nc63, 
        nc64, nc65, nc66, nc67, nc68, nc69}), .DB_DETECT(), 
        .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][5] ), .A_ADDR({
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND, GND}), .A_BLK_EN({VCC, VCC, VCC}), 
        .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND}), 
        .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[11], 
        W_ADDR[10], W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], 
        W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], 
        W_ADDR[0], GND, GND}), .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK)
        , .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, W_DATA[29], W_DATA[28], W_DATA[27], 
        W_DATA[26], W_DATA[25]}), .B_REN(VCC), .B_WEN({GND, VCC}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, VCC, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(GND), .B_WIDTH({GND, VCC, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(GND), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_TPSRAM_C0_0%4096-4096%52-52%SPEED%0%1%TWO-PORT%ECC_EN-0")
         )  PF_TPSRAM_C0_PF_TPSRAM_C0_0_PF_TPSRAM_R0C1 (.A_DOUT({nc70, 
        nc71, nc72, nc73, nc74, nc75, nc76, nc77, nc78, nc79, nc80, 
        nc81, nc82, nc83, nc84, R_DATA[9], R_DATA[8], R_DATA[7], 
        R_DATA[6], R_DATA[5]}), .B_DOUT({nc85, nc86, nc87, nc88, nc89, 
        nc90, nc91, nc92, nc93, nc94, nc95, nc96, nc97, nc98, nc99, 
        nc100, nc101, nc102, nc103, nc104}), .DB_DETECT(), .SB_CORRECT(
        ), .ACCESS_BUSY(\ACCESS_BUSY[0][1] ), .A_ADDR({R_ADDR[11], 
        R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], R_ADDR[6], 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND}), .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), 
        .A_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND}), .A_REN(VCC), 
        .A_WEN({GND, GND}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[11], W_ADDR[10], 
        W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, 
        GND}), .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, W_DATA[9], W_DATA[8], W_DATA[7], W_DATA[6], 
        W_DATA[5]}), .B_REN(VCC), .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, VCC, GND}), .A_WMODE({GND, GND}), 
        .A_BYPASS(GND), .B_WIDTH({GND, VCC, GND}), .B_WMODE({GND, GND})
        , .B_BYPASS(GND), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_TPSRAM_C0_0%4096-4096%52-52%SPEED%0%7%TWO-PORT%ECC_EN-0")
         )  PF_TPSRAM_C0_PF_TPSRAM_C0_0_PF_TPSRAM_R0C7 (.A_DOUT({nc105, 
        nc106, nc107, nc108, nc109, nc110, nc111, nc112, nc113, nc114, 
        nc115, nc116, nc117, nc118, nc119, R_DATA[39], R_DATA[38], 
        R_DATA[37], R_DATA[36], R_DATA[35]}), .B_DOUT({nc120, nc121, 
        nc122, nc123, nc124, nc125, nc126, nc127, nc128, nc129, nc130, 
        nc131, nc132, nc133, nc134, nc135, nc136, nc137, nc138, nc139})
        , .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][7] ), .A_ADDR({R_ADDR[11], R_ADDR[10], 
        R_ADDR[9], R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], 
        R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, 
        GND}), .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, 
        GND}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], 
        W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND}), .B_BLK_EN({W_EN, 
        VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[39], 
        W_DATA[38], W_DATA[37], W_DATA[36], W_DATA[35]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, VCC, GND}), .A_WMODE({GND, GND}), .A_BYPASS(GND), 
        .B_WIDTH({GND, VCC, GND}), .B_WMODE({GND, GND}), .B_BYPASS(GND)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_TPSRAM_C0_0%4096-4096%52-52%SPEED%0%9%TWO-PORT%ECC_EN-0")
         )  PF_TPSRAM_C0_PF_TPSRAM_C0_0_PF_TPSRAM_R0C9 (.A_DOUT({nc140, 
        nc141, nc142, nc143, nc144, nc145, nc146, nc147, nc148, nc149, 
        nc150, nc151, nc152, nc153, nc154, R_DATA[49], R_DATA[48], 
        R_DATA[47], R_DATA[46], R_DATA[45]}), .B_DOUT({nc155, nc156, 
        nc157, nc158, nc159, nc160, nc161, nc162, nc163, nc164, nc165, 
        nc166, nc167, nc168, nc169, nc170, nc171, nc172, nc173, nc174})
        , .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][9] ), .A_ADDR({R_ADDR[11], R_ADDR[10], 
        R_ADDR[9], R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], 
        R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, 
        GND}), .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, 
        GND}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], 
        W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND}), .B_BLK_EN({W_EN, 
        VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[49], 
        W_DATA[48], W_DATA[47], W_DATA[46], W_DATA[45]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, VCC, GND}), .A_WMODE({GND, GND}), .A_BYPASS(GND), 
        .B_WIDTH({GND, VCC, GND}), .B_WMODE({GND, GND}), .B_BYPASS(GND)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_TPSRAM_C0_0%4096-4096%52-52%SPEED%0%0%TWO-PORT%ECC_EN-0")
         )  PF_TPSRAM_C0_PF_TPSRAM_C0_0_PF_TPSRAM_R0C0 (.A_DOUT({nc175, 
        nc176, nc177, nc178, nc179, nc180, nc181, nc182, nc183, nc184, 
        nc185, nc186, nc187, nc188, nc189, R_DATA[4], R_DATA[3], 
        R_DATA[2], R_DATA[1], R_DATA[0]}), .B_DOUT({nc190, nc191, 
        nc192, nc193, nc194, nc195, nc196, nc197, nc198, nc199, nc200, 
        nc201, nc202, nc203, nc204, nc205, nc206, nc207, nc208, nc209})
        , .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][0] ), .A_ADDR({R_ADDR[11], R_ADDR[10], 
        R_ADDR[9], R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], 
        R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, 
        GND}), .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, 
        GND}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], 
        W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND}), .B_BLK_EN({W_EN, 
        VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[4], 
        W_DATA[3], W_DATA[2], W_DATA[1], W_DATA[0]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, VCC, GND}), .A_WMODE({GND, GND}), .A_BYPASS(GND), 
        .B_WIDTH({GND, VCC, GND}), .B_WMODE({GND, GND}), .B_BYPASS(GND)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_TPSRAM_C0_0%4096-4096%52-52%SPEED%0%8%TWO-PORT%ECC_EN-0")
         )  PF_TPSRAM_C0_PF_TPSRAM_C0_0_PF_TPSRAM_R0C8 (.A_DOUT({nc210, 
        nc211, nc212, nc213, nc214, nc215, nc216, nc217, nc218, nc219, 
        nc220, nc221, nc222, nc223, nc224, R_DATA[44], R_DATA[43], 
        R_DATA[42], R_DATA[41], R_DATA[40]}), .B_DOUT({nc225, nc226, 
        nc227, nc228, nc229, nc230, nc231, nc232, nc233, nc234, nc235, 
        nc236, nc237, nc238, nc239, nc240, nc241, nc242, nc243, nc244})
        , .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][8] ), .A_ADDR({R_ADDR[11], R_ADDR[10], 
        R_ADDR[9], R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], 
        R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, 
        GND}), .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, 
        GND}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], 
        W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND}), .B_BLK_EN({W_EN, 
        VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[44], 
        W_DATA[43], W_DATA[42], W_DATA[41], W_DATA[40]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, VCC, GND}), .A_WMODE({GND, GND}), .A_BYPASS(GND), 
        .B_WIDTH({GND, VCC, GND}), .B_WMODE({GND, GND}), .B_BYPASS(GND)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_TPSRAM_C0_0%4096-4096%52-52%SPEED%0%6%TWO-PORT%ECC_EN-0")
         )  PF_TPSRAM_C0_PF_TPSRAM_C0_0_PF_TPSRAM_R0C6 (.A_DOUT({nc245, 
        nc246, nc247, nc248, nc249, nc250, nc251, nc252, nc253, nc254, 
        nc255, nc256, nc257, nc258, nc259, R_DATA[34], R_DATA[33], 
        R_DATA[32], R_DATA[31], R_DATA[30]}), .B_DOUT({nc260, nc261, 
        nc262, nc263, nc264, nc265, nc266, nc267, nc268, nc269, nc270, 
        nc271, nc272, nc273, nc274, nc275, nc276, nc277, nc278, nc279})
        , .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][6] ), .A_ADDR({R_ADDR[11], R_ADDR[10], 
        R_ADDR[9], R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], 
        R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, 
        GND}), .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, 
        GND}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], 
        W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND}), .B_BLK_EN({W_EN, 
        VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[34], 
        W_DATA[33], W_DATA[32], W_DATA[31], W_DATA[30]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, VCC, GND}), .A_WMODE({GND, GND}), .A_BYPASS(GND), 
        .B_WIDTH({GND, VCC, GND}), .B_WMODE({GND, GND}), .B_BYPASS(GND)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_TPSRAM_C0_0%4096-4096%52-52%SPEED%0%3%TWO-PORT%ECC_EN-0")
         )  PF_TPSRAM_C0_PF_TPSRAM_C0_0_PF_TPSRAM_R0C3 (.A_DOUT({nc280, 
        nc281, nc282, nc283, nc284, nc285, nc286, nc287, nc288, nc289, 
        nc290, nc291, nc292, nc293, nc294, R_DATA[19], R_DATA[18], 
        R_DATA[17], R_DATA[16], R_DATA[15]}), .B_DOUT({nc295, nc296, 
        nc297, nc298, nc299, nc300, nc301, nc302, nc303, nc304, nc305, 
        nc306, nc307, nc308, nc309, nc310, nc311, nc312, nc313, nc314})
        , .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][3] ), .A_ADDR({R_ADDR[11], R_ADDR[10], 
        R_ADDR[9], R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], 
        R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, 
        GND}), .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, 
        GND}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], 
        W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND}), .B_BLK_EN({W_EN, 
        VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[19], 
        W_DATA[18], W_DATA[17], W_DATA[16], W_DATA[15]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, VCC, GND}), .A_WMODE({GND, GND}), .A_BYPASS(GND), 
        .B_WIDTH({GND, VCC, GND}), .B_WMODE({GND, GND}), .B_BYPASS(GND)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_TPSRAM_C0_0%4096-4096%52-52%SPEED%0%4%TWO-PORT%ECC_EN-0")
         )  PF_TPSRAM_C0_PF_TPSRAM_C0_0_PF_TPSRAM_R0C4 (.A_DOUT({nc315, 
        nc316, nc317, nc318, nc319, nc320, nc321, nc322, nc323, nc324, 
        nc325, nc326, nc327, nc328, nc329, R_DATA[24], R_DATA[23], 
        R_DATA[22], R_DATA[21], R_DATA[20]}), .B_DOUT({nc330, nc331, 
        nc332, nc333, nc334, nc335, nc336, nc337, nc338, nc339, nc340, 
        nc341, nc342, nc343, nc344, nc345, nc346, nc347, nc348, nc349})
        , .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][4] ), .A_ADDR({R_ADDR[11], R_ADDR[10], 
        R_ADDR[9], R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], 
        R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, 
        GND}), .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND}), .A_REN(VCC), .A_WEN({GND, 
        GND}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({W_ADDR[11], W_ADDR[10], W_ADDR[9], W_ADDR[8], 
        W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND}), .B_BLK_EN({W_EN, 
        VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[24], 
        W_DATA[23], W_DATA[22], W_DATA[21], W_DATA[20]}), .B_REN(VCC), 
        .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        GND, VCC, GND}), .A_WMODE({GND, GND}), .A_BYPASS(GND), 
        .B_WIDTH({GND, VCC, GND}), .B_WMODE({GND, GND}), .B_BYPASS(GND)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("PF_TPSRAM_C0_0%4096-4096%52-52%SPEED%0%10%TWO-PORT%ECC_EN-0")
         )  PF_TPSRAM_C0_PF_TPSRAM_C0_0_PF_TPSRAM_R0C10 (.A_DOUT({
        nc350, nc351, nc352, nc353, nc354, nc355, nc356, nc357, nc358, 
        nc359, nc360, nc361, nc362, nc363, nc364, nc365, nc366, nc367, 
        R_DATA[51], R_DATA[50]}), .B_DOUT({nc368, nc369, nc370, nc371, 
        nc372, nc373, nc374, nc375, nc376, nc377, nc378, nc379, nc380, 
        nc381, nc382, nc383, nc384, nc385, nc386, nc387}), .DB_DETECT()
        , .SB_CORRECT(), .ACCESS_BUSY(\ACCESS_BUSY[0][10] ), .A_ADDR({
        R_ADDR[11], R_ADDR[10], R_ADDR[9], R_ADDR[8], R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND, GND}), .A_BLK_EN({VCC, VCC, VCC}), 
        .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND}), 
        .A_REN(VCC), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[11], 
        W_ADDR[10], W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], 
        W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], 
        W_ADDR[0], GND, GND}), .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK)
        , .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[51], W_DATA[50]})
        , .B_REN(VCC), .B_WEN({GND, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, VCC, GND}), .A_WMODE({GND, GND}), 
        .A_BYPASS(GND), .B_WIDTH({GND, VCC, GND}), .B_WMODE({GND, GND})
        , .B_BYPASS(GND), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
