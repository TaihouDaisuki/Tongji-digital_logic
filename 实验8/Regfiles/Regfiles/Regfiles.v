`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/02 15:38:19
// Design Name: 
// Module Name: Regfiles
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


module Regfiles(
    input clk,
    input rst,
    input we,
    input [4:0] raddr1,
    input [4:0] raddr2,
    input [4:0] waddr,
    input [31:0] wdata,
    output [31:0] rdata1,
    output [31:0] rdata2
    );
    wire [31:0] encode_waddr;
    wire [31:0] temp_data[31:0];
    
    decoder Decoder(.iData(waddr),.iEna(we),.oData(encode_waddr));
    
    pcreg Reg0(.clk(~clk), .rst(rst), .ena(encode_waddr[0]), .data_in(wdata), .data_out(temp_data[0]));
    pcreg Reg1(.clk(~clk), .rst(rst), .ena(encode_waddr[1]), .data_in(wdata), .data_out(temp_data[1]));
    pcreg Reg2(.clk(~clk), .rst(rst), .ena(encode_waddr[2]), .data_in(wdata), .data_out(temp_data[2]));
    pcreg Reg3(.clk(~clk), .rst(rst), .ena(encode_waddr[3]), .data_in(wdata), .data_out(temp_data[3]));
    pcreg Reg4(.clk(~clk), .rst(rst), .ena(encode_waddr[4]), .data_in(wdata), .data_out(temp_data[4]));
    pcreg Reg5(.clk(~clk), .rst(rst), .ena(encode_waddr[5]), .data_in(wdata), .data_out(temp_data[5]));
    pcreg Reg6(.clk(~clk), .rst(rst), .ena(encode_waddr[6]), .data_in(wdata), .data_out(temp_data[6]));
    pcreg Reg7(.clk(~clk), .rst(rst), .ena(encode_waddr[7]), .data_in(wdata), .data_out(temp_data[7]));
    pcreg Reg8(.clk(~clk), .rst(rst), .ena(encode_waddr[8]), .data_in(wdata), .data_out(temp_data[8]));
    pcreg Reg9(.clk(~clk), .rst(rst), .ena(encode_waddr[9]), .data_in(wdata), .data_out(temp_data[9]));
    pcreg Reg10(.clk(~clk), .rst(rst), .ena(encode_waddr[10]), .data_in(wdata), .data_out(temp_data[10]));
    pcreg Reg11(.clk(~clk), .rst(rst), .ena(encode_waddr[11]), .data_in(wdata), .data_out(temp_data[11]));
    pcreg Reg12(.clk(~clk), .rst(rst), .ena(encode_waddr[12]), .data_in(wdata), .data_out(temp_data[12]));
    pcreg Reg13(.clk(~clk), .rst(rst), .ena(encode_waddr[13]), .data_in(wdata), .data_out(temp_data[13]));
    pcreg Reg14(.clk(~clk), .rst(rst), .ena(encode_waddr[14]), .data_in(wdata), .data_out(temp_data[14]));
    pcreg Reg15(.clk(~clk), .rst(rst), .ena(encode_waddr[15]), .data_in(wdata), .data_out(temp_data[15]));
    pcreg Reg16(.clk(~clk), .rst(rst), .ena(encode_waddr[16]), .data_in(wdata), .data_out(temp_data[16]));
    pcreg Reg17(.clk(~clk), .rst(rst), .ena(encode_waddr[17]), .data_in(wdata), .data_out(temp_data[17]));
    pcreg Reg18(.clk(~clk), .rst(rst), .ena(encode_waddr[18]), .data_in(wdata), .data_out(temp_data[18]));
    pcreg Reg19(.clk(~clk), .rst(rst), .ena(encode_waddr[19]), .data_in(wdata), .data_out(temp_data[19]));
    pcreg Reg20(.clk(~clk), .rst(rst), .ena(encode_waddr[20]), .data_in(wdata), .data_out(temp_data[20]));
    pcreg Reg21(.clk(~clk), .rst(rst), .ena(encode_waddr[21]), .data_in(wdata), .data_out(temp_data[21]));
    pcreg Reg22(.clk(~clk), .rst(rst), .ena(encode_waddr[22]), .data_in(wdata), .data_out(temp_data[22]));
    pcreg Reg23(.clk(~clk), .rst(rst), .ena(encode_waddr[23]), .data_in(wdata), .data_out(temp_data[23]));
    pcreg Reg24(.clk(~clk), .rst(rst), .ena(encode_waddr[24]), .data_in(wdata), .data_out(temp_data[24]));
    pcreg Reg25(.clk(~clk), .rst(rst), .ena(encode_waddr[25]), .data_in(wdata), .data_out(temp_data[25]));
    pcreg Reg26(.clk(~clk), .rst(rst), .ena(encode_waddr[26]), .data_in(wdata), .data_out(temp_data[26]));
    pcreg Reg27(.clk(~clk), .rst(rst), .ena(encode_waddr[27]), .data_in(wdata), .data_out(temp_data[27]));
    pcreg Reg28(.clk(~clk), .rst(rst), .ena(encode_waddr[28]), .data_in(wdata), .data_out(temp_data[28]));
    pcreg Reg29(.clk(~clk), .rst(rst), .ena(encode_waddr[29]), .data_in(wdata), .data_out(temp_data[29]));
    pcreg Reg30(.clk(~clk), .rst(rst), .ena(encode_waddr[30]), .data_in(wdata), .data_out(temp_data[30]));
    pcreg Reg31(.clk(~clk), .rst(rst), .ena(encode_waddr[31]), .data_in(wdata), .data_out(temp_data[31]));
    
    selector Rdata1(.iC0(temp_data[0]), .iC1(temp_data[1]), .iC2(temp_data[2]), .iC3(temp_data[3]), 
                    .iC4(temp_data[4]), .iC5(temp_data[5]), .iC6(temp_data[6]), .iC7(temp_data[7]),
                    .iC8(temp_data[8]), .iC9(temp_data[9]), .iC10(temp_data[10]), .iC11(temp_data[11]),
                    .iC12(temp_data[12]), .iC13(temp_data[13]), .iC14(temp_data[14]), .iC15(temp_data[15]),
                    .iC16(temp_data[16]), .iC17(temp_data[17]), .iC18(temp_data[18]), .iC19(temp_data[19]),
                    .iC20(temp_data[20]), .iC21(temp_data[21]), .iC22(temp_data[22]), .iC23(temp_data[23]),
                    .iC24(temp_data[24]), .iC25(temp_data[25]), .iC26(temp_data[26]), .iC27(temp_data[27]),
                    .iC28(temp_data[28]), .iC29(temp_data[29]), .iC30(temp_data[30]), .iC31(temp_data[31]),
                    .iS(raddr1), .iEna(~we), .oZ(rdata1));
    selector Rdata2(.iC0(temp_data[0]), .iC1(temp_data[1]), .iC2(temp_data[2]), .iC3(temp_data[3]), 
                    .iC4(temp_data[4]), .iC5(temp_data[5]), .iC6(temp_data[6]), .iC7(temp_data[7]),
                    .iC8(temp_data[8]), .iC9(temp_data[9]), .iC10(temp_data[10]), .iC11(temp_data[11]),
                    .iC12(temp_data[12]), .iC13(temp_data[13]), .iC14(temp_data[14]), .iC15(temp_data[15]),
                    .iC16(temp_data[16]), .iC17(temp_data[17]), .iC18(temp_data[18]), .iC19(temp_data[19]),
                    .iC20(temp_data[20]), .iC21(temp_data[21]), .iC22(temp_data[22]), .iC23(temp_data[23]),
                    .iC24(temp_data[24]), .iC25(temp_data[25]), .iC26(temp_data[26]), .iC27(temp_data[27]),
                    .iC28(temp_data[28]), .iC29(temp_data[29]), .iC30(temp_data[30]), .iC31(temp_data[31]),
                    .iS(raddr2), .iEna(~we), .oZ(rdata2));
endmodule
