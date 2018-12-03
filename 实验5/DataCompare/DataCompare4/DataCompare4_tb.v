
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/06 08:57:27
// Design Name: 
// Module Name: DataCompare4_tb
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
module DataCompare4_tb;
    reg [3:0] iData_a;
    reg [3:0] iData_b;
    reg [2:0] iData;
    wire [2:0] oData;
    
    DataCompare4 uut(
    .iData_a(iData_a), .iData_b(iData_b),
    .iData(iData), .oData(oData));
    
    initial
    begin
        iData_a = 4'b1010;
        iData_b = 4'b1101;
        iData = 3'b001;
        
        #100
        iData_b = 4'b1001;
        
        #100
        iData_b = 4'b1010;
        iData = 3'b010;
        
        #100
        iData = 3'b100;
    end
endmodule
