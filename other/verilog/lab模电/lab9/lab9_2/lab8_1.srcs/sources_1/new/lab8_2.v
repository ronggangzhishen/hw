`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/16 17:56:46
// Design Name: 
// Module Name: lab9_2
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


module lab9_2(
    input clk_in1,
    //input reset,
    input enable,
    input contral,
    output reg [7:0]led,
    input clear
    //output locked,
    //output reg [7:0]AN,
    //output reg [6:0]seg
    );
    wire [3:0]tx;
    wire [3:0]ty;
    reg [3:0]x;
    reg [3:0]y;
    reg G;
    wire co;
    reg pulse;
    reg hz;
    wire clk_out1;
    reg	[22:0]	cnt;
    reg [13:0] cnt2;
    wire ntemp;
    clk_wiz_0  DUT1(
        .clk_in1(clk_in1),
        .clk_out1(clk_out1),
        .reset(),
        .locked());
/*    c_counter_binary_0 DUT2(
        pulse,
        enable,
        clear,
        co,
        tx);
    c_counter_binary_1 DUT3(
                pulse,
                co,
                clear,
                ntemp,
                ty);    */
    always@(posedge clk_out1)   //1hz,¼ÆÊý
                    begin 
                       // if(reset)
                       //     cnt    <= 23'h0;
                        if(enable)
                        begin
                        if(cnt >= 23'd5_000_000)
                            cnt    <= 23'h0;
                        else
                            cnt    <= cnt + 23'h1;
                        end
                    end
  always@(cnt) pulse =  (cnt == 23'd1) ? 1'b1 : 1'b0;  //1hz
  always@(posedge pulse)
  begin
  if(clear)         //0 set
    led=8'b00000000;
  else
  begin
  if(enable)        //enable
  begin
    if(contral==1)  //+
    begin
        led=led+8'b1;
    end
    else            //-
    begin
        led=led-8'b1;
    end
    end
end    
  end
  /* always@(posedge clk_out1)       //1000hz,ÏÔÊ¾
        begin 
           // if(reset)
           //    cnt2    <= 14'h0;
            if(enable)
            begin
            if(cnt2 >= 14'd5000)
                cnt2    <= 14'h0;
            else
                cnt2    <= cnt2 + 14'h1;
            end
        end
   always@(cnt2)    hz =  (cnt2 >= 14'd2500) ? 1'b1 : 1'b0; // 1000hz   
    always@(posedge hz)
    begin
       if(G == 0)                      //ge wei
        begin
        AN=8'b11111110;
        x=tx;
        seg[0]=(x[0]&~x[1]&~x[2]&~x[3])|(~x[0]&~x[1]&x[2]&~x[3]);
        seg[1]=(x[0]&~x[1]&x[2]&~x[3])|(~x[0]&x[1]&x[2]&~x[3]);
        seg[2]=(~x[0]&x[1]&~x[2]&~x[3]);
        seg[3]=(x[0]&~x[1]&~x[2]&~x[3])|(~x[0]&~x[1]&x[2]&~x[3])|(x[0]&x[1]&x[2]&~x[3]);
        seg[4]=(x[0])|(~x[0]&~x[1]&x[2]);
        seg[5]=(x[0]&~x[2]&~x[3])|(x[1]&~x[2]&~x[3])|(x[0]&x[1]&~x[3]);
        seg[6]=(x[0]&x[1]&x[2]&~x[3])|(~x[1]&~x[2]&~x[3]);
        G=~G;
        end
       else
           begin
           AN=8'b11111101;             //shi wei
           y=ty;
           seg[0]=(y[0]&~y[1]&~y[2]&~y[3])|(~y[0]&~y[1]&y[2]&~y[3]);
           seg[1]=(y[0]&~y[1]&y[2]&~y[3])|(~y[0]&y[1]&y[2]&~y[3]);
           seg[2]=(~y[0]&y[1]&~y[2]&~y[3]);
           seg[3]=(y[0]&~y[1]&~y[2]&~y[3])|(~y[0]&~y[1]&y[2]&~y[3])|(y[0]&y[1]&y[2]&~y[3]);
           seg[4]=(y[0])|(~y[0]&~y[1]&y[2]);
           seg[5]=(y[0]&~y[2]&~y[3])|(y[1]&~y[2]&~y[3])|(y[0]&y[1]&~y[3]);
           seg[6]=(y[0]&y[1]&y[2]&~y[3])|(~y[1]&~y[2]&~y[3]);
           G=~G;
           end
     end */
endmodule
