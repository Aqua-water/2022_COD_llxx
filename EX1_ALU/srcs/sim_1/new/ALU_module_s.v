`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/16 21:20:28
// Design Name: 
// Module Name: ALU_module_s
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


module ALU_module_s
#(parameter MSB = 32)
();
reg [MSB:0] a,b;
reg [2:0]f;
wire [MSB:0] y;
wire z;

ALU_module #(.MSB(32)) ALU_module(.a(a),.b(b),.f(f),.y(y),.z(z));
initial
begin
    f=3'b000;a=5'b10110;b=5'b01010;
    #20 f=3'b001;a=5'b10110;b=5'b01010;
    #20 f=3'b010;a=5'b10110;b=5'b01010;
    #20 f=3'b011;a=5'b10110;b=5'b01010;
    #20 f=3'b100;a=5'b10110;b=5'b01010;
    #20 f=3'b111;a=5'b10110;b=5'b01010;
    #20 $finish;
end
endmodule
