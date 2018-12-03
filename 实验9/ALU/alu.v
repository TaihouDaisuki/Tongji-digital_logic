`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/04 08:13:03
// Design Name: 
// Module Name: alu
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


module alu(
    input [31:0] a,
    input [31:0] b,
    input [3:0] aluc,
    output reg [31:0] r,
    output reg zero,
    output reg carry,
    output reg negative,
    output reg overflow
    );

    reg [32 : 0] temp;
    reg signed [31:0] temp_b;
    always @(*)
        casex (aluc)
            4'b0000:    //a+b unsigned
            begin
                r = a + b;
                temp = {1'b0, a} + {1'b0, b};
                zero = (r == 0) ? 1 : 0;
                carry = temp[32];
                negative = r[31];
                overflow = 0;
            end
            
            4'b0010:    //a+b signed
            begin
                r = a + b;
                zero = (r == 0) ? 1 : 0;
                carry = 0;
                negative = r[31];
                overflow = ((a[31] == b[31]) && (r[31] != a[31])) ? 1 : 0;
            end
            
            4'b0001:    //a-b unsigned
            begin
                r = a - b;
                zero = (r == 0) ? 1 : 0;
                carry = (a < b) ? 1 : 0;
                negative = r[31];
                overflow = 0;
            end
            
            4'b0011:    //a-b signed
            begin
                r = a - b;
                zero = (r == 0) ? 1 : 0;
                carry = 0;
                negative = r[31];
                overflow = ((a[31] != b[31]) && (r[31] != a[31])) ? 1 : 0;
            end
            
            4'b0100:    //a&b
            begin
                r = a & b;
                zero = (r == 0) ? 1 : 0; 
                carry = 0;
                negative = r[31];
                overflow = 0;
            end
            
            4'b0101:    //a|b
            begin
                r = a | b;
                zero = (r == 0) ? 1 : 0; 
                carry = 0;
                negative = r[31];
                overflow = 0;
            end
            
            4'b0110:    //a^b
            begin
                r = a ^ b;
                zero = (r == 0) ? 1 : 0; 
                carry = 0;
                negative = r[31];
                overflow = 0;
            end
            
            4'b0111:    //~(a|b)
            begin
                r = ~(a | b);
                zero = (r == 0) ? 1 : 0; 
                carry = 0;
                negative = r[31];
                overflow = 0;
            end
            
            4'b100x:    //{b[15:0, 16'b0]}
            begin
                r = {b[15:0], 16'b0};
                zero = (r == 0) ? 1 : 0; 
                carry = 0;
                negative = r[31];
                overflow = 0;
            end
            
            4'b1011:    //a<b signed
            begin
                r = a - b;
                zero = (r == 0) ? 1 : 0;
                carry = 0;
                negative = r[31];
                overflow = ((a[31] != b[31]) && (r[31] != a[31])) ? 1 : 0;
                r = (overflow == 1 || (r[31] == 1)) ? 1 : 0;
            end
            
            4'b1010:    //a<b unsigned
            begin
                r = a - b;
                zero = (r == 0) ? 1 : 0;
                carry = (a < b) ? 1 : 0;
                negative = r[31];
                overflow = 0;
                r = carry;
            end
            
            4'b1100:    //b>>>a algo
            begin
                temp_b = b;
                r = temp_b >>> a;
                zero = (r == 0) ? 1 : 0;
                carry = (a >= 32) ? b[31] : b[a];
                negative = r[31];
                overflow = 0;
            end
            
            4'b111x:    //b<<a
            begin
                r = b << a;
                zero = (r == 0) ? 1 : 0;
                carry = (a >= 32) ? 0 : b[31-a];
                negative = r[31];
                overflow = 0;
            end
            
            4'b1101:    //b>>a logi
            begin
                r = b >> a;
                zero = (r == 0) ? 1 : 0;
                carry = (a >= 32) ? 0 : b[a];
                negative = r[31];
                overflow = 0;
            end
            
            default:
            begin
                r = 1'bz; zero = 1'bz; carry = 1'bz; negative = 1'bz; overflow = 1'bz;
            end
        endcase
endmodule