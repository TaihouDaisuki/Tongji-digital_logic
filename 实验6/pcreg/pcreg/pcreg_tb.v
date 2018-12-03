
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/12 21:06:52
// Design Name: 
// Module Name: pcreg_tb
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
module pcreg_tb;
    reg clk, rst, ena;
    reg [31:0] data_in;
    wire [31:0] data_out;
    
    pcreg uut(
    .clk(clk), .rst(rst), .ena(ena),
    .data_in(data_in), .data_out(data_out));
    
    initial
    begin
        clk = 1;
        #25 clk = 0;
        #25 clk = 1;
        #25 clk = 0;
        #25 clk = 1;
        #25 clk = 0;
        #25 clk = 1;
    end
    
    initial
    begin
        data_in <= 19430407; rst <= 0; ena <= 0;
        #60 rst = 1;
        #50 rst <= 0; ena <= 1;
        #100 rst = 1;
    end
endmodule
