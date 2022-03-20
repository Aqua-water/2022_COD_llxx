`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/16 19:10:13
// Design Name: 
// Module Name: ALU
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


module ALU 
    #(parameter MSB=5)
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
    register #(.MSB(5)) register_0(.clk(clk),.x(x),.en(ef),.y(f));
    register #(.MSB(5)) register_1(.clk(clk),.x(x),.en(ea),.y(a));
    register #(.MSB(5)) register_2(.clk(clk),.x(x),.en(eb),.y(b));
    ALU_module #(.MSB(5)) ALU(.a(a),.b(b),.f(f[2:0]),.y(ry),.z(rz));
    register #(.MSB(5)) register_3(.clk(clk),.x(ry),.en(1),.y(y));
    register #(.MSB(0)) register_4(.clk(clk),.x(rz),.en(1),.y(z));

endmodule
