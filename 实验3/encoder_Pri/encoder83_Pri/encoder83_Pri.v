`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/23 09:35:15
// Design Name: 
// Module Name: encoder83_pri
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


module encoder83_Pri(
    input [7:0] iData,
    input iEI,
    output reg [2:0] oData,
    output reg oEO
    );
    
    always @(*)
    begin
        case (iEI)
            1'b1:
                case (iData)
                    8'b11111111:
                    begin
                        oData = 3'b111;
                        oEO = 1'b0;
                    end
                    default:
                    begin
                        oData = 3'bxxx;
                        oEO = 1'bx;
                    end
                endcase
            1'b0:
            begin
                oEO = 1;
                casex (iData)
                    8'b0xxxxxxx: oData = 3'b000;
                    8'b10xxxxxx: oData = 3'b001;
                    8'b110xxxxx: oData = 3'b010;
                    8'b1110xxxx: oData = 3'b011;
                    8'b11110xxx: oData = 3'b100;
                    8'b111110xx: oData = 3'b101;
                    8'b1111110x: oData = 3'b110;
                    8'b11111110: oData = 3'b111;
                    default:
                    begin
                        oEO = 1'bx;
                        oData = 3'bxxx;
                    end
                endcase
            end
        endcase
    end
    
endmodule
