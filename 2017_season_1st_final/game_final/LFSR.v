`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/30 22:50:40
// Design Name: 
// Module Name: LFSR
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


module LFSR(
    input rst,
    input clk,
    input [15:0]seed,
    output reg [1199:0] oNum
    );
    reg [15:0] rand_num;
    wire [15:0] mod_num;
    reg [10:0] p = 'd0;
    
    assign mod_num = (rand_num % 'd52) + 'd1;
    initial
    begin
        rand_num <= seed;
    end
    always @(posedge clk or posedge rst)
    begin
        if(rst == 1)
            rand_num <= seed;
        else
        begin
            rand_num[0] <= rand_num[15] ^ rand_num[13] ^ rand_num[11] ^ rand_num[10];
            rand_num[1] <= rand_num[0];
            rand_num[2] <= rand_num[1];
            rand_num[3] <= rand_num[2];
            rand_num[4] <= rand_num[3];
            rand_num[5] <= rand_num[4];
            rand_num[6] <= rand_num[5];
            rand_num[7] <= rand_num[6];
            rand_num[8] <= rand_num[7];
            rand_num[9] <= rand_num[8];
            rand_num[10] <= rand_num[9];
            rand_num[11] <= rand_num[10];
            rand_num[12] <= rand_num[11];
            rand_num[13] <= rand_num[12];
            rand_num[14] <= rand_num[13];
            rand_num[15] <= rand_num[14];
            
            oNum[6 * p + 5 -: 6] <= mod_num[5:0];// 冒号两端不能同时出现变量 -表示前连续几位， +表示后连续几位
            if(p == 'd199)
                p <= 'd0;
            else
                p <= p + 'd1;
        end
    end
endmodule
