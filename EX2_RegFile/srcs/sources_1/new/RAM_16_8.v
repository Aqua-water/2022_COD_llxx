`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/30 18:26:09
// Design Name: 
// Module Name: RAM_16_8
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


module RAM_16_8(
    input clk,en,we,
    input [3:0]addr,
    input [7:0]din,
    output [7:0]dout
    );
    
    reg [3:0]addr_tmp;
    reg [7:0]mem[15:0];
    
    always@(posedge clk)
    begin
        if(en)      //总使能
        begin
        addr_tmp<=addr;
            if(we)  //写使能
                mem[addr]<=din;
        end
    end
    
    assign dout = mem[addr_tmp];
    
endmodule
