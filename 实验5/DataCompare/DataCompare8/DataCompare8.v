`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/06 09:27:20
// Design Name: 
// Module Name: DataCompare8
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

module DataCompare8(
    input [7:0] iData_a,
    input [7:0] iData_b,
    output [2:0] oData
    );
    
    wire [2:0] iData;
    
    DataCompare4 first(.iData_a(iData_a[3:0]), .iData_b(iData_b[3:0]),
    .iData(3'b001), .oData(iData));
    DataCompare4 second(.iData_a(iData_a[7:4]), .iData_b(iData_b[7:4]),
    .iData(iData), .oData(oData));
endmodule
