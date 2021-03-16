`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/20 15:46:29
// Design Name: 
// Module Name: branchpredictor
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

//根据EX段br结果更新表
//为ID段br提供预测
module branchpredictor #(
    parameter PC_ADDR_LEN = 10, //除去低2位后的PC地址长度
    parameter TAG_LEN = 2       //用于记录历史
)(
    input wire clk,
    input wire [31:0] PC_IF, PC_EX,
    input wire [31:0] br_target,
    input wire br,
    //input wire branch_ID, branch_EX, br_predict_EX, //不用判断是否为br指令,在表里的自然是br指令
    output wire br_predict_IF,
    output wire [31:0] br_target_predict
    );
    localparam CACHE_SIZE = 1 << PC_ADDR_LEN;
    reg [TAG_LEN + PC_ADDR_LEN-1:0] pc_cache [CACHE_SIZE-1:0];
    
    //
    wire [PC_ADDR_LEN-1:0] pc_if, pc_ex;
    wire [PC_ADDR_LEN-1:0] rd_target, wr_target, predict_target;
    wire [TAG_LEN-1:0] rd_tag, wr_tag, predict_tag;
    wire update;

    initial begin
        for (integer i = 0; i < CACHE_SIZE; i=i+1)
        begin
            pc_cache[i] = 12'b0;
        end
    end

    //**更新部分
    assign pc_ex = PC_EX[PC_ADDR_LEN+2-1:2];
    assign {rd_tag, rd_target} = pc_cache[pc_ex];
    assign wr_target = br_target[PC_ADDR_LEN+2-1:2];  //br实际target
    //根据br状况更新tag, 跳+1, 否-1
    assign wr_tag = br ? (rd_tag == 2'b11 ? 2'b11 : rd_tag + 2'b1)
                        : (rd_tag == 2'b00 ? 2'b00 : rd_tag - 2'b1);
    //只有tag有变化才需要更新, 无变化可能是br没有跳转或持续跳转, 此时不需要更新
    assign update = wr_tag != rd_tag;

    always @ (posedge clk)
    begin   //只有确定为branch指令才会更新BTB
        if (update)
        begin
            pc_cache[pc_ex] <= {wr_tag, wr_target};
        end
    end

    //**预测部分
    assign pc_if = PC_IF[PC_ADDR_LEN+2-1:2];
    assign {predict_tag, predict_target} = pc_cache[pc_if];
    //状态机为11或10则预测跳, 而不为0已经说明该指令为br指令, 不用再判断
    assign br_predict_IF = (predict_tag == 2'b10 || predict_tag == 2'b11);
    //将读出的PC_ADDR_LEN位target拼接为32位
    assign br_target_predict = br_predict_IF ? {{20{0}}, predict_target, 2'b00} : 32'b0;

endmodule
