`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/24 20:06:22
// Design Name: 
// Module Name: LED_control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: ¹Ü¿ØÖÆÆ÷
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DIG_control(
    input clk,
    input rst,
    output reg [2:0] DIG_ID
    );
    initial
    begin
        DIG_ID <= 0;
    end
    always @(posedge clk or negedge rst)
    begin
        if(!rst)
            DIG_ID <= 1'b0;
        else
        begin
            if(DIG_ID == 'd7)
                DIG_ID <= 1'b0;
            else
                DIG_ID <= DIG_ID + 1'b1;
        end
    end
endmodule
