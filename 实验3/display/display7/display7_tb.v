`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/23 08:52:35
// Design Name: 
// Module Name: display7_tb
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


module display7_tb;
    reg [3:0] iData;
    wire [6:0] oData;
    
    display7 uut(
    .iData(iData),
    .oData(oData));
    
    initial
    begin
        iData = 4'b0000;
        #50 iData = 4'b0001;
        #50 iData = 4'b0010;
        #50 iData = 4'b0011;
        #50 iData = 4'b0100;
        #50 iData = 4'b0101;
        #50 iData = 4'b0110;
        #50 iData = 4'b0111;
        #50 iData = 4'b1000;
        #50 iData = 4'b1001;
        #50 iData = 4'b1010;
    end
endmodule
