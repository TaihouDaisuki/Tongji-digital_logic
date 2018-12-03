`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/23 08:21:32
// Design Name: 
// Module Name: decoder
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


module decoder(
    input [2:0] iData,
    input [1:0] iEna,
    output reg [7:0] oData
    );
    
    always @(*)
    begin
        casex ({iEna[1], iEna[0]})
            2'b10: 
            begin
                oData = 8'b11111111;
                case ({iData})
                    3'b000: oData[0] = 0;
                    3'b001: oData[1] = 0;
                    3'b010: oData[2] = 0;
                    3'b011: oData[3] = 0;
                    3'b100: oData[4] = 0;
                    3'b101: oData[5] = 0;
                    3'b110: oData[6] = 0;
                    3'b111: oData[7] = 0;
                    default: oData = 8'bxxxxxxxx;
                endcase
            end
            2'b0x, 2'bx1:
                oData = 8'b11111111;
            default:
                oData = 8'bxxxxxxxx;
      endcase
    end
    
endmodule
