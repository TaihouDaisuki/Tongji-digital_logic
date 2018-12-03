
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/02 14:23:22
// Design Name: 
// Module Name: ram_tb
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
module ram_tb
    #(
        parameter data_route = "E:/vivado_project/project_8/project_8.srcs/sim_1/new/data.txt"
    );
    reg clk, ena, wena;
    reg [4:0] addr;
    reg [5:0] i;
    reg [31:0] data_reset[31:0];
    reg [31:0] data_in;
    wire [31:0] data_out;
    
    ram uut(.clk(clk), .ena(ena), .wena(wena),
            .addr(addr), .data_in(data_in),
            .data_out(data_out));
   
   initial
       $readmemb(data_route, data_reset);
   initial
       clk = 1;
   
   always #10 clk = ~clk;
   initial
   begin
       ena <= 0; wena <= 1;
       #23 ena <= 1;
       for (i = 0; i < 32; i = i + 1)
       begin
           addr <= i[4:0]; data_in <= data_reset[i[4:0]];
           #20 ;
       end
       
       wena <= 0;
       #11 addr = 5'b10101;
       #22 addr = 5'b01011;
       #110 ena = 0;
   end
endmodule
