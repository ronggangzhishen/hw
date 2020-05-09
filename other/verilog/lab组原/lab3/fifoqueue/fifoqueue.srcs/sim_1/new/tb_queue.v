`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/12 18:45:54
// Design Name: 
// Module Name: tb_queue
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


module tb_queue();
    reg [3:0]in;
    reg en_out;
    reg en_in;
    reg rst;
    reg clk;
    //input clk100mhz,
    wire [3:0]out;
    wire empty;
    wire full;
    //output reg[7:0]AN,
    //output reg[6:0]seg,
    //output reg doc
    integer i;
    queue DUT1 (.in(in),.en_out(en_out),.en_in(en_in),.rst(rst),.clk1hz(clk),.out(out),.empty(empty),.full(full));
    initial
    begin
    rst=1;
    en_in=0;
    en_out=0;
        for(i=0;i<=80;i=i+1)
        begin
            clk=0;
            #5;
            clk=1;
            #5;
            if(i==1) rst=0; 
            if(i==2) in=4'b1111;
            if(i==3) en_in=1;
            if(i==13) en_in=0;
            if(i==14) en_out=1;
            
        end
    end
    
    
endmodule
