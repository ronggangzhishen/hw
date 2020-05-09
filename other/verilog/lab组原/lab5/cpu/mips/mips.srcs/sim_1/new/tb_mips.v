`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/16 14:38:00
// Design Name: 
// Module Name: tb_mips
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


module tb_mips();
reg clk,reset,run;
integer i;
mips DUT(.clk100mhz(clk),.reset(reset),.cont(run));
initial
begin
forever
begin
#5 clk=0;
#5 clk=1;
end
end
endmodule
