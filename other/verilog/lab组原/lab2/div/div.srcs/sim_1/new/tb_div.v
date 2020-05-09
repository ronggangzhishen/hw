`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/29 09:03:30
// Design Name: 
// Module Name: tb_div
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


module tb_div();
reg [3:0]x,y;
reg clk,rst;
wire [3:0]q,r;
//wire [4:0]tx,ty;
wire done,error;
integer i;
wire [1:0]st;
div DUT(x,y,rst,clk,q,r,error,done,st);

initial
begin
rst=1;
for(i=0;i<80;i=i+1)
begin
if(i==1) begin x=4'b1111; y=4'b0001; end
if(i==2) begin rst=0; end
if(i==20) begin x=4'b1111; y=4'b000; rst=1;end
if(i==21) begin rst=0; end
if(i==25) begin x=4'b0111; y=4'b1000; rst=1;end
if(i==26) begin rst=0; end
if(i==28) begin x=4'b1111; y=4'b0010; rst=1;end
if(i==29) begin rst=0; end
clk=0;
#5;
clk=1;
#5;
end

end


endmodule
