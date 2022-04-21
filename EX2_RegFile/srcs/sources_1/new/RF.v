`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/07 16:51:02
// Design Name: 
// Module Name: RF
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


module RF
    #(parameter MSB=3)(
    input clk,we,
    input [2:0]wa,ra0,ra1,
    input [MSB:0]wd,
    output [MSB:0]rd0,rd1
    );
    
    reg [MSB:0]regfile[7:0];
    initial regfile[0]=0;
    initial regfile[1]=0;
    initial regfile[2]=0;
    initial regfile[3]=0;
    initial regfile[4]=0;
    initial regfile[5]=0;
    initial regfile[6]=0;
    initial regfile[7]=0;
    
    assign rd0=regfile[ra0],
            rd1=regfile[ra1];
    
    always@ (posedge clk)
    begin
    if(we)
        regfile[wa]<=wd;
    end
    
endmodule
