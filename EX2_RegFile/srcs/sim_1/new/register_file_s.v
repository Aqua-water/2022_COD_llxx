`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/30 22:26:06
// Design Name: 
// Module Name: register_file_s
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


module register_file_s
    #(parameter MSB=7)();
    reg clk,we;
    reg [4:0]wa,ra0,ra1;
    reg [MSB:0]wd;
    wire [MSB:0]rd0,rd1;
    register_file register_file_0(.clk(clk),.we(we),.wa(wa),.ra0(ra0),.ra1(ra1),.wd(wd),.rd0(rd0),.rd1(rd1));
    initial
    begin
        clk=0;
        repeat (100)
        #1 clk=~clk;
    end
    
    initial
    begin
        we=0;wa=0;wd=1;ra0=0;ra1=31;
        #5 we=1;
        #5 wd=0;
        #5 wa=1;wd=1;
        #5 wa=2;wd=2;ra0=2;
        #5
        $finish;
    end
endmodule
