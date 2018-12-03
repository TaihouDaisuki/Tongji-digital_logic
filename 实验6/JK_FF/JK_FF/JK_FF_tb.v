
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/13 10:20:35
// Design Name: 
// Module Name: JK_FF_tb
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


`timescale 1ns / 1ps
module JK_FF_tb;
    reg CLK, RST_n, J, K;
    wire Q1, Q2;
    
    JK_FF uut(
    .CLK(CLK), .J(J), .K(K), .RST_n(RST_n),
    .Q1(Q1), .Q2(Q2));
    
    initial
    begin
        CLK = 1;
        #25 CLK = 0;
        #25 CLK = 1;
        #25 CLK = 0;
        #25 CLK = 1;
        #25 CLK = 0;
        #25 CLK = 1;
        #25 CLK = 0;
        #25 CLK = 1;
        #25 CLK = 0;
        #25 CLK = 1;
    end
    
    initial
    begin
        RST_n <= 1; J <= 1; K <= 0;
        #60 J = 0;
        #50 K = 1;
        #50 J = 1;
        #50 RST_n = 0;
    end
endmodule
