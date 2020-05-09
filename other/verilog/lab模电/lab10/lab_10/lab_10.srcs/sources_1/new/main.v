`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/30 14:15:10
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
    input x,
    input reset,
    output reg parity,
    output reg [1:0]state
    );
    //reg [1:0]state;
    reg [1:0]nextstate;
    parameter s1=2'b00,s2=2'b01,s3=2'b10;
    always@(negedge clk)
    if(reset)   state<=s1;
    else        state<=nextstate;
    
    always@(posedge clk)
    begin
        case(state)
        s1: if(x) nextstate<=s2; else nextstate<=s1;
        s2: if(x) nextstate<=s3; else nextstate<=s2;
        s3: if(x) nextstate<=s1; else nextstate<=s3;
        endcase
    end
    
    always@(posedge clk)
        begin
            case(state)
            s1: parity<=0;
            s2: parity<=0;
            s3: if(x) parity<=1; else parity<=0;
            endcase
        end
endmodule
