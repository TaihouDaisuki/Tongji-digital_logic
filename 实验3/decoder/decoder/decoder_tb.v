`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/23 08:21:52
// Design Name: 
// Module Name: decoder_tb
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


module decoder_tb;
    reg [1:0] iEna;
    reg [3:0] iData;
    wire [7:0] oData;
    
    decoder uut(
    .iData(iData), .iEna(iEna),
    .oData(oData));
    
    initial
    begin
        iEna = 2'bx1;
        #100 iEna = 2'b0x;
        #100 iEna = 2'b10;
    end
    
    initial
    begin
        iData = 8'b101;
        #50 iData = 2'b110;
        
        #50 iData = 2'b111;
        #50 iData = 2'b011;
        
        #50 iData = 2'b000;
        #50 iData = 2'b001;
        #50 iData = 2'b010;
        #50 iData = 2'b011;
        #50 iData = 2'b100;
        #50 iData = 2'b101;
        #50 iData = 2'b110;
        #50 iData = 2'b111;
    end
    
endmodule
