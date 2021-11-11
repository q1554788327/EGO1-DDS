`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/09 09:33:25
// Design Name: 
// Module Name: sium
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


module sium;
    reg clk;
    wire [7:0] spo;
    wire [7:0] k = 8'b0000_0001;
    wire [3:0] sw = 4'b1000;
	wire [3:0] init;
    wire [3:0] dis_duan;
    wire [6:0] dis_wei;
    wire [3:0] dis_duan_1;
    wire [6:0] dis_wei_1;

    top t0(
        .clk(clk),
        .k(k),
        .sw(sw),
        .init(init),
        .spo(spo),
        .dis_duan(dis_duan),
        .dis_wei(dis_wei),
        .dis_duan_1(dis_duan_1),
        .dis_wei_1(dis_wei_1)
    );

    parameter period_clk = 10;

    always begin
        clk = 1'b0;
        #(period_clk/2) clk = 1'b1;
        #(period_clk/2);
    end

endmodule
