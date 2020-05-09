`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/21 19:05:25
// Design Name: 
// Module Name: tb_main
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


module tb_main();
reg clk;
reg [5:0]a;
reg [5:0]b;
reg [2:0]s;
wire [2:0]f;
wire [5:0]y;
integer i;
main DUT(clk,a,b,s,f,y);
initial
begin
s=3'b000;
    for(i=0;i<20;i=i+1)
    begin
    if(i==1)begin s=3'b000; a=6'b000001;b=6'b000001; end
    if(i==2)begin s=3'b000; a=6'b100000;b=6'b100000; end
    if(i==3)begin s=3'b001; a=6'b000001;b=6'b000001; end
    if(i==4)begin s=3'b001; a=6'b000001;b=6'b100000; end
    if(i==5)begin s=3'b010; a=6'b010000;b=6'b010000; end
    if(i==6)begin s=3'b010; a=6'b000001;b=6'b111111; end
    if(i==7)begin s=3'b011; a=6'b000001;b=6'b010000; end
    if(i==8)begin s=3'b011; a=6'b111111;b=6'b011111; end
    if(i==9)begin s=3'b100; a=6'b010101;b=6'b101010; end
    if(i==10)begin s=3'b101; a=6'b010101;b=6'b101010; end
    if(i==11)begin s=3'b110; a=6'b010101;b=6'b101010; end
    if(i==12)begin s=3'b111; a=6'b010101;b=6'b101010; end
    
    
    clk=0;
    #10;
    clk=1;
    #10;
    end
end
endmodule
