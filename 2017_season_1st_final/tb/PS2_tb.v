`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/26 16:36:30
// Design Name: 
// Module Name: PS2_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: PS2 testbench
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PS2_tb;
    /* parameter */
    parameter [31:0] clock_period = 10;
    
    //--------ps2_keyboard interface signals--------
    reg clk;
    wire kbd_clk, kbd_data; 
    wire [7:0] DIG, SEG; 
    wire [7:0]ps2_data;
    wire [2:0] oQ;
    reg [1199:0] text;
    initial
    begin
        text[5:0] <= 'd1;
        text[11:6] <= 'd2; 
    end
    GAME_control uut(.rst(0), .itext(text), .clk(clk), .data_in(kbd_data), .clk_in(bkd_clk),
                     .time_go('d1), .oQ(oQ));
    PS2_keyboard_model model(.ps2_clk(kbd_clk), .ps2_data(kbd_data));
    //--------clock driver--------
    initial 
    begin
        clk = 0;
        forever #(clock_period/2) clk = ~clk;
    end
    
    initial 
    begin
        #40
        model.kbd_sendcode(8'h1C); // press 'A'
        model.kbd_sendcode(8'hF0); // break code
        model.kbd_sendcode(8'h1C); // release 'A'
        
        model.kbd_sendcode(8'h1B); // press 'S'
        #20 model.kbd_sendcode(8'h1B); // keep pressing 'S'
        #20 model.kbd_sendcode(8'h1B); // keep pressing 'S'
        model.kbd_sendcode(8'hF0); // break code
        model.kbd_sendcode(8'h1B); // release 'S'
        #20;
        $stop;
    end
endmodule
