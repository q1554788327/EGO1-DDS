`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/04 09:44:55
// Design Name: 
// Module Name: top
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

//顶层模块
module top(
    input clk,      //100MHz时钟信号输入端
    input [7:0] k,      //8位拨动开关输入端
    input [3:0] sw,     //8位小拨动开关
    input [4:0] init,      //初始化DA芯片
    output [7:0] spo,       //输出的波形
    output wire [3:0] dis_duan,     //右端4位段选信号
    output wire [6:0] dis_wei,      //右端4位位选信号
    output wire [3:0] dis_duan_1,       //左端4位段选信号
    output wire [6:0] dis_wei_1     //左端4位位选信号
    );
    
    wire signal;        //10kHz时钟信号
    wire signal_1;      //0.5Hz时钟信号
    wire [7:0] address;     //ROM地址
    wire [15:0] bcd;        //理论值的十进制BCD码
    wire [15:0] bcd_1;      //实际值的十进制BCD码

    //顶层调用产生10kHz时钟信号模块
    clock c0(
        .clk(clk),
        .signal(signal)
    );

    //顶层调用产生0.5Hz时钟信号模块
    clock_1 c1(
        .clk(clk),
        .signal_1(signal_1)
    );

    //顶层调用累加模块
    add a0(
        .signal(signal),
        .k(k),
        .address(address)
    );

    //顶层调用开关选择波形
    switch s0(
        .address(adress),
        .spo(spo),
        .sw(sw)
    );

    //顶层调用数模转换模块
    DA D0(
        .init(init),
        .spo(spo)
    );

    //顶层调用理论频率模块
    th_fre t0(
        .signal(signal),
        .k(k),
        .bcd(bcd),
        .dis_duan(dis_duan),
        .dis_wei(dis_wei)
    );

    //顶层调用实际频率模块
    re_fre r0(
        .signal(signal),
        .signal_1(signal_1),
        .address(address),
        .bcd(bcd_1),
        .dis_duan_1(dis_duan_1),
        .dis_wei_1(dis_wei_1)
    );

endmodule
