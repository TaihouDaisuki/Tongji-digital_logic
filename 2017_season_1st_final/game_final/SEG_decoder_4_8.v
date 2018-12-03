`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/26 18:15:35
// Design Name: 
// Module Name: SEG_decoder_4_8
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 48译码器，根据数值对数码管信号译码
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SEG_decoder_4_8(
    input [7:0] dig,
    input rst,
    input [3:0] num,
    output reg [7:0] seg
    );
    always @(dig or rst)
    begin
        if(!rst)
            seg <= 8'b0000_0000;
        else
        begin
            casez(num)
                'd0: seg[6:0] <= 8'b100_0000;
                'd1: seg[6:0] <= 8'b111_1001; 
                'd2: seg[6:0] <= 8'b010_0100;
                'd3: seg[6:0] <= 8'b011_0000;
                'd4: seg[6:0] <= 8'b001_1001;
                'd5: seg[6:0] <= 8'b001_0010;
                'd6: seg[6:0] <= 8'b000_0010;
                'd7: seg[6:0] <= 8'b111_1000;
                'd8: seg[6:0] <= 8'b000_0000;
                'd9: seg[6:0] <= 8'b001_0000;
                default: seg <= 8'b0000_0000;
            endcase
            if(dig == 8'b1111_1101)
                seg[7] <= 1'b0;
            else
                seg[7] <= 1'b1;
            //最高位为小数点
        end
    end
endmodule
