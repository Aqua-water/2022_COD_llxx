`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/16 20:19:37
// Design Name: 
// Module Name: FSM
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

//有限状态机

module FSM
    #(parameter MSB = 6)
    (
    input en,
    input rst,
    input clk,
    input [MSB:0]d,
    input [MSB:0]y,
    output reg [MSB:0]ra,rb
    );
    
//    //对按钮en取边沿
//    reg en_r1,en_r2;
//    wire en_edge;
//    always@(posedge clk)
//        en_r1 <= en;
//    always@(posedge clk)
//        en_r2 <= en_r1;
//    assign en_edge = en_r1 & (~en_r2);
    
//    //定义当前状态与后续状态
//    reg [1:0]curr_state=2'b00,next_state;
    
//    //FSM part 1
//    always @(*)
//    begin
//    if(rst==1)
//        next_state=2'b00;
//    else if(curr_state!=2'b10)
//        next_state=curr_state+1;
//    else
//        next_state=2'b00;
//    end
    
//    //FSM part 2
//    always@(posedge clk)
//    if(en_edge==1)
//        curr_state<=next_state;
        
//    //FSM part 3
//    always@(posedge clk)
//    begin
//    if(en_edge==1)
//        begin
//        case(curr_state)
//            2'b00:
//                begin
//                ra<=d;
//                rb<=0;
//                end
//            2'b01:
//                begin
//                ra<=0;
//                rb<=d;
//                end
//            2'b10:
//                begin
//                ra<=ra_temp;
//                rb<=y;
//                ra_temp<=y;
//                end
//            default:
//                begin
//                ra_temp<=d;
//                ra<=d;
//                rb<=y;
//                end
//        endcase
//        end
//    end
    
endmodule
