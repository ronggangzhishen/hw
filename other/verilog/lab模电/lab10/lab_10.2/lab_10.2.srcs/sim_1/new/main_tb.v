`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/30 16:49:36
// Design Name: 
// Module Name: main_tb
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


module main_tb();
    reg clk;
    reg reset;
    reg [1:0] ain;
    wire yout;
    wire [1:0]st;
    main DUT(.clk(clk),.reset(reset),.x(ain),.y(yout));
    initial
    begin
    clk=0;
    forever
    begin
    #10 clk=1;
    #10 clk=0;
    end
    end
    initial
    begin
    reset=1;
    ain=0;
    #15 reset=0;
    #20 ain=3;
    #20 ain=0;
    #20 ain=1;
    #20 ain=0;
    #20 ain=2;
    #20 ain=0;
    #20 ain=2;
    #20 ain=0;
    end
endmodule
