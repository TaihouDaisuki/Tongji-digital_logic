`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/18 19:35:31
// Design Name: 
// Module Name: Divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: ż������Ƶ��
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Divider
    #(
        parameter mod = 32'd20
    )
    (
        input I_CLK,
        input RST,
        output reg O_CLK
    );
    localparam T = mod / 2;
    reg [31:0] counter = 0;
    initial
    begin
        O_CLK <= 0;
    end
    always @(posedge I_CLK)
    begin
        if(RST == 1)
        begin
            counter <= 0;
            O_CLK <= 0;
        end
        else
        begin
            if(counter == T)
            begin
                counter <= 1; //���жϣ�������Ӧ������1������
                O_CLK <= ~O_CLK;
            end
            else
                counter <= counter + 1;
        end
    end
endmodule
