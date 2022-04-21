`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/31 11:43:20
// Design Name: 
// Module Name: FIFO
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


module FIFO(
    input clk,rst,
    input deq,enq,
    input [3:0]in,
    output [3:0]out,
    output full, emp,
    output [2:0] an,
    output [3:0] seg
    );
    
    wire [2:0]ra0,ra1;
    wire [3:0]rd0,rd1;
    wire we;
    wire [2:0]wa;
    wire [3:0]wd;
    wire [2:0]valid;
    wire [1:0]curr_state;
    wire next_state;
    
    LCU LCU_0(.clk(clk),.rst(rst),.deq(deq),.enq(enq),.in(in),.out(out),.full(full),.emp(emp),.rd0(rd0),.ra0(ra0),.we(we),.wa(wa),.wd(wd),.curr_state(curr_state),.valid(valid));    
    RF #(.MSB(3)) RF_0(.clk(clk),.we(we),.wa(wa),.ra0(ra0),.ra1(ra1),.wd(wd),.rd0(rd0),.rd1(rd1));
    SDU SDU_0(.clk(clk),.curr_state(curr_state),.valid(valid),.ra1(ra1),.rd1(rd1),.an(an),.seg(seg));

endmodule
