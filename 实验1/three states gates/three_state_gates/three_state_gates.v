`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/26 16:27:00
// Design Name: 
// Module Name: three_state_gates
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


module three_state_gates(iA, iEna, oTri);
    input iA;
    input iEna;
    output oTri;
    assign oTri = (iEna == 1) ? iA : 'bz;
endmodule
