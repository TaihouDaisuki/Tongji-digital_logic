
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/13 09:31:03
// Design Name: 
// Module Name: Asynchronous_D_FF_tb
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


module Asynchronous_D_FF_tb;
    reg CLK, D, RST_n;
    wire Q1, Q2;
    
    Asynchronous_D_FF uut(
    .CLK(CLK), .D(D), .RST_n(RST_n),
    .Q1(Q1), .Q2(Q2));
    
    initial
    begin
        CLK = 1;
        #50 CLK = 0;
        #50 CLK = 1;
        #50 CLK = 0;
        #50 CLK = 1;
        #50 CLK = 0;
        #50 CLK = 1;
    end
    
    initial
    begin
        D <= 0; RST_n <= 1;
        #60 D = 0;
        #100 D = 1;
        #100 RST_n = 0;
    end
endmodule
