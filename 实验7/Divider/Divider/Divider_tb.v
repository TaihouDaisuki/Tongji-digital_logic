
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/20 09:06:03
// Design Name: 
// Module Name: Divider_tb
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
module Divider_tb;
    reg I_CLK = 0, RST;
    wire O_CLK;
    
    Divider #(.mod(20))uut(.I_CLK(I_CLK), .RST(RST), .O_CLK(O_CLK));
    always #5 I_CLK = ~I_CLK;
    initial
    begin
        RST = 0;
        #17 RST = 1;
        #25 RST = 0;
    end
endmodule
