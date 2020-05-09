`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/16 14:32:16
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
    input clk_in1,
    input reset,
    input enable,
    input [3:0]v,
    output reg G,
    output locked,
    output reg [7:0]AN,
    output reg [6:0]seg
    );
    reg [3:0]x;
    reg [3:0]y;
    wire pulse;
    wire clk_out1;
    reg	[13:0]	cnt; 	//计数周期为5 000 000的计数器
        //每5 000 000个周期一个高电平信号
    clk_wiz_0  DUT(
       // Clock in ports
        .clk_in1(clk_in1),      // input clk_in1
        // Clock out ports
        .clk_out1(clk_out1),     // output clk_out1
        // Status and control signals
        .reset(reset), // input reset
        .locked(locked));
    always@(posedge clk_out1)
    begin 
        if(reset)
            cnt    <= 14'h0;
        if(enable)
        begin
        if(cnt >= 14'd10000)
            cnt    <= 14'h0;
        else
            cnt    <= cnt + 14'h1;
        end
    end
    assign        pulse =  (cnt >= 14'd5000) ? 1'b1 : 1'b0;
    always@(posedge pulse)      //500hz
    begin
    if(v>=4'b1010)
        begin
        x=v-4'b1010;
        //y=4'b0001;
        end
    else
        begin
        x=v;
        //y=4'b0000;
        end
    if(G == 0)                      //ge wei
    begin
    AN=8'b11111110;
    seg[0]=(x[0]&~x[1]&~x[2]&~x[3])|(~x[0]&~x[1]&x[2]&~x[3]);
    seg[1]=(x[0]&~x[1]&x[2]&~x[3])|(~x[0]&x[1]&x[2]&~x[3]);
    seg[2]=(~x[0]&x[1]&~x[2]&~x[3]);
    seg[3]=(x[0]&~x[1]&~x[2]&~x[3])|(~x[0]&~x[1]&x[2]&~x[3])|(x[0]&x[1]&x[2]&~x[3]);
    seg[4]=(x[0])|(~x[0]&~x[1]&x[2]);
    seg[5]=(x[0]&~x[2]&~x[3])|(x[1]&~x[2]&~x[3])|(x[0]&x[1]&~x[3]);
    seg[6]=(x[0]&x[1]&x[2]&~x[3])|(~x[1]&~x[2]&~x[3]);
    G=~G;
    end
    else                            //SHI WEI
        begin
        AN=8'b11111101;
        if(v[3]&&(v[2]||v[1]))
            begin
        seg[0]=1;
        seg[1]=0;
        seg[2]=0;
        seg[3]=1;
        seg[4]=1;
        seg[5]=1;
        seg[6]=1;
            end
        else
            begin
            seg[0]=0;
            seg[1]=0;
            seg[2]=0;
            seg[3]=0;
            seg[4]=0;
            seg[5]=0;
            seg[6]=1;
            end
        G=~G;
        end
    end
endmodule
