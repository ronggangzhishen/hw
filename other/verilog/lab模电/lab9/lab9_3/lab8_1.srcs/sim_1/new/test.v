`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/16 20:01:07
// Design Name: 
// Module Name: test
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


module test();
    reg en;
    reg k;
    reg rst;
    reg clr;
    wire lok;
    wire [7:0]an;
    wire [6:0]seg;
    integer i;
    lab8_2 DUT9(.enable(en),.clk_in1(k),.reset(rst),.clear(clr),.locked(lok),.AN(an),.seg(seg));
    initial
    begin
        rst=0;
        en=1;
        clr=0;
        for(i=0;i<=100;i=i+1)
        begin
        if(k==10) clr=1;
        if(k==11) clr=0;
            #10 k=1;
            #10 k=0;
        end
        
        
    end
endmodule
