`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/16 19:23:43
// Design Name: 
// Module Name: ALU_module
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

//ALUģ��
module ALU_module
    #(parameter MSB = 5)	
    (
    input  [MSB:0] a, b,	//�������������ڼ����㣬a�Ǳ�������
    input  [2:0] f,		//�������ܣ��ӡ������롢�����ȣ�
    output  reg [MSB:0] y, 	//���������͡��� ���� 
    output  reg z 			//���־��������Ϊ�㣬z��1��
    );
    
    always @(*)
    begin
    case(f)
        3'b000:y=a+b;
        3'b001:y=a-b;
        3'b010:y=a&b;
        3'b011:y=a|b;
        3'b100:y=a^b;
        default:
            y=0;
    endcase
    z=y==0;
    end
    
endmodule
