`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/06 22:09:25
// Design Name: 
// Module Name: FIFO_s
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


module FIFO_s();
    reg clk,rst;
    reg deq, enq;
    reg [3:0]in;
    wire [3:0]out;
    wire full, emp;
    wire [2:0] an;
    wire [3:0] seg;
    FIFO FIFIO_0(.clk(clk),.rst(rst),.deq(deq),.enq(enq),.in(in),.out(out),.full(full),.emp(emp),.an(an),.seg(seg));
    initial
    begin
        clk=1;
        repeat (1000)
        #1 clk=~clk;
    end
    initial
    begin
        rst=0;deq=0;enq=0;in=0;
        #20 rst=1;in=1;
        #20 rst=0;enq=1;
        #20 enq=0;in=2;
        #20 enq=1;
        #20 enq=0;in=3;
        #20 enq=1;
        #20 enq=0;in=4;
        #20 enq=1;
        #20 enq=0;in=5;
        #20 enq=1;
        #20 enq=0;in=6;
        #20 enq=1;
        #20 enq=0;in=7;
        #20 enq=1;
        #20 enq=0;in=8;
        #20 enq=1;
        #20 enq=0;
        #20 deq=1;
        #20 deq=0;
        #20 deq=1;
        #20 deq=0;
        #20 deq=1;
        #20 deq=0;
        #20 deq=1;
        #20 deq=0;
        #20 deq=1;
        #20 deq=0;
        #20 deq=1;
        #20 deq=0;
        #20 deq=1;
        #20 deq=0;
        #20 deq=1;
        #20 deq=0;
        #20
        $finish;
    end
endmodule
