`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/17 18:39:29
// Design Name: 
// Module Name: de_selector14_tb
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
module de_selector14_tb;
    reg iC = 0; 
    reg iS1, iS0;
    wire oZ0, oZ1, oZ2, oZ3;
    
    de_selector14 uut (
    .iC(iC), .iS1(iS1), .iS0(iS0), 
    .oZ0(oZ0), .oZ1(oZ1), .oZ2(oZ2), .oZ3(oZ3)
    );
    
    initial
    begin
        iS1 = 0;
        #200 iS1 = 1;
    end
    
    initial
    begin
        iS0 = 0;
        #100 iS0 = 1;
        #100 iS0 = 0;
        #100 iS0 = 1;
    end
endmodule
