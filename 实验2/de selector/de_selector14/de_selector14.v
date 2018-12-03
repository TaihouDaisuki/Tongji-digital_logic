`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/17 18:39:29
// Design Name: 
// Module Name: de_selector14
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


module de_selector14(
    input iC,
    input iS1,
    input iS0,
    output reg oZ0,
    output reg oZ1,
    output reg oZ2,
    output reg oZ3
    );
    
    always @(iC or iS1 or iS0)
    begin
        oZ0 <= 1; oZ1 <= 1; oZ2 <= 1; oZ3 <= 1;
        case({iS1, iS0})
            2'b00 : oZ0 <= iC;
            2'b01 : oZ1 <= iC;
            2'b10 : oZ2 <= iC;
            2'b11 : oZ3 <= iC;
            default : begin oZ0 <= 1'bx; oZ1 <= 1'bx; oZ2 <= 1'bx; oZ3 <= 1'bx; end
        endcase
    end
endmodule
