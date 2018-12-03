`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/29 13:53:33
// Design Name: 
// Module Name: PS2_DIG
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PS2_DIG(
    //--------PS/2_in--------
    input clk,
    input rst,
    input data_in,
    input clk_in,
    //--------DIG_out--------
    output [7:0] DIG,
    output [7:0] SEG
    );
    wire [4:0] alph;
    wire [3:0] num0, num1;
    PS2_driver PS2_in(.clk(clk), .rst(~rst), .data_in(data_in), .clk_in(clk_in),
                      .alph(alph));
    assign num0 = alph % 10;
    assign num1 = alph / 10 % 10;
    DIG_driver DIG_out(.clk(clk), .rst(~rst),
                       .num0(num0), .num1(num1), .num2(0), .num3(0),
                       .num4(4), .num5(5), .num6(6), .num7(7),
                       .DIG(DIG), .SEG(SEG));
endmodule
