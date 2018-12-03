`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/17 19:15:01
// Design Name: 
// Module Name: transmission8
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

module transmission8(
    input [7:0] iData,
    input A, B, C,
    output reg [7:0] oData
    );
    
    always @(iData or A or B or C)
    begin
        oData = 8'b11111111;
        case ({A,B,C})
            3'b000: oData[0] <= iData[0];
            3'b001: oData[1] <= iData[1];
            3'b010: oData[2] <= iData[2];
            3'b011: oData[3] <= iData[3];
            3'b100: oData[4] <= iData[4];
            3'b101: oData[5] <= iData[5];
            3'b110: oData[6] <= iData[6];
            3'b111: oData[7] <= iData[7];
            default : oData <= 8'bxxxxxxxx;
        endcase
    end
endmodule

