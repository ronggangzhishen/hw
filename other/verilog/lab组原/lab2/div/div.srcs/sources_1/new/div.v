`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/28 21:47:15
// Design Name: 
// Module Name: div
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


module div(
    input [3:0]tx,
    input [3:0]ty,
    input rst,
    input clk,
    output reg [3:0]q,
    output reg [3:0]r,
    output reg error,
    output reg done,
    output reg [1:0]st
    );
    reg [3:0]x;
    reg [4:0]y;
    reg [4:0]t;
    reg [3:0]tq;
    always @(posedge clk)
    begin
    if(rst)
        begin
        x=tx;
        y={1'b0,ty};
        q=0;
        r=0;
        tq=0;
        error=0;
        done=0;
        t={1'b0,x}-y;
        if(t[4] || ~|y)     st=2'b10;
        else     st=2'b00;
        end
    else
        begin
        case(st)//不算rst赋初值，只有三个状态
        2'b00:begin
                    y=y<<1;
                    if(~|tq)    tq=4'b0001;
                    else        tq=tq<<1;
                    t={1'b0,x}-y;
                    if(t[4] )   st=2'b01;
                    else        st=2'b00;
                end
        2'b01:begin
                        x=x-(y>>1);
                        y=ty;
                        q=q+tq;
                        tq=0;
                        t={1'b0,x}-y;
                        if(t[4] )
                            st=2'b10;
                        else
                            st=2'b00;
                end
        2'b10:begin
                    if(~|y) error=1;
                    r=x;
                    done=1;
                    st=2'b11;//st不再改变，结束
                end
        2'b11: ;
        endcase
        end
    end
    
    //always @(negedge clk)
    //    st<=nst;
        
endmodule
