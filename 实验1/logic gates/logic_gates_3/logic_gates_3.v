`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/26 16:15:57
// Design Name: 
// Module Name: logic_gates_3
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


module logic_gates_3(iA, iB, oAnd, oOr, oNot);
    input iA, iB;
    output oAnd, oOr, oNot;
    reg oAnd, oOr, oNot;
    always @(*)
    begin
        oAnd = iA & iB;
        oOr = iA | iB;
        oNot = ~iA;
    end
endmodule
