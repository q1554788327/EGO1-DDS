`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/05 09:33:52
// Design Name: 
// Module Name: bin_to_bcd
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

//十进制BCD转换模块，将二进制数转换成十进制BCD码
module bin_to_bcd(
    input signal,
    input [13:0] bin,
    output reg [15:0] bcd
);

localparam S0_IDLE    = 0;
localparam S1_SHIFT   = 1;
localparam S2_ADD     = 2;
localparam S3_FINISH  = 4;

reg [3:0] fsm = S0_IDLE;
reg [3:0] cnt_shift = 0;    
reg [13:0] bin_buf = 0;
reg [15:0] bcd_buf = 0;

always @ (posedge signal) begin
    case(fsm)
        S0_IDLE: begin
            if(signal) begin
                fsm <= S1_SHIFT;
                bin_buf <= bin;
                cnt_shift <= 'h0;
                bcd_buf <= 'h0;
            end
        end
        
        S1_SHIFT: begin
            if(cnt_shift != 14) begin
                cnt_shift <= cnt_shift + 1;
                {bcd_buf, bin_buf} <= {bcd_buf, bin_buf} << 1;
                fsm <= S2_ADD;
            end
            else 
                fsm <= S3_FINISH;
        end
        
        S2_ADD: begin
            if(cnt_shift != 14) begin
                fsm <= S1_SHIFT;
                if(bcd_buf[15:12] > 4)
                    bcd_buf[15:8] <= bcd_buf[15:8] + 'd3;                
                if(bcd_buf[11:8] > 4)
                    bcd_buf[11:8] <= bcd_buf[11:8] + 'd3;
                if(bcd_buf[7:4] > 4)
                    bcd_buf[7:4] <= bcd_buf[7:4] + 'd3;
                if(bcd_buf[3:0] > 4)
                    bcd_buf[3:0] <= bcd_buf[3:0] + 'd3;
            end
            else begin
                fsm <= S3_FINISH;
                bcd <= bcd_buf;
            end
        end
        
        S3_FINISH: begin
            fsm <= S0_IDLE;
            bin_buf <= 'h0;
            cnt_shift <= 'h0;
            bcd_buf <= 'h0;
        end
    endcase
    end
endmodule
