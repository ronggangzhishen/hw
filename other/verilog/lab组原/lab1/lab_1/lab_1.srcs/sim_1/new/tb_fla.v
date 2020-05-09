`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/22 12:06:06
// Design Name: 
// Module Name: tb_fla
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


module tb_fla();
reg clk,clr,en;
reg [5:0]x;
reg [5:0]y;
wire [15:0]r;
integer i;

fla DUT2(clk,x,y,clr,en,r);

initial
begin
en=1;
clr=1;
x=6'b000001;
y=6'b000001;
    for(i=0;i<20;i=i+1)
    begin
    if(i==1) clr=0;
    clk=0;
    #10;
    clk=1;
    #10;
    end
end

endmodule
