`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/30 08:34:55
// Design Name: 
// Module Name: barrelshifter32
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


module barrelshifter32(
    input [31:0] a,
    input [4:0] b,
    input [1:0] aluc,
    output reg [31:0] c
);

    reg [31:0] tmp;
    always @(*)
    begin
        case(aluc)
            2'b00:
            begin
                tmp = b[0] ? {a[31], a[31:1]} : a;
                tmp = b[1] ? {{2{tmp[31]}}, tmp[31:2]} : tmp;
                tmp = b[2] ? {{4{tmp[31]}}, tmp[31:4]} : tmp;
                tmp = b[3] ? {{8{tmp[31]}}, tmp[31:8]} : tmp;
                tmp = b[4] ? {{16{tmp[31]}}, tmp[31:16]} : tmp;
            end
            
            2'b01:
            begin
                tmp = b[0] ? {1'b0, a[31:1]} : a;
                tmp = b[1] ? {{2{1'b0}}, tmp[31:2]} : tmp;
                tmp = b[2] ? {{4{1'b0}}, tmp[31:4]} : tmp;
                tmp = b[3] ? {{8{1'b0}}, tmp[31:8]} : tmp;
                tmp = b[4] ? {{16{1'b0}}, tmp[31:16]} : tmp;
            end
            
            2'b10, 2'b11:
            begin
                tmp = b[0] ? {a[30:0], 1'b0} : a;
                tmp = b[1] ? {tmp[29:0], {2{1'b0}}} : tmp;
                tmp = b[2] ? {tmp[27:0], {4{1'b0}}} : tmp;
                tmp = b[3] ? {tmp[23:0], {8{1'b0}}} : tmp;
                tmp = b[4] ? {tmp[15:0], {16{1'b0}}} : tmp;
            end
        endcase
        c = tmp;
    end
endmodule
