`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/28 08:49:44
// Design Name: 
// Module Name: sort
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


module sort(
    input [3:0]x0,
    input [3:0]x1,
    input [3:0]x2,
    input [3:0]x3,
    input rst,
    input clk,
    output reg [3:0]s0,
    output reg [3:0]s1,
    output reg [3:0]s2,
    output reg [3:0]s3,
    output reg done
    );
    reg [2:0]state;
    reg [3:0]t,ta,tb;
    reg f;
    //reg [2:0]s;
    //alu A1(.a(ta),.b(tb),.s(s),.f(f));
    always @(posedge clk)
    begin
        if(~rst) begin 
                    done=0;
                    s0=x0;
                    s1=x1;
                    s2=x2;
                    s3=x3;
                    ta=0;
                    tb=0;
                    //s=3'b001;
                    state=3'b000;
                end
        else    //sort
        begin
            case(state)
            3'b000:begin
                        ta=s3; tb=s2;
                        {f,t}=ta-tb;
                        if(f)begin t=s2; s2=s3; s3=t; end
                        state=3'b001;
                    end
            3'b001:begin
                        ta=s2; tb=s1;
                        {f,t}=ta-tb;
                        if(f)begin t=s1; s1=s2; s2=t; end
                        state=3'b010;
                    end
            3'b010:begin
                        ta=s1; tb=s0;
                        {f,t}=ta-tb;
                        if(f)begin t=s0; s0=s1; s1=t; end
                        state=3'b011;
                    end
            3'b011:begin
                        ta=s3; tb=s2;
                        {f,t}=ta-tb;
                        if(f)begin t=s2; s2=s3; s3=t; end
                        state=3'b100;
                    end
            3'b100:begin
                        ta=s2; tb=s1;
                        {f,t}=ta-tb;
                        if(f)begin t=s1; s1=s2; s2=t; end
                        state=3'b101;
                    end
            3'b101:begin
                        ta=s3; tb=s2;
                        {f,t}=ta-tb;
                        if(f)begin t=s2; s2=s3; s3=t; end
                        state=3'b110;
                        done=1;
                    end
            default: ;
            endcase     
        end
    end
    
    
endmodule
