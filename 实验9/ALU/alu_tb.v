
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/08 15:06:58
// Design Name: 
// Module Name: alu_tb
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
module alu_tb;
    reg [31:0] a, b;
    reg [3:0] aluc;
    wire [31:0] r;
    wire zero, carry, negative, overflow;
    
    alu uut(.a(a), .b(b), .aluc(aluc),
            .r(r),
            .zero(zero), .carry(carry), .negative(negative), .overflow(overflow));
    
    initial
    begin
        aluc <= 4'b0000;
        a <= 32'hffffffff; b <= 32'h00000001;
        #20 aluc <= 4'b0010;
        a <= 32'h7fffffff; b <= 32'h00000001;
        
        #20 aluc <= 4'b0001;
        a <= 32'h00000001; b <= 32'hffffffff;
        #20 aluc <= 4'b0011;
        a <= 32'h80000000; b <= 32'h00000001;
        
        #20 aluc <= 4'b0100;
        a <= 32'hffffffff; b <= 32'haaaaaaaa;
        #20 aluc <= 4'b0101;
        #20 aluc <= 4'b0110;
        #20 aluc <= 4'b0111;
        #20 aluc <= 4'b1001;
        #10 aluc <= 4'b1000;
        
        #10 aluc <= 4'b1011;
        a <= 32'hffffffff; b <= 32'h7fffffff;
        #20 aluc <= 4'b1010;
        
        #20 aluc <= 4'b1100;
        a <= 32'h00000010; b<= 32'hf1234567;
        #20 aluc <= 4'b1110;
        #20 aluc <= 4'b1101;
        #20 aluc <= 4'b1111;
    end
endmodule
