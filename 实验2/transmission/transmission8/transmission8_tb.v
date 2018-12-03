`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/17 19:14:30
// Design Name: 
// Module Name: transmission8_tb
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

`timescale 1ns / 1ns
module transmission8_tb;
    reg [7:0] iData = 8'b10101010;
    reg A, B, C;
    wire [7:0] oData;
    
    transmission8 uut(
        .iData(iData), .A(A), .B(B), .C(C),
        .oData(oData)
    );
   
    initial
    begin
        A = 0;
        #400 A = 1;
    end
    
    initial
    begin
        B = 0;
        #200 B = 1;
        #200 B = 0;
        #200 B = 1;
    end
    
    initial
    begin
        C = 0;
        #100 C = 1;
        #100 C = 0;
        #100 C = 1;
        #100 C = 0;
        #100 C = 1;
        #100 C = 0;
        #100 C = 1;
    end
endmodule
