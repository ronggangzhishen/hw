`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/23 14:27:35
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
module myand#(parameter delay = 2)(
input a,
input b,
output c
);
assign #delay c=a&b; 
endmodule
module myor#(parameter delay=2)(
input a,
input b,
output c
);
assign #delay c=a|b; 
endmodule

module mynot#(parameter delay=2)(
input a,
output b
);
assign #delay b=~a; 
endmodule
module main(
    input a,
    input b,
    input ci,
    output s,
    output co
    );
    mynot#(1) not1(a,nota);
    mynot#(1) not2(b,notb);
    myand#(3) and1(a,notb,t1);
    myand#(3) and2(nota,b,t2);
    myor#(3) or1(t1,t2,s1);
        mynot#(1) not3(s1,nots1);
        mynot#(1) not4(ci,notci);
        myand#(3) and3(s1,notci,t3);
        myand#(3) and4(nots1,ci,t4);
        myor#(3) or2(t3,t4,s);
    myand#(3) and5(a,b,t5);
    myand#(3) and6(s1,ci,t6);
        myor#(3) or3(t5,t6,co);
        myor#(3) or4(t5,t6,co);
endmodule
