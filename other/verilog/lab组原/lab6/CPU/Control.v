`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/09 16:04:02
// Design Name: 
// Module Name: Control
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


module Control(
    input [5:0] Op,
    input clk,
    input rst,
    input run,
    output reg PCWriteCond,
    output reg PCWriteCondne,
    output reg PCWrite,
    output reg IorD,
    //output reg MemRead,
    output reg MemWrite,
    output reg MemtoReg,
    output reg IRWrite,
    output reg [1:0] PCSource,
    output reg [1:0] ALUOp,
    output reg [1:0] ALUSrcB,
    output reg ALUSrcA,
    output reg RegWrite,
    output reg RegDst,
    output reg IO
    );
    
    parameter start = 4'b1111,s0 = 4'b0000,s1 = 4'b0001,s2 = 4'b0010,s3 = 4'b0011,s4 = 4'b0100,s5 = 4'b0101,s6 = 4'b0110,s7 = 4'b0111,s8 = 4'b1000,s9 = 4'b1001,s10 = 4'b1010,s11=4'b1011,s12=4'b1100,s13=4'b1101,s14=4'b1110; 
    parameter LW = 6'b100011;
    parameter SW = 6'b101011;
    parameter R_type = 6'b000000;
    parameter BEQ = 6'b000100;
    parameter J = 6'b000010;
    parameter BNE = 6'b000101;
    parameter ADDI = 6'b001000;
    parameter ANDI = 6'b001100;
    parameter ORI = 6'b001101;
    parameter XORI = 6'b001110;
    parameter SLTI = 6'b001010;
    parameter IOLW = 6'b111111;
    //reg [5:0] Opreg;
    reg [3:0] state;
    reg [3:0] next_state;
    
    always @ (posedge clk or posedge rst)
    begin
        if(rst) state <= start;
        else state <= next_state;
    end
    
    always@(*)
    begin
        case(state) 
            start:
            begin
                PCWriteCond<=0;
                PCWriteCondne<=0;
                PCWrite<=0;
                IRWrite<=0;
                ALUSrcA<=1;
                ALUSrcB<=2'b00;
                ALUOp<=2'b00;
                RegDst<=0;
                PCSource<=2'b00;
                RegWrite<=0;
                IorD<=0;
                MemWrite<=0;
                MemtoReg<=0;
                IO<=0;
                next_state <= run ? s0 : start;
            end
            s0:
            begin
                PCWriteCond<=0;
                PCWriteCondne<=0;
                PCWrite<=1;
                IRWrite<=1;
                ALUSrcA<=0;
                ALUSrcB<=2'b01;
                ALUOp<=2'b00;
                RegDst<=0;
                PCSource<=2'b00;
                RegWrite<=0;
                IorD<=0;
                MemWrite<=0;
                MemtoReg<=0;
                next_state <= s1;
            end
            s1:
            begin
                PCWriteCond<=0;
                PCWriteCondne<=0;
                PCWrite<=0;
                IRWrite<=0;
                ALUSrcA<=0;
                ALUSrcB<=2'b11;
                ALUOp<=2'b00;
                RegDst<=0;
                PCSource<=2'b00;
                RegWrite<=0;
                IorD<=0;
                MemWrite<=0;
                MemtoReg<=0;
                IO<=0;
                case(Op)
                    LW:next_state <= s2;
                    SW:next_state <= s2;
                    R_type:next_state <= s6;
                    BEQ:next_state <= s8;
                    J:next_state <= s9;
                    BNE:next_state <= s10;
                    ADDI:next_state <= s11;
                    ANDI:next_state <= s11;
                    ORI:next_state <= s11;
                    XORI:next_state <= s11;
                    SLTI:next_state <= s11;
                    IOLW:next_state <= s13;
                    default:next_state <= run ? 4'b0000 : start;
                endcase
            end
            s2:
            begin
                PCWriteCond<=0;
                PCWriteCondne<=0;
                PCWrite<=0;
                IRWrite<=0;
                ALUSrcA<=1;
                ALUSrcB<=2'b10;
                ALUOp<=2'b00;
                RegDst<=0;
                PCSource<=2'b00;
                RegWrite<=0;
                IorD<=0;
                MemWrite<=0;
                MemtoReg<=0;
                IO<=0;
                case(Op)
                    LW:next_state <= s3;
                    SW:next_state <= s5;
                    default:next_state <= run ? 4'b0000 : start;
                endcase
            end
            s3:
            begin
                PCWriteCond<=0;
                PCWriteCondne<=0;
                PCWrite<=0;
                IRWrite<=0;
                ALUSrcA<=1;
                ALUSrcB<=2'b10;
                ALUOp<=2'b00;
                RegDst<=0;
                PCSource<=2'b00;
                RegWrite<=0;
                IorD<=1;
                MemWrite<=0;
                MemtoReg<=0;
                IO<=0;
                next_state <= s4;
            end
            s4:
            begin
                PCWriteCond<=0;
                PCWriteCondne<=0;
                PCWrite<=0;
                IRWrite<=0;
                ALUSrcA<=1;
                ALUSrcB<=2'b10;
                ALUOp<=2'b00;
                RegDst<=0;
                PCSource<=2'b00;
                RegWrite<=1;
                IorD<=1;
                MemWrite<=0;
                MemtoReg<=1;
                IO<=0;
                next_state <= run ? s0 : start;
            end
            s5:
            begin
                PCWriteCond<=0;
                PCWriteCondne<=0;
                PCWrite<=0;
                IRWrite<=0;
                ALUSrcA<=1;
                ALUSrcB<=2'b10;
                ALUOp<=2'b00;
                RegDst<=0;
                PCSource<=2'b00;
                RegWrite<=0;
                IorD<=1;
                MemWrite<=1;
                MemtoReg<=0;
                IO<=0;
                next_state <= run ? s0 : start;
            end
            s6:
            begin 
                PCWriteCond<=0;
                PCWriteCondne<=0;
                PCWrite<=0;
                IRWrite<=0;
                ALUSrcA<=1;
                ALUSrcB<=2'b00;
                ALUOp<=2'b10;//
                RegDst<=0;//
                PCSource<=2'b00;//
                RegWrite<=0;
                IorD<=0;//
                MemWrite<=0;
                MemtoReg<=0;//
                IO<=0;
                next_state <= s7;
            end
            s7:
            begin
                PCWriteCond<=0;
                PCWriteCondne<=0;
                PCWrite<=0;
                IRWrite<=0;
                ALUSrcA<=1;
                ALUSrcB<=2'b10;
                ALUOp<=2'b00;//
                RegDst<=1;//
                PCSource<=2'b00;//
                RegWrite<=1;
                IorD<=0;//
                MemWrite<=0;
                MemtoReg<=0;
                IO<=0;
                next_state <= run ? s0 : start;
            end
            s8:
            begin
                PCWriteCond<=1;
                PCWriteCondne<=0;
                PCWrite<=0;
                IRWrite<=0;
                ALUSrcA<=1;
                ALUSrcB<=2'b00;
                ALUOp<=2'b01;
                RegDst<=0;//
                PCSource<=2'b01;
                RegWrite<=0;
                IorD<=0;//
                MemWrite<=0;
                MemtoReg<=0;//
                IO<=0;
                next_state <= run ? s0 : start;
            end
            s9:
            begin
                PCWriteCond<=0;
                PCWriteCondne<=0;
                PCWrite<=1;
                IRWrite<=0;
                ALUSrcA<=1;
                ALUSrcB<=2'b10;
                ALUOp<=2'b00;//
                RegDst<=0;//
                PCSource<=2'b10;//
                RegWrite<=0;
                IorD<=0;//
                MemWrite<=0;
                MemtoReg<=0;//
                IO<=0;
                next_state <= run ? s0 : start;
            end
            s10:
            begin
                PCWriteCond<=0;
                PCWriteCondne<=1;
                PCWrite<=0;
                IRWrite<=0;
                ALUSrcA<=1;
                ALUSrcB<=2'b00;
                ALUOp<=2'b01;
                RegDst<=0;//
                PCSource<=2'b01;
                RegWrite<=0;
                IorD<=0;//
                MemWrite<=0;
                MemtoReg<=0;//
                IO<=0;
                next_state <= run ? s0 : start;
            end
            s11:
            begin//addi andi..ex
                PCWriteCond<=0;
                PCWriteCondne<=0;
                PCWrite<=0;
                IRWrite<=0;
                ALUSrcA<=1;
                ALUSrcB<=2'b10;
                ALUOp<=2'b11;//
                RegDst<=0;//
                PCSource<=2'b00;//
                RegWrite<=0;
                IorD<=0;//
                MemWrite<=0;
                MemtoReg<=0;//
                IO<=0;
                next_state <= s12;
            end
            s12:
            begin
                PCWriteCond<=0;
                PCWriteCondne<=0;
                PCWrite<=0;
                IRWrite<=0;
                ALUSrcA<=1;
                ALUSrcB<=2'b10;
                ALUOp<=2'b00;//
                RegDst<=0;//
                PCSource<=2'b00;//
                RegWrite<=1;
                IorD<=0;//
                MemWrite<=0;
                MemtoReg<=0;
                IO<=0;
                next_state <= run ? s0 : start;
            end
            s13://IOread
            begin
                PCWriteCond<=0;
                PCWriteCondne<=0;
                PCWrite<=0;
                IRWrite<=0;
                ALUSrcA<=1;
                ALUSrcB<=2'b00;
                ALUOp<=2'b00;
                RegDst<=0;
                PCSource<=2'b00;
                RegWrite<=0;
                IorD<=0;
                MemWrite<=0;
                MemtoReg<=0;
                IO<=1;
                next_state <= s14;
            end
            s14://IOwrite
            begin
                PCWriteCond<=0;
                PCWriteCondne<=0;
                PCWrite<=0;
                IRWrite<=0;
                ALUSrcA<=1;
                ALUSrcB<=2'b00;
                ALUOp<=2'b00;
                RegDst<=0;
                PCSource<=2'b00;
                RegWrite<=1;
                IorD<=0;
                MemWrite<=0;
                MemtoReg<=1;
                IO<=1;
                next_state <= run ? s0 : start;
            end
            default:
            begin
                PCWriteCond<=0;
                PCWriteCondne<=0;
                PCWrite<=0;
                IRWrite<=0;
                ALUSrcA<=1;
                ALUSrcB<=2'b00;
                ALUOp<=2'b00;
                RegDst<=0;
                PCSource<=2'b00;
                RegWrite<=0;
                IorD<=0;
                MemWrite<=0;
                MemtoReg<=0;
                IO<=0;
                next_state <= run ? s0 : start;
            end
        endcase
    end
endmodule
