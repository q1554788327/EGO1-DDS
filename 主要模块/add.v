`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/03 22:24:08
// Design Name: 
// Module Name: add
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

//累加模块，得到ROM地址
module add(
    input signal,      //输入10kHz时钟信号
    input wire [7:0] k,     //输入8位拨动开关
    output reg [7:0] address       //输出ROM地址
    );

    reg [7:0] address = 0;      //ROM地址初值为0

    //当ROM地址小于1111_1111时，进行累加
    always @(posedge signal) begin
        if(!(address >= 8'b1111_1111)) begin
            address <= address + k[7:0];
        end
        else
            address <= 0;
    end
endmodule
