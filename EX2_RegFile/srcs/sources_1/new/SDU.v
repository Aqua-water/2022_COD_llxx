`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/07 16:37:59
// Design Name: 
// Module Name: SDU
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


module SDU(
    input clk,
    input [1:0]curr_state,
    input [2:0]valid,
    input [3:0]rd1,
    output [2:0] ra1,
    output reg [2:0] an,
    output [3:0] seg
    );
    
    //时分复用显示数码管
    reg [20:0]cnt;
    wire pulse_100hz;
    
    initial cnt=0;
    initial an=3'b000;
    
    always@(posedge clk)
    begin
        if(cnt>=1000000)
            cnt <= 21'h0;
        else
            cnt <= cnt + 21'h1;
    end
    
    assign pulse_100hz = (cnt==0);
    
    always@(posedge clk)
    begin
        if(pulse_100hz)
        begin
            if(curr_state==2'b00 || valid==7)
                begin
                if(an>=valid)
                    an <= 3'b000;
                else
                    an <= an+3'b001;
                end
            else if(curr_state==2'b01)
                begin
                if(an>=7)
                    an <= valid + 1;
                else
                    an <= an+3'b001;
                end
        end
    end
    
    assign ra1=an;
    assign seg=rd1;
endmodule
