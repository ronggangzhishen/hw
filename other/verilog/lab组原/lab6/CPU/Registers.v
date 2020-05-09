`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/09 19:57:52
// Design Name: 
// Module Name: Registers
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


module Registers#(parameter RF_DATA_WIDTH = 32,RF_ADDER_WIDTH = 5,NUM=4)(
    input [RF_ADDER_WIDTH-1:0] ra0,
    input [RF_ADDER_WIDTH-1:0] ra1,
    input [RF_ADDER_WIDTH-1:0] ra2,
    input [RF_ADDER_WIDTH-1:0] wa,
    input [RF_DATA_WIDTH-1:0] wd,
    input we,
    //input rst,
    input clk,
    output [RF_DATA_WIDTH-1:0] rd0,
    output [RF_DATA_WIDTH-1:0] rd1,
    output [RF_DATA_WIDTH-1:0] rd2,
    output [RF_DATA_WIDTH-1:0] rd3,
    output [RF_DATA_WIDTH-1:0] rd4,
    output [RF_DATA_WIDTH-1:0] rd5,
    output [RF_DATA_WIDTH-1:0] rd6,
    output [RF_DATA_WIDTH-1:0] rd7,
    output [RF_DATA_WIDTH-1:0] rd8,
    output [RF_DATA_WIDTH-1:0] rd9
    //
    );
    
    reg [RF_DATA_WIDTH-1:0] register [31:0];
    
    assign rd0 = register[ra0];
    assign rd1 = register[ra1];
    assign rd2 = register[ra2];
    assign rd3 = register[ra2+5'd1];
    assign rd4 = register[ra2+5'd2];
    assign rd5 = register[ra2+5'd3];
    assign rd6 = register[ra2+5'd4];
    assign rd7 = register[ra2+5'd5];
    assign rd8 = register[ra2+5'd6];
    assign rd9 = register[ra2+5'd7];
        always@(posedge clk)
        begin
            if(we)
            register[wa] <= wd;
        end
endmodule
