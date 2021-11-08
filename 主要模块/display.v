`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/04 08:57:30
// Design Name: 
// Module Name: display
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


module display_right(
    input [15:0] number,
    input signal,
    output reg[7:0] dis_duan,
    output reg[6:0] dis_wei
    );

    reg [1:0] sel = 0;

    always @(posedge signal) begin
        if (k[sel] == 1) begin
            dis_wei <= 7'b0110000;
        end
        else 
            dis_wei <= 7'b1111110;
        case (sel)
            0: begin
                dis_duan <= 8'b1000_0000;
            end
            1: begin
                dis_duan <= 8'b0100_0000;
            end
            2: begin
                dis_duan <= 8'b0010_0000; 
            end
            3: begin
                dis_duan <= 8'b0001_0000;
            end
            4: begin
                dis_duan <= 8'b0000_1000;
            end
            5: begin
                dis_duan <= 8'b0000_0100;
            end
            6: begin
                dis_duan <= 8'b0000_0010;
            end
            7: begin
                dis_duan <= 8'b0000_0001;
            end            
            default: begin
                dis_duan <= 8'b0000_0000;
            end
        endcase
        sel <= sel + 1;
endmodule
