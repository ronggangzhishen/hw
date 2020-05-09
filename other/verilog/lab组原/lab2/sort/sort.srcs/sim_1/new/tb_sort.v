`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/28 20:18:25
// Design Name: 
// Module Name: tb_sort
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


module tb_sort( );
reg [3:0] x0,x1,x2,x3;
reg rst,clk;
wire [3:0] s0,s1,s2,s3;
wire done;
integer i;
sort DUT(x0,x1,x2,x3,rst,clk,s0,s1,s2,s3,done);
initial
begin
x0=4'b1111;
x1=4'b0111;
x2=4'b0011;
x3=4'b0001;
rst=1;
for(i=0;i<20;i=i+1)
    begin
    if(i==2) rst=0;
    clk=0;
    #5;
    clk=1;
    #5;
    end

end
endmodule
