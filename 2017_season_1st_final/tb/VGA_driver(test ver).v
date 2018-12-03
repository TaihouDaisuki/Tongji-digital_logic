`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/18 19:48:48
// Design Name: 
// Module Name: VGA_driver
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: VGAÇý¶¯
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module VGA_driver
    (
        input CLK,
        output [3:0] R,
        output [3:0] G,
        output [3:0] B,
        output HS,
        output VS
    );
    
    VGA_control VGA(
    .CLK(CLK), .RST(0),
    .R(R), .G(G), .B(B),
    .HS(HS), .VS(VS));
endmodule