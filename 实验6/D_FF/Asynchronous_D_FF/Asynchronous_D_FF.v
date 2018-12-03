`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/13 09:30:12
// Design Name: 
// Module Name: Asynchronous_D_FF
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


module Asynchronous_D_FF(
    input CLK,
    input D,
    input RST_n,
    output reg Q1,
    output reg Q2
    );
    
    always @(posedge CLK or negedge RST_n)
        if(RST_n == 0)
            {Q1, Q2} = 2'b01;
        else if(RST_n == 1)
            case(D)
                0: {Q1, Q2} = 2'b01;
                1: {Q1, Q2} = 2'b10;
                default: {Q1, Q2} = 2'bxx;
            endcase
        else
            {Q1, Q2} = 2'bxx;
endmodule
