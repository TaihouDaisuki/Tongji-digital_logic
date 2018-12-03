`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/24 20:05:11
// Design Name: 
// Module Name: DIG_driver
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 七段数码管驱动，不同数码管显示不同信息
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module DIG_driver(
    input rst,
    input clk,
    input [3:0] num0,
    input [3:0] num1,
    input [3:0] num2,
    input [3:0] num3,
    input [3:0] num4,
    input [3:0] num5,
    input [3:0] num6,
    input [3:0] num7,
    output [7:0] SEG, //段控
    output [7:0] DIG  //管控
    );
    wire DIG_CLK;
    wire [3:0] num;
    wire [2:0] DIG_ID;
    Divider#(200000) GET_LED_CLK(.I_CLK(clk), .RST(~rst), .O_CLK(DIG_CLK)); //分频 500Hz
    
    DIG_control CHOOSE_DIG(.clk(DIG_CLK), .rst(rst), .DIG_ID(DIG_ID)); //数码管管控制器
    DIG_decoder_3_8 DISP_DIG(.iC(DIG_ID), .rst(rst), .oC(DIG)); //管控38译码器
    NUM_selector_8 TRANS_SEG(.iC(DIG_ID),
                             .num0(num0), .num1(num1), .num2(num2), .num3(num3),
                             .num4(num4), .num5(num5), .num6(num6), .num7(num7),
                             .num(num)); //数字选择器
    SEG_decoder_4_8 DISP_SEG(.dig(DIG), .rst(rst), .num(num), .seg(SEG)); //段控48译码器
endmodule
