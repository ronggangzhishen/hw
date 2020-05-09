`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/23 15:11:57
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
reg a;
reg b;
reg ci;
wire s;
wire co;
integer k;
main DUT (a,b,ci,s,co);
initial
begin
    for(k=0;k<8;k=k+1)
    begin
        #15 {ci,b,a}=k;
    end
end
endmodule
