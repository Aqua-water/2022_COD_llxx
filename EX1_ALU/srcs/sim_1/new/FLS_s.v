`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/16 21:23:04
// Design Name: 
// Module Name: FLS_s
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


module FLS_s
#(parameter MSB = 6)
();
reg [MSB:0]d;
reg rst;
reg en;
reg clk;
wire [MSB:0]f;
FLS FLS(.d(d),.rst(rst),.en(en),.clk(clk),.f(f));
initial
begin
    clk=0;
    repeat (100)
    #1 clk=~clk;
end
initial
begin
    d=7'b0000010;rst=1;en=0;
    #2.5 d=7'b0000010;rst=0;en=0;
    #5 d=7'b0000010;rst=0;en=1;
    #20 d=7'b0000010;rst=0;en=0;
    #5 d=7'b0000011;rst=0;en=0;
    #10 d=7'b0000011;rst=0;en=1;
    #10 d=7'b0000011;rst=0;en=0;
    #5 d=7'b0000100;rst=0;en=0;
    #7.5 d=7'b0000100;rst=0;en=1;
    #5 d=7'b0000100;rst=0;en=0;
    #10 d=7'b0000100;rst=0;en=1;
    #5 d=7'b0000100;rst=0;en=0;
    #10 d=7'b0000100;rst=0;en=1;
    #5 $finish;
end
endmodule
