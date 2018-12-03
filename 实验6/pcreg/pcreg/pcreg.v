`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/13 10:51:26
// Design Name: 
// Module Name: pcreg
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


module pcreg(
    input clk,
    input rst,
    input ena,
    input [31:0] data_in,
    output reg [31:0] data_out
    );
    
    wire [31:0] data_tmp;
    Asynchronous_D_FF b0(.CLK(clk), .D(data_in[0]), .RST_n(~rst), .Q1(data_tmp[0]));
    Asynchronous_D_FF b1(.CLK(clk), .D(data_in[1]), .RST_n(~rst), .Q1(data_tmp[1]));
    Asynchronous_D_FF b2(.CLK(clk), .D(data_in[2]), .RST_n(~rst), .Q1(data_tmp[2]));
    Asynchronous_D_FF b3(.CLK(clk), .D(data_in[3]), .RST_n(~rst), .Q1(data_tmp[3]));
    Asynchronous_D_FF b4(.CLK(clk), .D(data_in[4]), .RST_n(~rst), .Q1(data_tmp[4]));
    Asynchronous_D_FF b5(.CLK(clk), .D(data_in[5]), .RST_n(~rst), .Q1(data_tmp[5]));
    Asynchronous_D_FF b6(.CLK(clk), .D(data_in[6]), .RST_n(~rst), .Q1(data_tmp[6]));
    Asynchronous_D_FF b7(.CLK(clk), .D(data_in[7]), .RST_n(~rst), .Q1(data_tmp[7]));
    Asynchronous_D_FF b8(.CLK(clk), .D(data_in[8]), .RST_n(~rst), .Q1(data_tmp[8]));
    Asynchronous_D_FF b9(.CLK(clk), .D(data_in[9]), .RST_n(~rst), .Q1(data_tmp[9]));
    Asynchronous_D_FF b10(.CLK(clk), .D(data_in[10]), .RST_n(~rst), .Q1(data_tmp[10]));
    Asynchronous_D_FF b11(.CLK(clk), .D(data_in[11]), .RST_n(~rst), .Q1(data_tmp[11]));
    Asynchronous_D_FF b12(.CLK(clk), .D(data_in[12]), .RST_n(~rst), .Q1(data_tmp[12]));
    Asynchronous_D_FF b13(.CLK(clk), .D(data_in[13]), .RST_n(~rst), .Q1(data_tmp[13]));
    Asynchronous_D_FF b14(.CLK(clk), .D(data_in[14]), .RST_n(~rst), .Q1(data_tmp[14]));
    Asynchronous_D_FF b15(.CLK(clk), .D(data_in[15]), .RST_n(~rst), .Q1(data_tmp[15]));
    Asynchronous_D_FF b16(.CLK(clk), .D(data_in[16]), .RST_n(~rst), .Q1(data_tmp[16]));
    Asynchronous_D_FF b17(.CLK(clk), .D(data_in[17]), .RST_n(~rst), .Q1(data_tmp[17]));
    Asynchronous_D_FF b18(.CLK(clk), .D(data_in[18]), .RST_n(~rst), .Q1(data_tmp[18]));
    Asynchronous_D_FF b19(.CLK(clk), .D(data_in[19]), .RST_n(~rst), .Q1(data_tmp[19]));
    Asynchronous_D_FF b20(.CLK(clk), .D(data_in[20]), .RST_n(~rst), .Q1(data_tmp[20]));
    Asynchronous_D_FF b21(.CLK(clk), .D(data_in[21]), .RST_n(~rst), .Q1(data_tmp[21]));
    Asynchronous_D_FF b22(.CLK(clk), .D(data_in[22]), .RST_n(~rst), .Q1(data_tmp[22]));
    Asynchronous_D_FF b23(.CLK(clk), .D(data_in[23]), .RST_n(~rst), .Q1(data_tmp[23]));
    Asynchronous_D_FF b24(.CLK(clk), .D(data_in[24]), .RST_n(~rst), .Q1(data_tmp[24]));
    Asynchronous_D_FF b25(.CLK(clk), .D(data_in[25]), .RST_n(~rst), .Q1(data_tmp[25]));
    Asynchronous_D_FF b26(.CLK(clk), .D(data_in[26]), .RST_n(~rst), .Q1(data_tmp[26]));
    Asynchronous_D_FF b27(.CLK(clk), .D(data_in[27]), .RST_n(~rst), .Q1(data_tmp[27]));
    Asynchronous_D_FF b28(.CLK(clk), .D(data_in[28]), .RST_n(~rst), .Q1(data_tmp[28]));
    Asynchronous_D_FF b29(.CLK(clk), .D(data_in[29]), .RST_n(~rst), .Q1(data_tmp[29]));
    Asynchronous_D_FF b30(.CLK(clk), .D(data_in[30]), .RST_n(~rst), .Q1(data_tmp[30]));
    Asynchronous_D_FF b31(.CLK(clk), .D(data_in[31]), .RST_n(~rst), .Q1(data_tmp[31]));
    
    always @(*)
       if(rst == 1 && (ena == 1 || ena == 0))
           data_out = 0;
       else if(rst == 0 && ena == 1)
           data_out = data_tmp;
       else if(rst == 0 && ena == 0)
           ;
       else
           data_out = {32{1'bx}};
endmodule
