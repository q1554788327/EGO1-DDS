`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/04 10:02:24
// Design Name: 
// Module Name: DA
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

//数模转换模块，输出波形
module DA(
    input [4:0] init,       //输入初始化的端口
    output wire [7:0] spo       //输出波形
    );

    assign init = 5'b10000;

endmodule
