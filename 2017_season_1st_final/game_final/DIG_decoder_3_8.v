`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/26 18:18:54
// Design Name: 
// Module Name: DIG_decoder_3_8
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 38ÒëÂëÆ÷£¬ÒëÂë¹Ü¿ØÐÅºÅ
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DIG_decoder_3_8(
    input [2:0] iC,
    input rst,
    output reg [7:0] oC
    );
    always @(iC or rst)
    begin
        if(!rst)
            oC <= 8'b0000_0000;
        else
        begin
            case(iC)
                'd0: oC <= 8'b1111_1110;
                'd1: oC <= 8'b1111_1101;
                'd2: oC <= 8'b1111_1011;
                'd3: oC <= 8'b1111_0111;
                'd4: oC <= 8'b1110_1111;
                'd5: oC <= 8'b1101_1111;
                'd6: oC <= 8'b1011_1111;
                'd7: oC <= 8'b0111_1111;
                default: oC <= 8'b0000_0000;
            endcase
        end
    end
endmodule
