`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: Hazard Module
// Tool Versions: Vivado 2017.4.1
// Description: Hazard Module is used to control flush, bubble and bypass
// 
//////////////////////////////////////////////////////////////////////////////////

//  功能说明
    //  识别流水线中的数据冲突，控制数据转发，和flush、bubble信号
// 输入
    // rst               CPU的rst信号
    // reg1_srcD         ID阶段的源reg1地址
    // reg2_srcD         ID阶段的源reg2地址
    // reg1_srcE         EX阶段的源reg1地址
    // reg2_srcE         EX阶段的源reg2地址
    // reg_dstE          EX阶段的目的reg地址
    // reg_dstM          MEM阶段的目的reg地址
    // reg_dstW          WB阶段的目的reg地址
    // br                是否branch
    // jalr              是否jalr
    // jal               是否jal
    // wb_select         写回寄存器的值的来源（Cache内容或者ALU计算结果）
    // reg_write_en_MEM  MEM阶段的寄存器写使能
    // reg_write_en_WB   WB阶段的寄存器写使能
// 输出
    // flushF            IF阶段的flush信号
    // bubbleF           IF阶段的bubble信号
    // flushD            ID阶段的flush信号
    // bubbleD           ID阶段的bubble信号
    // flushE            EX阶段的flush信号
    // bubbleE           EX阶段的bubble信号
    // flushM            MEM阶段的flush信号
    // bubbleM           MEM阶段的bubble信号
    // flushW            WB阶段的flush信号
    // bubbleW           WB阶段的bubble信号
    // op1_sel           00 is reg1, 01 is mem stage forwarding, 01 is wb stage forwarding
    // op2_sel           00 is reg2, 01 is mem stage forwarding, 01 is wb stage forwarding


`include "Parameters.v"   
module HarzardUnit(
    input wire rst,
    input miss,
    input wire [4:0] reg1_srcD, reg2_srcD, reg1_srcE, reg2_srcE, reg_dstE, reg_dstM, reg_dstW,
    input wire br, jalr, jal,
    input wire br_predict_ID, br_predict_EX,       //used in prediction
    input wire wb_select,
    input wire reg_write_en_MEM,
    input wire reg_write_en_WB,
    output reg flushF, bubbleF, flushD, bubbleD, flushE, bubbleE, flushM, bubbleM, flushW, bubbleW,
    output reg [1:0] op1_sel, op2_sel
    );

    // generate op1_sel
    always @ (*)
    begin 
        if (reg1_srcE == reg_dstM && reg_write_en_MEM == 1 && reg1_srcE != 0)
        begin
            // mem to ex forwarding, mem forwarding first
            op1_sel = 2'b01;
        end
        else if (reg1_srcE == reg_dstW && reg_write_en_WB == 1 && reg1_srcE != 0)
        begin
            // wb to ex forwarding
            op1_sel = 2'b10;
        end
        else 
        begin
            op1_sel = 2'b00;
        end
    end
    
    // generate op2_sel
    always @ (*)
    begin
        if (reg2_srcE == reg_dstM && reg_write_en_MEM == 1 && reg2_srcE != 0)
        begin
            // mem to ex forwarding, mem forwarding first
            op2_sel = 2'b01;
        end
        else if (reg2_srcE == reg_dstW && reg_write_en_WB == 1 && reg2_srcE != 0)
        begin
            // wb to ex forwarding
            op2_sel = 2'b10;
        end
        else 
        begin
            op2_sel = 2'b00;
        end
    end
    
    //是否启用预测
    localparam BTB = 1'b1;
    // generate flush
    always @ (*)
    begin
        if (rst)
        begin
            flushF = 1;
            flushD = 1;
            flushE = 1;
            flushM = 1;
            flushW = 1;
        end
        else 
        begin
            if (!BTB)
            begin
                flushF = 0;
                flushD = br  ||
                        jalr ||
                        jal;
                flushE = (wb_select == 1 && (reg_dstE == reg1_srcD || reg_dstE == reg2_srcD)) || //load-use type data hazard
                        (br) ||    //不管是否猜对,跳都flushE
                        jalr;
                flushM = 0;
                flushW = 0;
            end
            else
            begin
                flushF = 0;
                flushD = (!br_predict_EX && br) ||  //猜不跳,实际跳,flushD,E PC = br_target
                        (br_predict_EX && !br) ||  //猜跳,却不跳, flushD,E PC = PC_EX + 4
                        jalr ||
                        jal;
                flushE = (wb_select == 1 && (reg_dstE == reg1_srcD || reg_dstE == reg2_srcD)) || //load-use type data hazard
                        (!br_predict_EX && br) ||  //猜不跳,实际跳,flushD,E PC = br_target
                        (br_predict_EX && !br) ||  //猜跳,却不跳, flushD,E PC = PC_EX + 4
                        jalr;
                flushM = 0;
                flushW = 0;
            end
        end
    end

    // generate bubbleF and flushF and bubbleD and flushD and  bubbleE and flushE
    always @ (*)
    begin
        if (rst)
        begin
            bubbleF = 0;
            bubbleD = 0;
            bubbleE = 0;
        end
        else 
        begin
            // load-use type data hazard, bubble IF, bubble ID, flushE
            if (wb_select == 1 && (reg_dstE == reg1_srcD || reg_dstE == reg2_srcD))
            begin
                bubbleF = 1;
                bubbleD = 1;
                bubbleE = 0;
            end
            else if (miss)
            begin
                // miss bubbleF bubbleD bubbleE
                bubbleF = 1;
                bubbleD = 1;
                bubbleE = 1;
            end
            // implement branch predict with default no branch
            else
            begin
                bubbleF = 0;
                bubbleD = 0;
                bubbleE = 0;
            end
        end
    end
    
    // generate bubbleM, W which isn't concern to br
    always @ (*)
    begin
        if (rst)
        begin
            bubbleM = 0;
            bubbleW = 0;
            
        end
        else 
        begin
            if (miss)
            begin
                bubbleM = 1;
                bubbleW = 1;
            end
            else 
            begin
                bubbleM = 0;
                bubbleW = 0;
            end
        end
    end
    

endmodule