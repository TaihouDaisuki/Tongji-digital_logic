`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/30 12:35:15
// Design Name: 
// Module Name: GAME_control
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


`define N 200
`define M (6 * `N - 1)
module GAME_control(
    //--------SYSTEM_in--------
    input clk,
    input rst,
    //--------PS/2_in--------
    input data_in,
    input clk_in,
    //--------PRESS_in--------
    input time_up,
    input time_down,
    input time_go,
    input time_pause,
    //--------VGA_out--------
    output [3:0] R,
    output [3:0] G,
    output [3:0] B,
    output HS,
    output VS,
    //--------DIG_out--------
    output [7:0] DIG,
    output [7:0] SEG
    );
    //--------PS2用参数--------
    wire [5:0] alph;
    reg [5:0] pre_alph;
    //--------文档用参数--------
    integer i;
    reg [`M:0] text;
    reg [9:0] p;
    //--------随机数用参数--------
    reg [15:0] seed;
    wire [`M:0] ranNum;
    //--------游戏状态机--------
    reg [2:0] Q;
    //--------数码管用参数--------
    reg [26:0] setting_time;
    reg clock_go;
    reg [1:0] time_up_press, time_down_press;
    wire time_up_sync, time_down_sync;
    wire [26:0] last_time;
    
    initial
    begin
        seed <= 'd1;
        
        pre_alph <= 'd0;
        
        Q <= 'd0;
        p <= 0; 
        
        setting_time <= 'd1200; clock_go <= 'd0;
        time_up_press <= 'd0; time_down_press <= 'd0;
    end
    //--------伪随机序列获取--------
    LFSR get_rand(.rst(rst), .clk(clk), .seed(seed), .oNum(ranNum));
    //--------PS2读取数据--------
    PS2_driver get_key(.clk(clk), .rst(~rst), .data_in(data_in), .clk_in(clk_in),
                       .alph(alph));
    //--------VGA输出--------
    VGA_driver output_screen(.CLK(clk), .RST(rst), .text(text), .Q(Q), .cur(p),
                             .R(R), .G(G), .B(B), .HS(HS), .VS(VS));
    //--------数码管倒计时显示--------                
    always @(posedge clk)
    begin
        time_up_press <= {time_up_press[0], time_up};
        time_down_press <= {time_down_press[0], time_down};
    end
    assign time_up_sync = time_up_press[1] & ~time_up_press[0];
    assign time_down_sync = time_down_press[1] & ~time_down_press[0];
    DIG_count_down count_down(.clk(clk), .rst(rst), .setting_change(Q == 'd0),
                   .start_time(setting_time), 
                   .clock_go(clock_go),
                   .SEG(SEG), .DIG(DIG), .last_time(last_time));
     //--------PS2_数码管测试--------
     /*wire [3:0] num0, num1;
     assign num0 = alph % 10;
     assign num1 = alph / 10;
     assign last_time = 1;
     DIG_driver DIG_out(.clk(clk), .rst(~rst),
                        .num0(num0), .num1(num1), .num2(0), .num3(0),
                        .num4(4), .num5(5), .num6(6), .num7(7),
                        .DIG(DIG), .SEG(SEG));*/
    //--------状态机--------
    always @(posedge clk)
    begin
        if(rst == 1)
        begin
            seed <= (text['d413 -:'d16] | 'd407);
            text <= ranNum;
            p <= 0; Q <= 'd0;
            
            clock_go <= 0; pre_alph <= 'd0; 
        end
        else
        begin
            case(Q)
                'd0: // stop
                begin
                    if(time_up_sync == 1 && setting_time <= 'd99999989)
                        setting_time <= setting_time + 10;
                    else if(time_down_sync == 1 && setting_time >= 'd10)
                        setting_time <= setting_time - 10;
                    else if(time_go == 1)
                    begin
                        clock_go <= 1; Q <= 'd1;
                    end
                end 
                'd1: // start
                begin
                    if(time_pause == 1)
                    begin
                        clock_go <= 0; Q <= 'd2;
                    end
                    if(last_time == 'd0)
                        Q <= 'd4;
                    if(alph != pre_alph && alph >= 'd1 && alph <= 'd52) // is_alph
                    begin
                        pre_alph <= alph; 
                        if(alph != text[6 * (p + 1) - 1 -:6])
                            ;//Q <= 'd4;
                        else
                        begin
                            if(p == `N - 1)
                                Q <= 'd3;
                            p <= p + 'd1;
                        end
                    end
                    else if (alph == 'd53 || alph == 'd55) //F0 and lshift
                        pre_alph <= 'd0;
                end
                'd2: // pause
                begin
                    if(time_go == 1)
                    begin
                        clock_go <= 1; Q <= 'd1; pre_alph <= 'd0;
                    end
                end
                'd3: // win
                begin
                    clock_go <= 0;                     
                end
                'd4: // lose
                begin
                    clock_go <= 0;                
                end
            endcase
        end
    end
endmodule
