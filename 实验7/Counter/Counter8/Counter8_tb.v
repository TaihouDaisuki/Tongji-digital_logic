
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/20 08:24:18
// Design Name: 
// Module Name: Counter8_tb
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
module Counter8_tb;
    reg CLK = 1, RST_n;
    wire [2:0] oQ;
    wire [6:0] oDisplay;
    
    Counter8 uut(.CLK(CLK), .rst_n(RST_n), .oQ(oQ), .oDisplay(oDisplay));
    
    always #25 CLK = ~CLK;
    initial
    begin
        RST_n = 0;
        #1 RST_n = 1;
        #121 RST_n = 0;
        #50 RST_n = 1;
    end
endmodule
