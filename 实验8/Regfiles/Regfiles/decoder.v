`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/23 08:21:32
// Design Name: 
// Module Name: decoder
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


module decoder(
    input [4:0] iData,
    input iEna,
    output reg [31:0] oData
    );
    
    always @(*)
    begin
        oData = {32{1'b0}};
        if(iEna == 1)
            oData[iData] = 1'b1;
    end
endmodule
