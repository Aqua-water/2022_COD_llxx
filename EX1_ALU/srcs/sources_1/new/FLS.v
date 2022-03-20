`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/16 20:37:53
// Design Name: 
// Module Name: FLS
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


module FLS
    #(parameter MSB = 6)
    (
    input en,
    input rst,
    input clk,
    input [MSB:0]d,
    output reg [MSB:0]f
    );

    reg [MSB:0]ra,rb;
    wire [MSB:0] ry;
    wire rz;
    
    
    //对按钮en取边沿
    reg en_r1,en_r2;
    wire en_edge;
    always@(posedge clk)
        en_r1 <= en;
    always@(posedge clk)
        en_r2 <= en_r1;
    assign en_edge = en_r1 & (~en_r2);
    
    //定义当前状态与后续状态
    reg [1:0]curr_state=2'b00,next_state;
    
    //FSM part 1
    always @(*)
    begin
    if(curr_state!=2'b10)
        next_state=curr_state+1;
    else
        next_state=2'b10;
    end
    
    //FSM part 2
    always@(posedge clk)
    begin
    if(rst==1)
        curr_state<=2'b00;
    else if(en_edge==1)
        curr_state<=next_state;
    else;
    end
        
    //FSM part 3
    always@(posedge clk)
    begin
    if(en_edge==1)
        begin
        case(curr_state)
            2'b00:
                begin
                ra<=d;
                rb<=0;
                f<=d;
                end
            2'b01:
                begin
                ra<=ra;
                rb<=d;
                f<=d;
                end
            2'b10:
                begin
                ra<=rb;
                rb<=ry;
                f<=ry;
                end  
            default:
                begin
                ra<=d;
                rb<=0;
                f<=d;
                end
        endcase
        end
    end
    //FSM FSM_0(.en(en),.rst(rst),.clk(clk),.d(d),.y(ry),.ra(ra),.rb(rb));//状态机
    ALU_module #(.MSB(6)) ALU_module_0(.a(ra),.b(rb),.f(3'b000),.y(ry),.z(rz));//ALU

endmodule
