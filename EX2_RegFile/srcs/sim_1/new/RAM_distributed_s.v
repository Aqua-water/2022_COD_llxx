`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/31 10:22:15
// Design Name: 
// Module Name: RAM_distributed_s
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


module RAM_distributed_s();
    reg clk,we;
    reg [3:0]addr;
    reg [7:0]din;
    wire [7:0]dout;
    RAM_distributed RAM_distributed_0(.clk(clk),.we(we),.a(addr),.d(din),.spo(dout));
    initial
    begin
        clk=1;
        repeat (10)
        #1 clk=~clk;
    end
    initial
    begin
        we=0;din=8'b0;addr=4'b0;
        #1.5 addr=4'b0001;
        #2 we=1;din=8'b00010001;addr=4'b0010;
        #2 din=8'b00100010;addr=4'b0011;
        #2 we=0;din=8'b0;addr=4'b0100;
        #2.5 $finish;
    end
endmodule
