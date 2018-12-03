
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/07 14:12:15
// Design Name: 
// Module Name: DataCompare8_tb
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
module DataCompare8_tb;
    reg [7:0] iData_a;
    reg [7:0] iData_b;
    wire [2:0] oData;

    DataCompare8 uut(
    .iData_a(iData_a), .iData_b(iData_b),
    .oData(oData));

    initial
    begin
        iData_a = 8'b10101010;
        iData_b = 8'b10101011;

        #100
        iData_b = 8'b10101001;
        
        #100
        iData_b = 8'b10111010;

        #100
        iData_b = 8'b01011010;
        
        #100
        iData_b = 8'b10101010;
    end
endmodule
