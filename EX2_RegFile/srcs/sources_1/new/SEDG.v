`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/07 17:21:11
// Design Name: 
// Module Name: SEDG
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


module SEDG(
    input clk,a,
    output reg s,
    output p
    );
    
    reg st,pt;
    
    //两级同步，对s取边沿
    always@(posedge clk)
    begin
        st <= a;
        s <= st;
        pt <= s;
    end
    
    assign p = s & (~pt);
    
endmodule
