`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/16 17:56:46
// Design Name: 
// Module Name: lab8_2
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


module lab8_2(
    input clk_in1,
    //input reset,
    input enable,
    input clear,
    //output reg G,
    //output locked,
    output reg [7:0]AN,
    output reg [6:0]seg,
    output reg point
    );
    wire [3:0]tx;
    wire [3:0]ty;
    wire [2:0]tz;
    wire [2:0]tm;
    reg [3:0]x;
    reg [3:0]y;
    reg [2:0]z;
    reg [2:0]m;
    reg [1:0]G;
    wire co1;
    wire co2;
    wire co3;
    reg pulse;
    reg clk2;
    reg hz;
    wire clk_out1;
    reg	[22:0]	cnt;
    reg [13:0] cnt2;
    reg [25:0] cnt3;
    clk_wiz_0  DUT1(
       // Clock in ports
        .clk_in1(clk_in1),      // input clk_in1
        // Clock out ports
        .clk_out1(clk_out1),     // output clk_out1
        // Status and control signals
        .reset(), // input reset
        .locked());
    c_counter_binary_4 DUT2(
        .CLK(pulse),
        .CE(enable),
        .SCLR(clear),
        .THRESH0(co1),          //1s
        .Q(tx));
    c_counter_binary_5 DUT3(
            .CLK(pulse),
            .CE(co1),
            .SCLR(clear),
            .THRESH0(co2),          //10s
            .Q(ty));
        c_counter_binary_2 DUT4(
                        .CLK(pulse),
                        .CE(co1&co2),
                        .SCLR(clear),
                        .THRESH0(co3),  //60s
                        .Q(tz));
            c_counter_binary_3 DUT5(
                                    .CLK(pulse),
                                    .CE(co1&co2&co3),
                                    .SCLR(clear),
                                    .THRESH0(),
                                    .Q(tm));
    always@(posedge clk_out1)   //¼ÆÊı
                    begin 
                        if(cnt >= 23'd50_0000)
                            cnt    <= 23'h0;
                        else
                            cnt    <= cnt + 23'h1;
                        //end
                    end
  always@(cnt) pulse =  (cnt == 23'd1) ? 1'b1 : 1'b0;  //10hz
  always@(posedge clk_out1)       //1000hz,ÏÔÊ¾
        begin 
            if(cnt2 >= 14'd5000)
                cnt2    <= 14'h0;
            else
                cnt2    <= cnt2 + 14'h1;
            //end
        end
   always@(cnt2)    hz =  (cnt2 >= 14'd2500) ? 1'b1 : 1'b0; // 1000hz   
    always@(posedge hz)
    begin
       if(G == 2'b00)                      //0.1s
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
        point=1;
        G=2'b01;
        end
       else if(G == 2'b01)
           begin
           AN=8'b11111101;             //s.ge
           y=ty;
           seg[0]=(y[0]&~y[1]&~y[2]&~y[3])|(~y[0]&~y[1]&y[2]&~y[3]);
           seg[1]=(y[0]&~y[1]&y[2]&~y[3])|(~y[0]&y[1]&y[2]&~y[3]);
           seg[2]=(~y[0]&y[1]&~y[2]&~y[3]);
           seg[3]=(y[0]&~y[1]&~y[2]&~y[3])|(~y[0]&~y[1]&y[2]&~y[3])|(y[0]&y[1]&y[2]&~y[3]);
           seg[4]=(y[0])|(~y[0]&~y[1]&y[2]);
           seg[5]=(y[0]&~y[2]&~y[3])|(y[1]&~y[2]&~y[3])|(y[0]&y[1]&~y[3]);
           seg[6]=(y[0]&y[1]&y[2]&~y[3])|(~y[1]&~y[2]&~y[3]);
           point=0;
           G=2'b10;
           end
           else if(G == 2'b10)
                      begin
                      AN=8'b1111_1011;             //s.shi
                      z=tz;
                      case(z)
                      3'b000:seg=7'b100_0000;
                      3'b001:seg=7'b111_1001;
                      3'b010:seg=7'b010_0100;
                      3'b011:seg=7'b011_0000;
                      3'b100:seg=7'b001_1001;
                      3'b101:seg=7'b001_0010;
                      endcase
                      point=1;
                      G=2'b11;
                      end
              else
                                 begin
                                 AN=8'b1111_0111;             //min
                                 m=tm;
                                 case(m)
                                 3'b000:seg=7'b100_0000;
                                 3'b001:seg=7'b111_1001;
                                 3'b010:seg=7'b010_0100;
                                 3'b011:seg=7'b011_0000;
                                 3'b100:seg=7'b001_1001;
                                 endcase
                                 point=0;
                                 G=2'b00;
                                 end
     end
endmodule
