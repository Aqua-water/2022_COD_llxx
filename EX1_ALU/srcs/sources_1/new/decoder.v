`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/16 19:45:28
// Design Name: 
// Module Name: decoder
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

//ÒëÂëÆ÷
module decoder
    (
    input en,
    input [1:0]sel,
    output reg ef,
    output reg ea,
    output reg eb
    );
    
    always @(*)
    begin
    case(sel)
        2'b00:
            begin
            ef=0;
            ea=en;
            eb=0;
            end
        2'b01:
            begin
            ef=0;
            ea=0;
            eb=en;
            end
        2'b10:
            begin
            ef=en;
            ea=0;
            eb=0;
            end
        default:
            begin
            ef=en;
            ea=0;
            eb=0;
            end
        endcase
    end
    
endmodule
