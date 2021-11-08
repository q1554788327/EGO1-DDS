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
    output reg[3:0] dis_duan,
    output reg[6:0] dis_wei,
    output reg[3:0] result
    );

    reg [2:0] sel = 0;
    reg [15:0] data;

    always @(posedge signal) begin
        if(sel == 5) begin
            sel <= 0;
        end
        else if(sel == 0) begin
            data <= number;
            sel <= sel + 1;
        end  
        else begin
           case (sel)
               1: dis_duan <= 4'b0001;
               2: dis_duan <= 4'b0010;
               3: dis_duan <= 4'b0100;
               4: dis_duan <= 4'b1000; 
               default: dis_duan <= 4'b0000;
           endcase
           case (data[3:0])
               0: dis_wei <= 7'b1111110;
               1: dis_wei <= 7'b0110000;
               2: dis_wei <= 7'b1101101;
               3: dis_wei <= 7'b1111001;
               4: dis_wei <= 7'b0110011;
               5: dis_wei <= 7'b1011011;
               6: dis_wei <= 7'b1011111;
               7: dis_wei <= 7'b1110000;
               8: dis_wei <= 7'b1111111; 
               9: dis_wei <= 7'b1111011;
               default: dis_wei <= 7'b00000000;
            
           endcase 
           sel <= sel + 1;
           result <= data[3:0];
           data <= data >> 4;
           
        end
    end
endmodule
