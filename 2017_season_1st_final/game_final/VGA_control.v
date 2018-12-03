`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/18 21:32:15
// Design Name: 
// Module Name: VGA_control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: VGA���������г�ɨ�裬�����Ӧ���ص�RGB
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module VGA_control
    #(
        parameter H_TOTAL = 1056,
        parameter V_TOTAL = 628
    )
    (
        input CLK,
        input RST,
        output reg [10:0] Hcnt,
        output reg [10:0] Vcnt
    );
    initial
    begin
        Hcnt <= 0;
        Vcnt <= 0;
    end
    wire VGA_CLK;
    Divider#(.mod(2)) get_VGA_CLK(.I_CLK(CLK), .RST(RST), .O_CLK(VGA_CLK));
    
    //---------------��ɨ��---------------
    always @(posedge VGA_CLK or posedge RST)
    begin
        if(RST)
            Hcnt <= 11'd0;
        else
        begin
            if(Hcnt < H_TOTAL - 1)
                Hcnt <= Hcnt + 1;
            else
                Hcnt <= 11'd0;
        end
    end
    //---------------��ɨ��---------------
    always @(posedge VGA_CLK or posedge RST)
    begin
        if(RST)
            Vcnt <= 11'd0;
        else if(Hcnt == H_TOTAL - 1) //�н���
        begin
            if(Vcnt < V_TOTAL - 1)
                Vcnt <= Vcnt + 1;
            else
                Vcnt <= 11'd0;
        end
    end
endmodule