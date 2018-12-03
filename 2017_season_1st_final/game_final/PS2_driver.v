`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/24 16:12:19
// Design Name: 
// Module Name: PS2_driver
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: PS2驱动，根据键盘信号输出对应字符编号
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PS2_driver(
    //--------系统信号--------
    input clk,
    input rst,
    //--------PS/2信号--------
    input data_in,
    input clk_in,
    output reg [5:0] alph
    );
    wire [15:0] ps2_data;
    reg [4:0] press_shift;
    initial
    begin
        alph <= 'd54; press_shift <= 5'b00000;
    end
    PS2_control PS2(.clk(clk), .rst(rst),
                    .data_in(data_in), .clk_in(clk_in),
                    .ps2_data(ps2_data));
    always @(ps2_data or rst)
    begin
        if(rst == 0)
        begin
            alph <= 'd54; press_shift <= 5'b00000;
        end
        else
        begin
            case(ps2_data[7:0])
                8'h12: // l_shift
                begin
                    press_shift <= 'b11111; alph <= 'd55;
                end
                8'h1c: alph <= ('d26 & ~press_shift) + 'd1;  //A
                8'h32: alph <= ('d26 & ~press_shift) + 'd2;  //B
                8'h21: alph <= ('d26 & ~press_shift) + 'd3;  //C
                8'h23: alph <= ('d26 & ~press_shift) + 'd4;  //D
                8'h24: alph <= ('d26 & ~press_shift) + 'd5;  //E
                8'h2b: alph <= ('d26 & ~press_shift) + 'd6;  //F
                8'h34: alph <= ('d26 & ~press_shift) + 'd7;  //G
                8'h33: alph <= ('d26 & ~press_shift) + 'd8;  //H
                8'h43: alph <= ('d26 & ~press_shift) + 'd9;  //I
                8'h3b: alph <= ('d26 & ~press_shift) + 'd10;  //J
                8'h42: alph <= ('d26 & ~press_shift) + 'd11; //K
                8'h4b: alph <= ('d26 & ~press_shift) + 'd12; //L
                8'h3a: alph <= ('d26 & ~press_shift) + 'd13; //M
                8'h31: alph <= ('d26 & ~press_shift) + 'd14; //N
                8'h44: alph <= ('d26 & ~press_shift) + 'd15; //O
                8'h4d: alph <= ('d26 & ~press_shift) + 'd16; //P
                8'h15: alph <= ('d26 & ~press_shift) + 'd17; //Q
                8'h2d: alph <= ('d26 & ~press_shift) + 'd18; //R
                8'h1b: alph <= ('d26 & ~press_shift) + 'd19; //S
                8'h2c: alph <= ('d26 & ~press_shift) + 'd20; //T
                8'h3c: alph <= ('d26 & ~press_shift) + 'd21; //U
                8'h2a: alph <= ('d26 & ~press_shift) + 'd22; //V
                8'h1d: alph <= ('d26 & ~press_shift) + 'd23; //W
                8'h22: alph <= ('d26 & ~press_shift) + 'd24; //X
                8'h35: alph <= ('d26 & ~press_shift) + 'd25; //Y
                8'h1a: alph <= ('d26 & ~press_shift) + 'd26; //Z
                8'hF0: 
                begin
                    if(ps2_data[15:8] == 8'h12)
                        press_shift <= 5'b0000;
                    alph <= 'd53; //F0
                end
                default: ;      //others
            endcase
        end
    end
endmodule
