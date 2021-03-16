`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: Controller Decoder
// Tool Versions: Vivado 2017.4.1
// Description: Controller Decoder Module
// 
//////////////////////////////////////////////////////////////////////////////////

//  功能说明
    //  对指令进行译码，将其翻译成控制信号，传输给各个部件
// 输入
    // Inst              待译码指令
// 输出
    // jal               jal跳转指令
    // jalr              jalr跳转指令
    // op2_src           ALU的第二个操作数来源。为1时，op2选择imm，为0时，op2选择reg2
    // ALU_func          ALU执行的运算类型
    // br_type           branch的判断条件，可以是不进行branch
    // load_npc          写回寄存器的值的来源（PC或者ALU计算结果）, load_npc == 1时选择PC
    // wb_select         写回寄存器的值的来源（Cache内容或者ALU计算结果），wb_select == 1时选择cache内容
    // load_type         load类型
    // src_reg_en        指令中src reg的地址是否有效，src_reg_en[1] == 1表示reg1被使用到了，src_reg_en[0]==1表示reg2被使用到了
    // reg_write_en      通用寄存器写使能，reg_write_en == 1表示需要写回reg
    // cache_write_en    按字节写入data cache
    // imm_type          指令中立即数类型
    // alu_src1          alu操作数1来源，alu_src1 == 0表示来自reg1，alu_src1 == 1表示来自PC
    // alu_src2          alu操作数2来源，alu_src2 == 2’b00表示来自reg2，alu_src2 == 2'b01表示来自reg2地址，alu_src2 == 2'b10表示来自立即数
// 实验要求
    // 补全模块


`include "Parameters.v"   
module ControllerDecoder(
    input wire [31:0] inst,
    output wire jal,
    output wire jalr,
    output wire op2_src,
    output reg [3:0] ALU_func,
    output reg [2:0] br_type,
    output wire load_npc,
    output wire wb_select,
    output reg [2:0] load_type,
    output reg [1:0] src_reg_en,
    output reg reg_write_en,
    output reg [3:0] cache_write_en,
    output wire alu_src1,
    output wire [1:0] alu_src2,
    output reg [2:0] imm_type
    );

    // TODO: Complete this module
    
    /*******************/
    //nop 32'h0000 0013 addi x0,x0,0

    assign jal = (inst[6:0] == 7'b1101111);

    assign jalr = (inst[6:0] == 7'b1100111);

    assign op2_src = (imm_type != `RTYPE);      //只有R类为1

    assign load_npc = (inst[6:0] == 7'b1100111 ||   //jalr
                       inst[6:0] == 7'b1101111);    //jal
                       //inst[6:0] == 7'b0010111);    //auipc

    assign wb_select = (inst[6:0] == 7'b0000011);   //lw

    //used in hazard
    assign alu_src1 = (inst[6:0] == 7'b0010111);    //auipc
    //used in hazard
    assign alu_src2 = (inst[6:0] != 7'b0110011 &&
                       (ALU_func == `SLL || ALU_func == `SRL || ALU_func == `SRA)) ? 2'b01 : 2'b11;



    always @ (inst)
    begin
        if (inst[6:0] == 7'b0110111)    //lui
            ALU_func <= `LUI;

        else if (inst[6:0] == 7'b0010111 ||     //auipc
                 inst[6:0] == 7'b1100111 ||     //jalr
                 inst[6:0] == 7'b0000011 ||     //lw
                 inst[6:0] == 7'b0100011)       //sw
            ALU_func <= `ADD;

        else if (inst[6:0] == 7'b0110011)       //R类, 
        begin                     
            case (inst[14:12])
            3'b000: ALU_func <= (inst[31:25] == 7'b0100000) ? `SUB : `ADD;
            3'b001: ALU_func <= `SLL;
            3'b010: ALU_func <= `SLT;
            3'b011: ALU_func <= `SLTU;
            3'b100: ALU_func <= `XOR;
            3'b101: ALU_func <= (inst[31:25] == 7'b0) ? `SRL : `SRA;
            3'b110: ALU_func <= `OR;
            3'b111: ALU_func <= `AND;
            endcase
        end
        else                                    //立即数计算
        begin
            case (inst[14:12])
            3'b000: ALU_func <= `ADD;
            3'b001: ALU_func <= `SLL;           //alu_src2
            3'b010: ALU_func <= `SLT;
            3'b011: ALU_func <= `SLTU;
            3'b100: ALU_func <= `XOR;
            3'b101: ALU_func <= (inst[31:25] == 7'b0) ? `SRL : `SRA;//alu_src2
            3'b110: ALU_func <= `OR;
            3'b111: ALU_func <= `AND;
            endcase
        end
    end
    
    always @ (inst)
    begin
        if (inst[6:0] == 7'b1100011) //branch
        begin
        case (inst[14:12])
            3'b000: br_type <= `BEQ;
            3'b001: br_type <= `BNE;
            3'b100: br_type <= `BLT;
            3'b110: br_type <= `BLTU;
            3'b101: br_type <= `BGE;
            3'b111: br_type <= `BGEU;
            default:br_type <= `NOBRANCH;
        endcase
        end
        else
            br_type <= 3'd0;
    end

    always @ (inst)
    begin
        if (inst[6:0] == 7'b0000011) //lw
        begin
        case (inst[14:12])
            3'b000: load_type <= `LB;
            3'b001: load_type <= `LH;
            3'b010: load_type <= `LW;
            3'b100: load_type <= `LBU;
            3'b101: load_type <= `LHU;
            default:load_type <= `NOREGWRITE;
        endcase
        end
        else
            load_type <= `NOREGWRITE;
    end

    always @ (inst)             //used in hazard
    begin
        src_reg_en[1] = (inst[6:0] == 7'b1100111 ||  //jalr
                         inst[6:0] == 7'b0000011 ||  //lw
                         inst[6:0] == 7'b0100011 ||  //sw
                         inst[6:0] == 7'b0010011 ||  //立即数运算
                         inst[6:0] == 7'b0110011 ||  //R类
                         inst[6:0] == 7'b1100011     //branch
        );                                           //都用到reg1 进入alu运算

        src_reg_en[0] = (inst[6:0] == 7'b0110011     //只有R类用到reg2进入alu运算
                         //inst[14:12] != 3'b001   &&  //不为SLL
                         //inst[14:12] != 3'b101       //不为SRL, SRA
        );
    end

    always @ inst
    begin
        reg_write_en <= (inst[6:0] != 7'b1100011 &&   //not branch
                         inst[6:0] != 7'b0100011);    //not sw
    end

    always @ (inst)
    begin
        if (inst[6:0] == 7'b0100011)    //sw
        begin
            case (inst[14:12])          //cache_write_en 会根据地址再移动
                2'b000: cache_write_en <= 4'b0001; //写1字节
                2'b001: cache_write_en <= 4'b0011; //写2字节
                2'b010: cache_write_en <= 4'b1111; //写4字节
                default: cache_write_en <= 4'b0;
            endcase
        end
        else
            cache_write_en <= 4'b0;
    end

    always @ (inst)
    begin
        if (inst[6:0] == 7'b0010011 ||      //立即数运算
            inst[6:0] == 7'b1100111 ||      //jalr
            inst[6:0] == 7'b0000011)        //lw
            imm_type <= `ITYPE;
        else if (inst[6:0] == 7'b0110111 ||  //lui
            inst[6:0] == 7'b0010111)         //auipc
            imm_type <= `UTYPE;
        else if (inst[6:0] == 7'b0100011)    //sw
            imm_type <= `STYPE;
        else if (inst[6:0] == 7'b1100011)    //branch
            imm_type <= `BTYPE;
        else if (inst[6:0] == 7'b1101111)    //jal
            imm_type <= `JTYPE;
        else                //7'b0110011      运算
            imm_type <= `RTYPE;
    end
endmodule
