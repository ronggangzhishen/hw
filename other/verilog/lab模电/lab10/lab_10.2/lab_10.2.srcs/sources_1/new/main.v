`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/30 16:34:05
// Design Name: 
// Module Name: main
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


module main(
    input clk,
    input [1:0]x,
    input reset,
    output reg y
    );
    reg [1:0]st;
    reg [1:0]nst;
    parameter s0=2'b00,s1=2'b10,s2=2'b01,s3=2'b11;
        always@(negedge clk or posedge reset)
        if(reset)   st<=s0;
        else        st<=nst;
        
        always@(posedge clk)
        begin
            case(st)
            s0: if(x[1]==0) nst<=s0; else nst<=s3;
            s3: case(x)
                    2'b00: nst<=s2;
                    2'b11: nst<=s3;
                    default: nst<=s0; 
                endcase
            s2: case(x)
                     2'b00: nst<=s2;
                     2'b11: nst<=s2;
                     default: nst<=s1; 
                endcase
            s1: case(x)
                      2'b00: nst<=s0;
                      2'b11: nst<=s2;
                      default: nst<=s1; 
                endcase
            endcase
        end
        
        always@(st)
            begin
                case(st)
                s0: y<=0;
                s1: y<=1;
                s2: y<=1;
                s3: y<=0;
                endcase
            end
    
    
    
    
    
endmodule
