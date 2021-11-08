`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/03 10:09:57
// Design Name: 
// Module Name: clock
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

//产生10KHz的输出信号
module clock(
    input clk,      //输入100MHz时钟信号
    output reg signal       //输出10kHz时钟信号
    );

    reg [19:0] cnt = 0;     //中间变量计数
    reg flag = 0;       //信号反转标志
    reg signal = 0;     //初始信号从低电平开始     

    parameter div = 5000;

    //分频，最终分出来的频率为100MHz/(div*2)
    always @(posedge clk) begin
        cnt <= cnt + 1;
        //当计数cnt达到div时，信号发生反转，同时计数cnt清零
        if(cnt == div) begin
            cnt <= 0;
            if(flag == 0)
                signal <= 1'b1;
            else 
                signal <= 1'b0;
            flag <= !flag;
        end
    end
endmodule
