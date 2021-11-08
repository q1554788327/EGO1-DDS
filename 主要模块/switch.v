`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/08 14:57:38
// Design Name: 
// Module Name: switch
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

//小拨动开关前四位控制输出的波形
module switch(
    input [7:0] address,
    input [3:0] sw,
    output reg [7:0] spo
    );

    wire [7:0] sin,sawtooth,square,triangle;

    dist_mem_gen_0 d0(
        .a(address),
        .spo(sin)
    );   

    dist_mem_gen_2 d2(
        .a(address),
        .spo(triangle)
    );

    dist_mem_gen_1 d1(
        .a(address),
        .spo(square)
    );

    dist_mem_gen_3 d3(
        .a(address),
        .spo(sawtooth)
    );

    always @(*) begin
        case (sw)
            4'b0001: begin
                spo <= sin;
            end 
            4'b0010: begin
                spo <= sawtooth;
            end
            4'b0100: begin
                spo <= square;
            end
            4'b1000: begin
                spo <= triangle;
            end
            default: spo <= 0;
        endcase
    end
endmodule
