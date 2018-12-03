`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/25 10:24:45
// Design Name: 
// Module Name: DIG_count_down
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 在七段数码管上输出倒计时
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DIG_count_down(
    input wire [26:0] start_time,
    input rst,
    input setting_change,
    input clk,
    input clock_go,
    output [7:0] SEG,
    output [7:0] DIG,
    output [29:0] last_time
    );
    reg [26:0] count_time;
    initial
    begin
        count_time <= start_time;
    end
    assign last_time = count_time;
    
    wire [3:0] num[7:0];
    assign num[0] = count_time % 'd10;
    assign num[1] = count_time / 'd10 % 'd10;
    assign num[2] = count_time / 'd100 % 'd10;
    assign num[3] = count_time / 'd1000 % 'd10;
    assign num[4] = count_time / 'd10000 % 'd10;
    assign num[5] = count_time / 'd100000 % 'd10;
    assign num[6] = count_time / 'd1000000 % 'd10;
    assign num[7] = count_time / 'd10000000;
    wire CLK_count;
    Divider #(10000000) per_sec(.I_CLK(clk), .RST(rst), .O_CLK(CLK_count));
    DIG_driver show_dig(.rst(~rst), .clk(clk),
                        .num0(num[0]), .num1(num[1]), .num2(num[2]), .num3(num[3]),
                        .num4(num[4]), .num5(num[5]), .num6(num[6]), .num7(num[7]),
                        .SEG(SEG), .DIG(DIG));
    always @(posedge CLK_count or posedge rst)
    begin
        if(rst == 1 || setting_change == 1)
            count_time <= start_time;
        else if(clock_go == 1 && count_time != 0)
            count_time <= count_time - 1;
    end
endmodule
