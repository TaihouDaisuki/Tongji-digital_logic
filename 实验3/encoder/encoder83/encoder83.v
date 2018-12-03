`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/23 09:17:34
// Design Name: 
// Module Name: edcoder83
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


module encoder83(
    input [7:0] iData,
    output reg [2:0] oData
    );
    
    always @(*)
        case (iData)
            8'b10000000: oData = 3'b111;
            8'b01000000: oData = 3'b110;
            8'b00100000: oData = 3'b101;
            8'b00010000: oData = 3'b100;
            8'b00001000: oData = 3'b011;
            8'b00000100: oData = 3'b010;
            8'b00000010: oData = 3'b001;
            8'b00000001: oData = 3'b000;
            default: oData = 3'bxxx;
        endcase
    
endmodule
