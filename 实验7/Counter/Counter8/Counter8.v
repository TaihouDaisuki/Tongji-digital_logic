`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/20 08:12:08
// Design Name: 
// Module Name: Counter8
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


module Counter8(
    input CLK,
    input rst_n,
    output [2:0] oQ,
    output [6:0] oDisplay
    );
    //wire _CLK;
    //Divider #(.mod(50000000))Time(.I_CLK(CLK), .RST(~rst_n), .O_CLK(_CLK));
    //JK_FF Q0(.CLK(_CLK), .J(1), .K(1), .RST_n(rst_n), .Q1(oQ[0]));
    //JK_FF Q1(.CLK(_CLK), .J(oQ[0]), .K(oQ[0]), .RST_n(rst_n), .Q1(oQ[1]));
    //JK_FF Q2(.CLK(_CLK), .J(oQ[0] & oQ[1]), .K(oQ[0] & oQ[1]), .RST_n(rst_n), .Q1(oQ[2]));
    JK_FF Q0(.CLK(CLK), .J(1), .K(1), .RST_n(rst_n), .Q1(oQ[0]));
    JK_FF Q1(.CLK(CLK), .J(oQ[0]), .K(oQ[0]), .RST_n(rst_n), .Q1(oQ[1]));
    JK_FF Q2(.CLK(CLK), .J(oQ[0] & oQ[1]), .K(oQ[0] & oQ[1]), .RST_n(rst_n), .Q1(oQ[2]));
    display7 display(.iData({1'b0, oQ}), .oData(oDisplay));
endmodule
