`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/30 14:41:14
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
reg clk,x,reset;
wire parity;
wire [1:0]st;
integer i;
main DUT (.clk(clk),.x(x),.reset(reset),.parity(parity),.state(st));
initial
begin
clk=0;x=0;reset=1;
    for(i=0;i<20;i=i+1)
    begin
    #5 clk=1;
    #5 clk=0;
    if(i==1) reset=0;
    if(i==2) x=1;
    if(i==3) x=0;
    if(i==4) x=1;
    if(i==6) x=0;
    if(i==7) x=1;

    end
end
endmodule
