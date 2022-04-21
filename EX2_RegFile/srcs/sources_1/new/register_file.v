`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/30 18:24:30
// Design Name: 
// Module Name: register_file
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


module register_file
    #(parameter MSB=7)(
    input clk,we,
    input [4:0]wa,ra0,ra1,
    input [MSB:0]wd,
    output [MSB:0]rd0,rd1
    );
    
    reg [MSB:0]regfile[31:0];
    initial regfile[0]=0;
    initial regfile[1]=0;
    initial regfile[2]=0;
    initial regfile[3]=0;
    initial regfile[4]=0;
    initial regfile[5]=0;
    initial regfile[6]=0;
    initial regfile[7]=0;
    initial regfile[8]=0;
    initial regfile[9]=0;
    initial regfile[10]=0;
    initial regfile[11]=0;
    initial regfile[12]=0;
    initial regfile[13]=0;
    initial regfile[14]=0;
    initial regfile[15]=0;
    initial regfile[16]=0;
    initial regfile[17]=0;
    initial regfile[18]=0;
    initial regfile[19]=0;
    initial regfile[20]=0;
    initial regfile[21]=0;
    initial regfile[22]=0;
    initial regfile[23]=0;
    initial regfile[24]=0;
    initial regfile[25]=0;
    initial regfile[26]=0;
    initial regfile[27]=0;
    initial regfile[28]=0;
    initial regfile[29]=0;
    initial regfile[30]=0;
    initial regfile[31]=0;
    
    assign rd0=regfile[ra0],
            rd1=regfile[ra1];
    
    always@ (posedge clk)
    begin
    if(we)
        regfile[wa]<=wd;
    end
    
endmodule
