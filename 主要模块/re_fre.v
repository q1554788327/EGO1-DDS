`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/06 18:14:38
// Design Name: 
// Module Name: re_fre
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

//实际测频模块测量并在左端4个数码管显示测量的频率值
module re_fre(
    input signal,   //提供10kHz时钟信号
    input signal_1,     //提供0.5Hz时钟信号
    input [7:0] address,    //提供ROM地址
    output wire [15:0] bcd,     //输出测量的十进制BCD码
    output wire [7:0] dis_duan_1,   //左端数码管位选信号
    output wire [6:0] dis_wei_1     //左端数码管段选信号
    );

    reg [13:0] count = 0;      //中间变量计数
    reg [13:0] real_fre;    //最后的实际测频结果

    //当ROM地址最高位由1变为0时，表示完成一个周期
    always @(negedge address[7]) begin
        //当0.5Hz时钟信号是高电平时，开始计数
        if(signal_1 == 1) begin
            count <= count + 1;
        end
        //当0.5Hz是低电平时，表示计数停止，count清零
        else begin
            count <= 0;
        end
    end

    //当0.5Hz时钟信号下降沿来的时候，将技术结果赋给最后的测频结果
    always @(negedge signal_1) begin
        real_fre <= count;
    end

    //调用bin_to_bcd模块，将测频结果转换成十进制BCD码
    bin_to_bcd b1(
        .signal(signal),
        .bcd(bcd),
        .bin(real_fre)
    );

    //调用显示模块，将测频结果显示在数码管上
    display_left d1(
        .signal(signal),
        .dis_duan_1(dis_duan_1),
        .dis_wei_1(dis_wei_1),
        .number_1(bcd)
    );

endmodule