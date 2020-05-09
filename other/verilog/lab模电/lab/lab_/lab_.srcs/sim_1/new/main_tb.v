`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/14 15:15:13
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
reg w,s,a,d;
reg start;
reg clk;
wire [7:0]an;
wire [6:0]seg;
integer k;
main DUT6(clk,w,s,a,d,start,an,seg);
initial
begin
    for(i=0;i<80000000;i=i+1)
    begin
        
    end

end
endmodule
