`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/11 23:13:11
// Design Name: 
// Module Name: CPU_tb
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


module CPU_tb(

    );
    
    reg clk;
    reg run;
    wire [7:0] pc;
    reg [7:0] mem_addr;
    reg [4:0] reg_addr;
    reg rst;
    wire [31:0] mem_data;
    wire [31:0] reg_data;
    
    CPU U1(clk,run,pc,mem_addr,reg_addr,rst,mem_data,reg_data);
    
    initial 
    begin
        clk = 0;
        forever #500 clk = ~clk;
    end
    
    initial
    begin
        run = 1;
        mem_addr = 0;
        reg_addr = 0;
        rst = 1;
        #1000 rst = 0;
    end
     
endmodule
