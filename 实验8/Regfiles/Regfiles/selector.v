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


module selector(
    input [31:0] iC0,
    input [31:0] iC1,
    input [31:0] iC2,
    input [31:0] iC3,
    input [31:0] iC4,
    input [31:0] iC5,
    input [31:0] iC6,
    input [31:0] iC7,
    input [31:0] iC8,
    input [31:0] iC9,
    input [31:0] iC10,
    input [31:0] iC11,
    input [31:0] iC12,
    input [31:0] iC13,
    input [31:0] iC14,
    input [31:0] iC15,
    input [31:0] iC16,
    input [31:0] iC17,
    input [31:0] iC18,
    input [31:0] iC19,
    input [31:0] iC20,
    input [31:0] iC21,
    input [31:0] iC22,
    input [31:0] iC23,
    input [31:0] iC24,
    input [31:0] iC25,
    input [31:0] iC26,
    input [31:0] iC27,
    input [31:0] iC28,
    input [31:0] iC29,
    input [31:0] iC30,
    input [31:0] iC31,
    input [4:0] iS,
    input iEna,
    output reg [31:0] oZ
);

    always @(*)
    begin
        if(iEna == 1)
            case(iS)
                5'b00000: oZ = iC0;
                5'b00001: oZ = iC1;
                5'b00010: oZ = iC2;
                5'b00011: oZ = iC3;
                5'b00100: oZ = iC4;
                5'b00101: oZ = iC5;
                5'b00110: oZ = iC6;
                5'b00111: oZ = iC7;
                5'b01000: oZ = iC8;
                5'b01001: oZ = iC9;
                5'b01010: oZ = iC10;
                5'b01011: oZ = iC11;
                5'b01100: oZ = iC12;
                5'b01101: oZ = iC13;
                5'b01110: oZ = iC14;
                5'b01111: oZ = iC15;
                5'b10000: oZ = iC16;
                5'b10001: oZ = iC17;
                5'b10010: oZ = iC18;
                5'b10011: oZ = iC19;
                5'b10100: oZ = iC20;
                5'b10101: oZ = iC21;
                5'b10110: oZ = iC22;
                5'b10111: oZ = iC23;
                5'b11000: oZ = iC24;
                5'b11001: oZ = iC25;
                5'b11010: oZ = iC26;
                5'b11011: oZ = iC27;
                5'b11100: oZ = iC28;
                5'b11101: oZ = iC29;
                5'b11110: oZ = iC30;
                5'b11111: oZ = iC31;
                default: oZ = {32{1'bz}};
            endcase
        else
            oZ = {32{1'bz}};
    end
endmodule
