`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/16 08:25:27
// Design Name: 
// Module Name: selector41
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


module selector41(
    input [3:0] iC0,
    input [3:0] iC1,
    input [3:0] iC2,
    input [3:0] iC3,
    input iS1,
    input iS0,
    output reg [3:0] oZ
);

    always @(iC0 or iC1 or iC2 or iC3 or iS1 or iS0)
        case({iS1,iS0})
            2'b00 : oZ <= iC0;
            2'b01 : oZ <= iC1;
            2'b10 : oZ <= iC2;
            2'b11 : oZ <= iC3;
            default : oZ <= 1'bx;
         endcase
endmodule
