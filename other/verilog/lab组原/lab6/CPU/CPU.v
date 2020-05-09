`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/09 20:46:33
// Design Name: 
// Module Name: CPU
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


module CPU#(parameter NUM=4)(
    input clk,
    input run,
    output [7:0] pc,
    input [7:0] mem_addr,
    input [4:0] reg_addr,
    input rst,
    input [15:0]in,
    output [31:0] mem_data,
    output [31:0] reg_data0,
    output [31:0] reg_data1,
    output [31:0] reg_data2,
    output [31:0] reg_data3,
    output [31:0] reg_data4,
    output [31:0] reg_data5,
    output [31:0] reg_data6,
    output [31:0] reg_data7
    );
    
    reg [31:0] PC;
    wire PCWriteCond;
    wire PCWriteCondne;
    wire IorD;
    wire MemRead;
    wire MemWrite;
    wire MemtoReg;
    wire IRWrite;
    wire PCWrite;
    wire [1:0] PCSource;
    wire [1:0] ALUOp;
    wire [1:0] ALUSrcB;
    wire ALUSrcA;
    wire RegWrite;
    wire RegDst;
    wire IO;
    reg [31:0] instruction; 
    wire PCen;
    wire ZERO;
    wire [31:0] NPC;
    wire [3:0] ALU_input_s;
    wire [31:0] ALU_input_a;
    wire [31:0] ALU_input_b;
    wire [31:0] ALU_output_y;
    wire [31:0] MemData;
    reg [31:0] A;
    reg [31:0] B;
    reg [31:0] ALUOut;
    wire [31:0] address;
    reg [31:0] MDR;
    wire [4:0] wa;
    wire [31:0] wd;
    wire [31:0] PC2;
    wire [31:0] instruction_out;
    wire [31:0] PC3;
    wire [31:0] a;
    wire [31:0] b;
    
    Control U1(.Op(instruction[31:26]),.clk(clk),.rst(rst),.run(run),.PCWriteCond(PCWriteCond),.PCWriteCondne(PCWriteCondne),.PCWrite(PCWrite),
        .IorD(IorD),.MemWrite(MemWrite),.MemtoReg(MemtoReg),.IRWrite(IRWrite),.PCSource(PCSource),.ALUOp(ALUOp),.ALUSrcB(ALUSrcB),.ALUSrcA(ALUSrcA),
        .RegWrite(RegWrite),.RegDst(RegDst),.IO(IO)); 
    ALU_control U3(.Op(instruction[31:26]),.funct(instruction[5:0]),.ALUOp(ALUOp),.ALU_input_s(ALU_input_s));
    ALU U2(.ALU_input_s(ALU_input_s),.ALU_input_a(ALU_input_a),.ALU_input_b(ALU_input_b),.ALU_output_y(ALU_output_y),.ZERO(ZERO));
    dist_mem_gen_0 U8 (
      .a(address[9:2]),        // input wire [7 : 0] a
      .d(B),        // input wire [31 : 0] d
      .dpra(mem_addr),  // input wire [7 : 0] dpra
      .clk(clk),    // input wire clk
      .we(MemWrite),      // input wire we
      .spo(MemData),    // output wire [31 : 0] spo
      .dpo(mem_data)    // output wire [31 : 0] dpo
    );  
    Registers U10(.ra0(instruction[25:21]),.ra1(instruction[20:16]),.ra2(reg_addr),.wa(wa),.wd(wd),.we(RegWrite),.clk(clk),.rd0(a),.rd1(b),
        .rd2(reg_data0),
        .rd3(reg_data1),
        .rd4(reg_data2),
        .rd5(reg_data3),
        .rd6(reg_data4),
        .rd7(reg_data5),
        .rd8(reg_data6),
        .rd9(reg_data7)
    );
    
    assign PCen = (ZERO && PCWriteCond) || PCWrite || (~ZERO && PCWriteCondne);
    assign PC2 = {PC[31:28],instruction[25:0],2'b00};
    assign PC3 = {instruction_out[29:0],2'b00};
    assign pc = PC[7:0];
    assign instruction_out = (instruction[15] == 1) ? {16'b1111111111111111,instruction[15:0]} : {16'b0000000000000000,instruction[15:0]};
    assign NPC = PCSource == 2'b00 ? ALU_output_y : (PCSource == 2'b01 ? ALUOut : PC2);
    assign ALU_input_b = ALUSrcB == 2'b00 ? B : (ALUSrcB == 2'b01 ? 4 : (ALUSrcB == 2'b10 ? instruction_out : PC3));
    assign ALU_input_a = ALUSrcA == 1 ? A : PC;
    assign wd = MemtoReg == 1 ? MDR : ALUOut; 
    assign address = IorD == 1 ? ALUOut : PC;
    assign wa = RegDst == 1 ? instruction[15:11] : instruction[20:16];
    
    always@(posedge clk)
        ALUOut <= ALU_output_y;
        
    always@(posedge clk or posedge rst)
        if(rst)
        begin
            A <= 0;
            B <= 0;
            PC <= 0;
            MDR <= 0;
            instruction <= 0;
        end
        else
        begin
            A <= a;
            B <= b;
            if(PCen) PC <= NPC; 
            MDR <= IO == 0 ? MemData : {16'b0,in};
            if(IRWrite) instruction <= MemData;
        end
        
endmodule
