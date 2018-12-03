`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/26 18:21:29
// Design Name: 
// Module Name: NUM_selector_8
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 八位数据选择器，选择灯管输出信号
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module NUM_selector_8(
    input [2:0] iC,
    input [3:0] num0,
    input [3:0] num1,
    input [3:0] num2,
    input [3:0] num3,
    input [3:0] num4,
    input [3:0] num5,
    input [3:0] num6,
    input [3:0] num7,
    output reg [3:0] num
    );
    always @(iC)
        case(iC)
            'd0: num <= num0;
            'd1: num <= num1;
            'd2: num <= num2;
            'd3: num <= num3;
            'd4: num <= num4;
            'd5: num <= num5;
            'd6: num <= num6;
            'd7: num <= num7;
            default: num <= 4'bzzzz;
        endcase
endmodule
