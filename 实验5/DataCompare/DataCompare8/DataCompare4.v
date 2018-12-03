`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/06 08:22:45
// Design Name: 
// Module Name: DataCompare4
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


module DataCompare4(
    input [3:0] iData_a,
    input [3:0] iData_b,
    input [2:0] iData,
    output reg [2:0] oData
    );
    
    always @(*)
        case ({iData_a[3], iData_b[3]})
            2'b10: oData = 3'b100;
            2'b01: oData = 3'b010;
            2'b00, 2'b11:
                case({iData_a[2], iData_b[2]})
                    2'b10: oData = 3'b100;
                    2'b01: oData = 3'b010;
                    2'b00, 2'b11:
                        case({iData_a[1], iData_b[1]})
                            2'b10: oData = 3'b100;
                            2'b01: oData = 3'b010;
                            2'b00, 2'b11:
                                case({iData_a[0], iData_b[0]})
                                    2'b10: oData = 3'b100;
                                    2'b01: oData = 3'b010;
                                    2'b00, 2'b11:
                                        oData = iData;
                                    default: oData = 3'bxxx;
                                endcase
                            default: oData = 3'bxxx;
                        endcase
                    default: oData = 3'bxxx;
                endcase
            default: oData = 3'bxxx;
        endcase
endmodule
