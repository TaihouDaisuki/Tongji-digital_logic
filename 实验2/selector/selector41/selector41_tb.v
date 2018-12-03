`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/16 08:49:29
// Design Name: 
// Module Name: selector41_tb
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
module selector41_tb;
    reg [3:0] iC0 = 4'b0000; 
    reg [3:0] iC1 = 4'b0010;
    reg [3:0] iC2 = 4'b0101;
    reg [3:0] iC3 = 4'b1111;
    reg iS1, iS0;
    wire [3:0] oZ;
    
    selector41 uut (
    .iC0(iC0), .iC1(iC1), .iC2(iC2), .iC3(iC3),
    .iS1(iS1), .iS0(iS0),
    .oZ(oZ)
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
