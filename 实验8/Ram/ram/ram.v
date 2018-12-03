`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/27 08:30:24
// Design Name: 
// Module Name: ram
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


module ram(
    input clk,
    input ena,
    input wena,
    input [4:0] addr,
    input [31:0] data_in,
    output [31:0] data_out
    );
    
    reg [31:0] temp[31:0];
    assign data_out = (ena == 1 && wena == 0) ? temp[addr] : {32{1'bz}};
    always @(posedge clk)
        if(ena == 1 && wena == 1)
            temp[addr] = data_in;
endmodule
