`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/28 19:03:13
// Design Name: 
// Module Name: alu
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


module alu(
    input [3:0]a,
    input [3:0]b,
    input [2:0]s,
    output reg [2:0]f,
    output reg [3:0]y
    );
    reg t;
    reg t1;
    reg t2;
    reg [3:0]ta;
    reg [3:0]tb;
    always @(*)
    begin
    case(s)
        3'b000://if(s == 3'b000)//unsigned +
        begin
        f[0]=0;
        f[1]=0; 
        {t,y}=a+b;
        if(t==1) f[1]=1;
        f[2]=~|y;
        end
        3'b001://else if(s == 3'b001)//unsigned -
        begin
        f[0]=0;
        f[1]=0;
        {t,y}=a-b;
        if(t==1) f[1]=1;
        y=a-b;
        f[2]=~|y;
        end
        3'b010://else if(s == 3'b010)//  signed +
        begin
        ta=a;
        tb=b;
        if(a[5]==1) ta=~a+6'b100000+1;
        if(b[5]==1) tb=~b+6'b100000+1;
        f[0]=0;
        f[1]=0;
        t1=ta[5]&tb[5];
        t2=ta[4]&tb[4];
        if(t1^t2)           f[0]=1;
        y=a+b;
        f[2]=~|y;
        end
        3'b011://else if(s == 3'b011)// signed -
        begin
        ta=a;
        tb=b;
        if(ta[5]==1) ta=~ta+6'b100000+1;
        tb[5]=~tb[5];
        if(tb[5]==1) tb=~tb+6'b100000+1;
        f[0]=0;
        f[1]=0;
        t1=ta[5]&tb[5];
        t2=ta[4]&tb[4];
        if(t1^t2)           f[0]=1;
        y=a+b;
        f[2]=~|y;
        end
        3'b100://else if(s == 3'b100)// |
        begin
        f[0]=0;
        f[1]=0;
        y=a|b;
        f[2]=~|y;
        end
        3'b101://else if(s == 3'b101)// &
        begin
        f[0]=0;
        f[1]=0;
        y=a&b;
        f[2]=~|y;
        end
        3'b110://else if(s == 3'b110)// ~
        begin
        f[0]=0;
        f[1]=0;
        y=~a;
        f[2]=~|y;
        end
        3'b111://else //if(s == 3'b111)// xor
        begin
        f[0]=0;
        f[1]=0;
        y=a^b;
        f[2]=~|y;
        end
    endcase
    end  
    
endmodule

