`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/04 17:21:40
// Design Name: 
// Module Name: th_fre
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

//理论测频模块，计算频率理论值并在右端4个数码管显示理论值
module th_fre(
    input signal,   //提供10kHz时钟信号
    input wire [7:0] k,     //8位可拨动开关的输入值
    output wire [15:0] bcd,     //输出理论值的十进制BCD码
    output wire [7:0] dis_duan,     //输出右端数码管的段选信号
    output wire [6:0] dis_wei      //输出右端数码管的位选信号
    );

    reg [13:0] bin;     //储存理论值的二进制数

    //当10kHz时钟信号上升沿来的时候，开始计算理论值
    always @(posedge signal) begin
        bin <= k*10000/256;
    end
    
    //将理论值转换成十进制BCD码
    bin_to_bcd b0(
        .signal(signal),
        .bin(bin),
        .bcd(bcd)
    );

    //右端显示理论值
    display_right d0(
        .signal(signal),
        .dis_duan(dis_duan),
        .dis_wei(dis_wei),
        .number(bcd)
    );
    
endmodule
