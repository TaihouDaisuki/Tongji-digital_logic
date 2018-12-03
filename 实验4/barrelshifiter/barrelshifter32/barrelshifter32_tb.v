//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/30 09:05:54
// Design Name: 
// Module Name: barrelshifter32_tb
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

`timescale 1ns / 1ps
module barrelshifter32_tb;
    reg [31:0] a;
    reg [4:0] b;
    reg [1:0] aluc;
    wire [31:0] c;
    
    barrelshifter32 uut(
    .a(a), .b(b), .aluc(aluc),
    .c(c)
    );
    
    initial
    begin
        a <= 32'hFEEE1234;
        b <= 5'b01010;
        aluc <= 2'b00;
        
        #100
        a <= 32'h6F24E9C0;
        b <= 5'b11001;
        aluc <= 2'b00;
        
        #100
        a <= 32'hE10381AB;
        b <= 5'b00010;
        aluc <= 2'b01;
        
        #100
        a <= 32'h80B29E20;
        b <= 5'b00101;
        aluc <= 2'b10;
                
        #100
        a <= 32'hC019AD39;
        b <= 5'b11011;
        aluc <= 2'b11;
    end
endmodule
