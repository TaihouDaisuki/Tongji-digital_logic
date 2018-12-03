
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/02 16:34:25
// Design Name: 
// Module Name: Regfiles_tb
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
module Regfiles_tb
    #(
        parameter data_route = "E:/vivado_project/project_8/project_8.srcs/sim_1/new/data.txt"
    );
    reg clk, rst, we;
    reg [4:0] raddr1, raddr2, waddr;
    reg [5:0] i;
    reg [31:0] data_reset[31:0];
    reg [31:0] wdata;
    wire [31:0] rdata1, rdata2;
    
    Regfiles uut(.clk(clk), .rst(rst), .we(we),
                 .raddr1(raddr1), .raddr2(raddr2), .waddr(waddr),
                 .wdata(wdata), .rdata1(rdata1), .rdata2(rdata2));
    
    initial
        $readmemb(data_route, data_reset);
    initial
        clk = 1;
    always #10 clk = ~clk;
    initial
    begin
        rst <= 1; we <= 1;
        #5
        rst <= 0; we <= 0;
        raddr1 <= 5'b10101; raddr2 <= 5'b01010;
        #10
        we = 1;
        for (i = 0; i < 32; i = i + 1)
        begin
            waddr <= i[4:0]; wdata <= data_reset[i[4:0]];
            #20 ;
        end
        
        #27 we <= 0;
        #50 rst <= 1; raddr1 <= 5'b10000; raddr2 <= 5'b00001;
    end
endmodule
