`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/09 17:54:20
// Design Name: 
// Module Name: ALU_control
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


module ALU_control(
    input [5:0] Op,
    input [5:0] funct,
    input [1:0] ALUOp,
    output reg [3:0] ALU_input_s
    );
    
    always@(*)
    begin 
        case(ALUOp)
            2'b00:ALU_input_s = 4'b0010;
            2'b01:ALU_input_s = 4'b0110;
            2'b10:
                case(funct)
                    6'b100000:ALU_input_s = 4'b0010;
                    6'b100010:ALU_input_s = 4'b0110;
                    6'b100100:ALU_input_s = 4'b0000;
                    6'b100101:ALU_input_s = 4'b0001;
                    6'b100110:ALU_input_s = 4'b1110;
                    6'b100111:ALU_input_s = 4'b1111;
                    6'b101010:ALU_input_s = 4'b0111;
                    default:ALU_input_s = 4'b0000;
                endcase
            2'b11:
                case(Op)
                    6'b001000:ALU_input_s = 4'b0010;
                    6'b001100:ALU_input_s = 4'b0000;
                    6'b001101:ALU_input_s = 4'b0001;
                    6'b001110:ALU_input_s = 4'b1110;
                    6'b001010:ALU_input_s = 4'b0111;
                    default:ALU_input_s = 4'b0000;
                endcase
        endcase
    end
endmodule
