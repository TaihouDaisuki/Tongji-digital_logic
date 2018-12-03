`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/13 10:20:01
// Design Name: 
// Module Name: JK_FF
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


module JK_FF(
    input CLK,
    input J,
    input K,
    input RST_n,
    output reg Q1,
    output reg Q2
    );
    
    always @(posedge CLK or negedge RST_n)
        if(RST_n == 0)
            {Q1, Q2} = 2'b01;
        else if(RST_n == 1)
            case({J, K})
                2'b00: ;
                2'b01: {Q1, Q2} = 2'b01; 
                2'b10: {Q1, Q2} = 2'b10;
                2'b11: {Q1, Q2} = {Q2, Q1};
                default: {Q1, Q2} = 2'bxx;
            endcase
        else
            {Q1, Q2} = 2'bxx;
endmodule
