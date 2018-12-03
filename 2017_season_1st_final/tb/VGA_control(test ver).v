`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/18 21:32:15
// Design Name: 
// Module Name: VGA_control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: VGA控制器，行场扫描，输出对应像素点RGB
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define H_FRONT 11'd40
`define H_BACK  11'd88
`define H_SYNC  11'd128
`define H_DISP  11'd800
`define H_TOTAL 11'd1056

`define V_FRONT 11'd1
`define V_BACK  11'd23
`define V_SYNC  11'd4
`define V_DISP  11'd600
`define V_TOTAL 11'd628

module VGA_control
    #(
        parameter X1 = 0,
        parameter Y1 = 0,
        parameter X2 = 800,
        parameter Y2 = 600
    )
    (
        input CLK,
        input RST,
        output reg[3:0] R,
        output reg[3:0] G,
        output reg[3:0] B,
        output HS,
        output VS
    );
     reg [10:0] Hcnt, Vcnt;
     initial
     begin
         Hcnt <= 0;
         Vcnt <= 0;
     end
     wire VGA_CLK;
     Divider#(.mod(2)) get_VGA_CLK(.I_CLK(CLK), .RST(RST), .O_CLK(VGA_CLK));
     //---------------行扫描---------------
     always @(posedge VGA_CLK or posedge RST)
     begin
         if(RST)
             Hcnt <= 11'd0;
         else
         begin
             if(Hcnt < `H_TOTAL - 1)
                 Hcnt <= Hcnt + 1;
             else
                 Hcnt <= 11'd0;
         end
     end
     assign HS = (Hcnt < `H_SYNC) ? 1'b0 : 1'b1; //VGA行同步信号
     //---------------列扫描---------------
     always @(posedge VGA_CLK or posedge RST)
     begin
         if(RST)
             Vcnt <= 11'd0;
         else if(Hcnt == `H_TOTAL - 1) //行结束
         begin
             if(Vcnt < `V_TOTAL - 1)
                 Vcnt <= Vcnt + 1;
             else
                 Vcnt <= 11'd0;
         end
     end
     assign VS = (Vcnt < `V_SYNC) ? 1'b0 : 1'b1; //VGA场信号同步
     //---------------输出区域使能 800*600---------------
     wire [10:0] en_H, en_V;
     wire en;
     assign en_H = ((Hcnt >= `H_SYNC + `H_BACK) && (Hcnt < `H_TOTAL - `H_FRONT)) ? (Hcnt - `H_SYNC - `H_BACK + 1) : 11'b0;
     assign en_V = ((Vcnt >= `V_SYNC + `V_BACK) && (Vcnt < `V_TOTAL - `V_FRONT)) ? (Vcnt - `V_SYNC - `V_BACK + 1) : 11'b0; 
     assign en = ((en_H > 11'b0) && (en_V > 11'b0)) ? 1'b1 : 1'b0;
     //---------------rgb显示区使能 (X1,Y1)(X2,Y2)划分的区域---------------
     wire out_H, out_V;
     wire out_en;
     assign out_H = (en && (Hcnt >= `H_SYNC + `H_BACK + X1) && (Hcnt < `H_SYNC + `H_BACK + X2));
     assign out_V = (en && (Vcnt >= `V_SYNC + `V_BACK + Y1) && (Vcnt < `V_SYNC + `V_BACK + Y2));
     assign out_en = ((out_H > 1'b0) && (out_V > 1'b0)) ? 1'b1 : 1'b0;
     //---------------自带rom的IP核 打一个图片试试---------------
     wire [17:0]addr;
     wire [15:0]data;
     assign addr = (en > 1'b0) ? ((en_V - 1) / 2 * 400 + (en_H - 1) / 2) : {18{1'bz}};
     blk_mem_gen_0 IP_ram(.clka(VGA_CLK), .addra(addr), .douta(data), .ena(1));
     //---------------RBG数值确定---------------
     always @(Hcnt or Vcnt)
     begin
        if(en > 1'b0)
        begin
            R <= (out_en > 1'b0) ? data[15:12] : 11'd0;
            G <= (out_en > 1'b0) ? data[10:7] : 11'd0;
            B <= (out_en > 1'b0) ? data[4:1] : 11'd0;
            /*if(Vcnt<100)begin
                 R = 0;
                 G = 0;
                 B = 15;
             end
             else if(Vcnt<200)begin
                 R = 0;
                 G = 15;
                 B = 0;
             end
             else begin
                 R = 15;
                 G = 0;
                 B = 0;
             end*/
        end
        else
        begin
            R = 11'd2;
            G = 11'd2; //消隐区设置RBG，如果不管好像默认全15会黑屏(?)
            B = 11'd2;
        end
     end
endmodule
