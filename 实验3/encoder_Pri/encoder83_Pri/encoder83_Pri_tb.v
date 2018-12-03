`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/23 09:35:31
// Design Name: 
// Module Name: encoder83_pri_tb
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


module encoder83_Pri_tb;
    reg [7:0] iData;
    reg iEI;
    wire [2:0] oData;
    wire oEO;
    
    encoder83_Pri uut(
    .iData(iData), .iEI(iEI),
    .oData(oData), .oEO(oEO));
    
    initial
    begin
        iData <= 8'b11111111;
        iEI <=1'b1;
        #50
        iEI <= 0;
        iData <= 8'b01x01x00;
        #50 iData = 8'b10x01x00;
        #50 iData = 8'b11001x00;
        #50 iData = 8'b11101x00;
        #50 iData = 8'b11110x00;
        #50 iData = 8'b11111000;
        #50 iData = 8'b11111100;
        #50 iData = 8'b11111110;
    end
endmodule
