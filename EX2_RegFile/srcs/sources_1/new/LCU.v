`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/07 18:49:37
// Design Name: 
// Module Name: LCU
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


module LCU(
    input clk,rst,
    input deq,enq,
    input [3:0]in,output reg [3:0] out,
    output full, emp,
    input [3:0]rd0,output reg [2:0]ra0,
    output we,reg [2:0]wa,reg [3:0]wd,
    output reg [1:0]curr_state,
    output [2:0]valid
    );
     
    //È¡±ßÑØ
    wire rst_s,enq_s,deq_s;
    wire rst_edge,enq_edge,deq_edge;
    SEDG SEDG_0(.clk(clk),.a(rst),.s(rst_s),.p(rst_edge));
    SEDG SEDG_1(.clk(clk),.a(enq),.s(enq_s),.p(enq_edge));
    SEDG SEDG_2(.clk(clk),.a(deq),.s(deq_s),.p(deq_edge));
    
    reg [3:0]digit;  
    initial curr_state =2'b00;
    initial ra0=3'b000;
    initial wa=3'b000;
    initial wd=4'h0;
    initial digit=4'h0;
    
    
    always @(posedge clk)
    begin
        if(rst_edge)
            curr_state<=2'b00;
        else if(emp)
            curr_state<=2'b00;
        else if(full)
            curr_state<=2'b01;
    end
    
    always@(posedge clk)
    begin
        if(rst_edge)
            begin
                out<=0;
                wd<=0;
                wa<=0;
                digit<=0;
                ra0<=0;
            end
        else
            begin
            case(curr_state)
                2'b00:
                    begin
                    if(enq_edge)
                        begin
                        out<=0;
                        wd<=in;
                        wa<=digit[2:0];
                        digit<=digit+1;
                        ra0<=0;
                        end
                    end
                2'b01:
                    begin
                    if(deq_edge)
                        begin
                        out<=rd0;
                        wd<=0;
                        if(digit==8 || digit==1)
                            wa<=0;
                        else
                            wa<=wa+1;
                        digit<=digit-1;
                        if(digit==1)
                            ra0<=0;
                        else
                            ra0<=ra0+1;
                        end
                    end
                default:;
            endcase
            end
    end
    
    assign we = 1;
    assign full = (digit==4'h8)?1:0;
    assign emp = (digit==4'h0)?1:0;
    assign valid = wa;
endmodule
