`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/11 18:26:38
// Design Name: 
// Module Name: queue
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


module queue(
    input [3:0]in,
    input en_out,
    input en_in,
    input rst,
    input clk100mhz,
    //input clk1hz,
    output reg[3:0]out,
    output empty,
    output full,
    output reg[7:0]AN,
    output reg[6:0]seg,
    output reg doc
    );
    wire clk5mhz,clk1khz;
    wire clk1hz;
    reg [9:0]cnt2;             //1000
    reg [16:0]cnt1;            //10000
    reg [3:0] regfile [7:0];
    reg [7:0]enreg;
    reg [2:0]head,rear;
    reg [2:0]st;
    reg [3:0]x;
    reg flag;
    clk_wiz_0 DUT1 (.clk_in1(clk100mhz),.clk_out1(clk5mhz));
    
    always@(posedge clk1khz)
    begin
        if(cnt2 >= 10'd1000)  cnt2 <= 10'd0;
        else                    cnt2 <= cnt2+1;
    end
    assign clk1hz = (cnt2 == 10'd0) ? 1'b1 : 1'b0;   //2hz
    
    always@(posedge clk5mhz)
    begin
        if(cnt1 >= 16'd2500)  cnt1 <= 16'd0;
        else                    cnt1 <= cnt1+1;
    end
    assign clk1khz = (cnt1 == 16'd0) ? 1'b1 : 1'b0;   //2khz
    
    always@(posedge clk1hz)                         //queue
    begin
        if(rst)
        begin
            head<=3'b000;
            rear<=3'b000;
            enreg<=8'b00000000;
        end
        else
        begin
            if(en_in && ~full)
                begin
                    regfile[rear]<=in;
                    enreg[rear]<=1;
                    if(rear==7) rear<=0;
                    else        rear<=rear+1;
                end
            else if(en_out && ~empty)
                begin
                    out<=regfile[head];
                    enreg[head]<=0;
                    if(head==7) head<=0;
                    else        head<=head+1;
                end
        end
    end
    assign empty=~|enreg;
    assign full=&enreg;
    
    always@(*)
    begin
    if(flag)
        case(x)
        4'b0000: seg=7'b1000000;
        4'b0001: seg=7'b1111001;
        4'b0010: seg=7'b0100100;
        4'b0011: seg=7'b0110000;
        4'b0100: seg=7'b0011001;
        4'b0101: seg=7'b0010010;
        4'b0110: seg=7'b0000010;
        4'b0111: seg=7'b1111000;
        4'b1000: seg=7'b0000000;
        4'b1001: seg=7'b0010000;
        4'b1010: seg=7'b0001000;
        4'b1011: seg=7'b0000011;
        4'b1100: seg=7'b1000110;
        4'b1101: seg=7'b0100001;
        4'b1110: seg=7'b0000110;
        4'b1111: seg=7'b0001110;
        endcase
    else    seg=7'b1111111;
    end
    always@(posedge clk1khz)                        //show
    begin
        case(st)
        3'b000:begin
                    flag<=enreg[st];
                    AN<=8'b0111_1111;
                    x<=regfile[st];
                    
                    doc <= (head == st) ? 1'b0:1'b1;
                    st<=3'b001;
               end
        3'b001:begin
                    flag<=enreg[st];
                    AN<=8'b1011_1111;
                    x<=regfile[st];
                    
                    doc <= (head == st) ? 1'b0:1'b1;
                    st<=3'b010;
               end
        3'b010:begin
                    flag<=enreg[st];
                    AN<=8'b1101_1111;
                    x<=regfile[st];
                    
                    doc <= (head == st) ? 1'b0:1'b1;
                    st<=3'b011;
               end
        3'b011:begin
                    flag<=enreg[st];
                    AN<=8'b1110_1111;
                    x<=regfile[st];
                    
                    doc <= (head == st) ? 1'b0:1'b1;
                    st<=3'b100;
               end
        3'b100:begin
                    flag<=enreg[st];
                    AN<=8'b1111_0111;
                    x<=regfile[st];
                    
                    doc <= (head == st) ? 1'b0:1'b1;
                    st<=3'b101;
               end
        3'b101:begin
                    flag<=enreg[st];
                    AN<=8'b1111_1011;
                    x<=regfile[st];
                    
                    doc <= (head == st) ? 1'b0:1'b1;
                    st<=3'b110;
               end
        3'b110:begin
                    flag<=enreg[st];
                    AN<=8'b1111_1101;
                    x<=regfile[st];
                    
                    doc <= (head == st) ? 1'b0:1'b1;
                    st<=3'b111;
               end
        3'b111:begin
                    flag<=enreg[st];
                    AN<=8'b1111_1110;
                    x<=regfile[st];
                    
                    doc <= (head == st) ? 1'b0:1'b1;
                    st<=3'b000;
               end
        endcase
    end
endmodule
