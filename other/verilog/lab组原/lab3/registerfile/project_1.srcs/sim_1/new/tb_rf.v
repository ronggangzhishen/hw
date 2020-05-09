`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/12 19:56:23
// Design Name: 
// Module Name: tb_rf
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


module tb_rf();
    reg [3:0]in;
    reg en_in;
    reg [2:0]w1,r1,r2;
    reg clk;
    wire [3:0]out1,out2;
    integer i;
    registerfile DUT(r1,r2,w1,in,en_in,clk,out1,out2);
    initial
    begin
    en_in=0;
    r1=3'b000;
    r2=3'b000;
    w1=3'b000;
        for(i=0;i<=80;i=i+1)
        begin
            clk=0;
            #5;
            clk=1;
            #5;
            if(i==1) en_in=1; 
            if(i==2) in=4'b1111;
            if(i==3) w1=3'b001;
            if(i==4) w1=3'b010;
            if(i==5) w1=3'b011;
            if(i==6) w1=3'b100;
            if(i==7) r1=3'b001;
            if(i==8) r2=3'b011;
            if(i==10) en_in=0;
            
        end
    end
endmodule
