`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: Data Extend
// Tool Versions: Vivado 2017.4.1
// Description: Data Extension module
// 
//////////////////////////////////////////////////////////////////////////////////

//  功能说明
    //  将Cache中Load的数据扩展成32位
// 输入
    // data              cache读出的数据
    // addr              字节地址
    // load_type         load的类型
    // ALU_func          运算类型
// 输出
    // dealt_data        扩展完的数据
// 实验要求
    // 补全模块


`include "Parameters.v"

module DataExtend(
    input wire [31:0] data,
    input wire [1:0] addr,
    input wire [2:0] load_type,
    output reg [31:0] dealt_data
    );
    wire [7:0] tb;
    wire [15:0] th;
    assign tb = (addr == 2'b00) ? data[7:0] :
                                    ((addr == 2'b01) ? data[15:8] :
                                                        ((addr == 2'b10) ? data[23:16] :
                                                                            data[31:24]));
    assign th = (addr == 2'b00) ? data[15:0] : data[31:16]; //wocao
    // TODO: Complete this module
    always @ *
    begin
    case (load_type)
        `NOREGWRITE: dealt_data <= 32'b0;
        `LB: dealt_data <= {{24{tb[7]}}, tb[7:0]};  
        `LH: dealt_data <= {{16{th[15]}}, th[15:0]};
        `LW: dealt_data <= data;
        `LBU: dealt_data <= {24'b0, tb[7:0]};
        `LHU: dealt_data <= {16'b0, th[15:0]};
        default: dealt_data <= 32'b0;
    endcase
    end
endmodule