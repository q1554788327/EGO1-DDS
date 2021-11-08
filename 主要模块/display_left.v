`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/05 16:45:02
// Design Name: 
// Module Name: display_left
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

//控制左边4个七段数码管显示实际测频出来的频率值
module display_left(
    input [15:0] number_1,
    input signal,
    // input signal_1,
    // input [7:0] address,
    output reg[3:0] dis_duan_1,
    output reg[6:0] dis_wei_1
    // output wire [15:0] bcd
    );

    //控制段选信号
    reg [2:0] sel = 0;
    //接受bin_to_bcd转换后的bcd码
    reg [15:0] data;

    //控制左端四个数码管显示测频值
    always @(posedge signal) begin
        if(sel == 5) begin
            sel <= 0;
        end
        else if(sel == 0) begin
            data <= number_1;
            sel <= sel + 1;
        end  
        else begin
           case (sel)
               1: dis_duan_1 <= 4'b0001;
               2: dis_duan_1 <= 4'b0010;
               3: dis_duan_1 <= 4'b0100;
               4: dis_duan_1 <= 4'b1000; 
               default: dis_duan_1 <= 4'b0000;
           endcase
           case (data[3:0])
               0: dis_wei_1 <= 7'b1111110;
               1: dis_wei_1 <= 7'b0110000;
               2: dis_wei_1 <= 7'b1101101;
               3: dis_wei_1 <= 7'b1111001;
               4: dis_wei_1 <= 7'b0110011;
               5: dis_wei_1 <= 7'b1011011;
               6: dis_wei_1 <= 7'b1011111;
               7: dis_wei_1 <= 7'b1110000;
               8: dis_wei_1 <= 7'b1111111; 
               9: dis_wei_1 <= 7'b1111011;
               default: dis_wei_1 <= 7'b00000000;
            
           endcase 
           sel <= sel + 1;
           data <= data >> 4;
           
        end
    end
endmodule
