`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/09 17:02:42
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [3:0] ALU_input_s,
    input [31:0] ALU_input_a,
    input [31:0] ALU_input_b,
    output reg [31:0] ALU_output_y,
    output reg ZERO
    );
    
    reg f;
    parameter ADD = 4'b0010;
    parameter SUB = 4'b0110;
    parameter AND = 4'b0000;
    parameter OR = 4'b0001;
    parameter XOR = 4'b1110;
    parameter NOR = 4'b1111;
    parameter SLT = 4'b0111;
    
    always@(*)
    begin
        case(ALU_input_s)
            ADD:
            begin
                {f,ALU_output_y} = {1'b0,ALU_input_a} + {1'b0,ALU_input_b};
                ZERO = ~(|ALU_output_y);
            end
            SUB:
            begin
                {f,ALU_output_y} = {1'b0,ALU_input_a} + ~{1'b0,ALU_input_b} + 1;
                ZERO = ~(|ALU_output_y);
            end   
            AND:
            begin
                ALU_output_y = ALU_input_a & ALU_input_b;
                ZERO = ~(|ALU_output_y);
            end
            OR:
            begin
                ALU_output_y = ALU_input_a | ALU_input_b;
                ZERO = ~(|ALU_output_y);
            end
            XOR:
            begin
                ALU_output_y = ALU_input_a ^ ALU_input_b;
                ZERO = ~(|ALU_output_y);
            end
            NOR:
            begin
                ALU_output_y = ~(ALU_input_a | ALU_input_b);
                ZERO = ~(|ALU_output_y);
            end
            SLT:
            begin
                if(ALU_input_a < ALU_input_b)
                begin
                    ALU_output_y = 1;
                    ZERO = ~(|ALU_output_y);
                end
                else
                begin
                    ALU_output_y = 0;
                    ZERO = ~(|ALU_output_y);
                end            
            end
            default:
            begin
                ALU_output_y = 0;
                ZERO = 0;
            end
        endcase
    end        
endmodule
