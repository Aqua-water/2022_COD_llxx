`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/17 14:08:39
// Design Name: 
// Module Name: ALU_32
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


module ALU_32
    #(parameter MSB=31)
    (
    input clk,
    input  en,
    input  [1:0]sel,
    input  [MSB:0] x,		
    output  [MSB:0] y, 	
    output  z
    );
    
    wire ef,ea,eb;
    wire [MSB:0]f,a,b;
    wire[MSB:0] ry;wire rz;
    
    decoder decoder(.en(en),.sel(sel),.ef(ef),.ea(ea),.eb(eb));
    register #(.MSB(31)) register_0(.clk(clk),.x(x),.en(ef),.y(f));
    register #(.MSB(31)) register_1(.clk(clk),.x(x),.en(ea),.y(a));
    register #(.MSB(31)) register_2(.clk(clk),.x(x),.en(eb),.y(b));
    ALU_module #(.MSB(31)) ALU(.a(a),.b(b),.f(f[2:0]),.y(ry),.z(rz));
    register #(.MSB(31)) register_3(.clk(clk),.x(ry),.en(1),.y(y));
    register #(.MSB(0)) register_4(.clk(clk),.x(rz),.en(1),.y(z));

endmodule
