`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/13 09:11:20
// Design Name: 
// Module Name: Synchronous_D_FF
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


module Synchronous_D_FF(
    input CLK,
    input D,
    input RST_n,
    output reg Q1,
    output reg Q2
    );
    
    always @(posedge CLK)
        case(RST_n)
            0: begin Q1 = 0; Q2 = 1; end
            1:
                case(D)
                    0: begin Q1 = 0; Q2 = 1; end
                    1: begin Q1 = 1; Q2 = 0; end
                    default: begin Q1 = 1'bx; Q2 = 1'bx; end
                endcase
            default: begin Q1 = 1'bx; Q2 = 1'bx; end
        endcase
endmodule
