`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/16 19:27:32
// Design Name: 
// Module Name: register
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

//¼Ä´æÆ÷
module register
    #(parameter MSB = 5)
    (
    input clk,
    input en,
    input [MSB:0] x,
    output reg [MSB:0] y
    );
    
    always @(posedge clk)
    begin
    if(en==1)
        y<=x;
    end
    
endmodule
