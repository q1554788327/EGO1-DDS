`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/03 21:36:05
// Design Name: 
// Module Name: clock_1
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

//产生0.5Hz的输出信号
module clock_1(
    input clk,      //输入100MHz时钟信号
    output reg signal_1     //输出0.5Hz时钟信号
    );

    wire signal;    //接受10kHz的时钟信号

    //先产生10kHz时钟信号
    clock u0(
        .clk(clk),
        .signal(signal)
    );

    reg [19:0] cnt = 0;
    reg flag = 0;
    reg signal_1 = 0;

    parameter div = 10000;

    //分频
    always @(posedge signal) begin
        cnt <= cnt + 1;
        if(cnt == div) begin
            cnt <= 0;
            if(flag == 0)
                signal_1 <= 1'b1;
            else 
                signal_1 <= 1'b0;
            flag <= !flag;
        end
    end
    
endmodule
