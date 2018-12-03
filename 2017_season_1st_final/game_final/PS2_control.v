`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/24 17:05:24
// Design Name: 
// Module Name: PS2_control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: PS2控制器
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PS2_control(
    input clk,
    input rst,
    input data_in,
    input clk_in,
    output reg [15:0] ps2_data
    /*
    output oready,
    output [4:0] oQ, //Test_Port
    output [9:0] obuffer
    */
    );
    reg [4:0] Q; //有限状态机
    reg [9:0] buffer;
    reg [2:0] ps2_clk_sync; 
    reg [15:0] pre_ps2_data;
    reg ready;
    wire clk_in_neg;//clk_in下降沿检测
    
    //assign oready = ready; assign oQ = Q; assign obuffer = buffer;
    
    initial
    begin
        ps2_data <= 0; Q <= 0;
        ps2_clk_sync <= 0; ready <= 0;
    end
    //--------clk_in下降沿检测--------
    always @(posedge clk or negedge rst)
    begin
        if(rst == 0)
            ps2_clk_sync <= 0;
        else
        ps2_clk_sync <= {ps2_clk_sync[1:0], clk_in};
    end
    assign clk_in_neg = ps2_clk_sync[2] & ~ps2_clk_sync[1];
    //--------ps2键值获取--------
    always @(posedge clk)
    begin
        if(rst == 0)
        begin
            buffer <= 'd0; Q <= 'd0; ps2_data <= 8'b0;
        end
        else if(clk_in_neg == 1)
        begin
            case(Q)
                'd0, 'd1, 'd2, 'd3, 'd4, 'd5, 'd6, 'd7, 'd8, 'd9: //读前10位
                begin
                    buffer[Q] <= data_in;
                    Q <= Q + 1;
                end
                'd10: //读第11位的的同时判断，否则有一个周期的延时
                begin
                    if((buffer[0] == 0) //start bit
                        && (data_in == 1) // stop bit
                        && (^buffer[9:1])) // odd parity
                    begin
                        pre_ps2_data[7:0] <= buffer[8:1]; //后八位清零啊！！
                        if(buffer[8:1] != 8'hF0)
                            ready <= 1;
                    end
                    if(buffer[8:1] == 8'hF0)
                        Q <= Q + 1;
                    else
                        Q <= 0;
                end
                'd11, 'd12, 'd13, 'd14, 'd15, 'd16, 'd17, 'd18, 'd19, 'd20: //断码过滤后11位
                begin
                    buffer [Q - 'd11] <= data_in;
                    Q <= Q + 1;
                end
                'd21:
                begin
                    if((buffer[0] == 0) //start bit
                        && (data_in == 1) // stop bit
                        && (^buffer[9:1])) // odd parity
                    begin
                        ps2_data[15:8] <= buffer[8:1];
                        ready <= 1;
                    end
                    Q <= 0;
                end
            endcase 
        end
        if(ready == 1)
        begin
            ps2_data <= pre_ps2_data;
            ready <= 0;
        end
    end
endmodule
