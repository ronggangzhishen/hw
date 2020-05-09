`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/22 12:01:57
// Design Name: 
// Module Name: fla
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


module fla(
    input clk,
    input [5:0]x,
    input [5:0]y,
    input clr,
    input en,
    output reg [15:0]r
    );
    reg t;
    reg [15:0]r1;
    reg [15:0]r2;
    always@(posedge clk)
    begin
        if(en)
        begin
            if(clr)
            begin
                t=0;
                r1=x;
                r2=y;
            end
            else
            begin
                if(~t)begin r1=r1+r2; r=r1; t=~t; end
                else  begin r2=r1+r2; r=r2; t=~t; end
            end
        end
    end
    
endmodule
