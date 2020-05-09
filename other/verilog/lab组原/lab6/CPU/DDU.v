`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/06 13:11:16
// Design Name: 
// Module Name: DDU
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


module DDU(
    input clk100M,
    input select,
    input rst,
    input cont,
    input step,
    //input mem,
    input inc,
    input dec,
    input [15:0]in,
    output [15:0] led,
    output reg [7:0] an,
    output reg [6:0] seg,
    output reg [11:0]vrgb,
    output hs,
    output vs
    );
    parameter length=50;
    reg run;
    reg [7:0] addr;
    wire [7:0] pc;
    wire [31:0] mem_data;
    wire [31:0] reg_data [7:0];
    wire [31:0] data;

    wire clk1k;
    reg step1,inc1,dec1;
    wire clk50mhz;
	reg [9:0]cnt;
    wire [6:0] seg0,seg1,seg2,seg3,seg4,seg5,seg6,seg7;
    
    wire [7:0]en;
    wire EN;
    reg vga_HS, vga_VS;
    reg [10:0]CounterX;
    reg [9:0]CounterY;
    wire CounterXmaxed; // 800
    wire CounterYmaxed; // 600
    clk_wiz_1 DUT1 (.clk_in1(clk100M),.clk_out1(clk50mhz));
    frequency frequency(clk50mhz,1,clk1k);   
    CPU top(clk1k,run,pc,addr,addr[4:0],rst,in,mem_data,
    reg_data[0],
    reg_data[1],
    reg_data[2],
    reg_data[3],
    reg_data[4],
    reg_data[5],
    reg_data[6],
    reg_data[7]
    );
    display#(30,1) display0(reg_data[0],CounterX[9:0],CounterY[8:0],en[0]);
    display#(30,3) display1(reg_data[1],CounterX[9:0],CounterY[8:0],en[1]);
    display#(30,5) display2(reg_data[2],CounterX[9:0],CounterY[8:0],en[2]);
    display#(30,7) display3(reg_data[3],CounterX[9:0],CounterY[8:0],en[3]);
    display#(30,9) display4(reg_data[4],CounterX[9:0],CounterY[8:0],en[4]);
    display#(30,11) display5(reg_data[5],CounterX[9:0],CounterY[8:0],en[5]);
    display#(30,13) display6(reg_data[6],CounterX[9:0],CounterY[8:0],en[6]);
    display#(30,15) display7(reg_data[7],CounterX[9:0],CounterY[8:0],en[7]);
    
    ////led
    assign led = {pc,addr};
    ////7
    assign data=mem_data;
    BCD7 bit0(data[3:0],0,seg0);
    BCD7 bit1(data[7:4],0,seg1);
    BCD7 bit2(data[11:8],0,seg2);
    BCD7 bit3(data[15:12],0,seg3);
    BCD7 bit4(data[19:16],0,seg4);
    BCD7 bit5(data[23:20],0,seg5);
    BCD7 bit6(data[27:24],0,seg6);
    BCD7 bit7(data[31:28],0,seg7);
    always@(posedge clk1k)
            begin
            //if(|cnt && plug) cnt<=cnt+1;
            case(an)
            8'b11111110:begin an<=8'b11111101;seg<=seg1;end
            8'b11111101:begin an<=8'b11111011;seg<=seg2;end
            8'b11111011:begin an<=8'b11110111;seg<=seg3;end
            8'b11110111:begin an<=8'b11101111;seg<=seg4;end
            8'b11101111:begin an<=8'b11011111;seg<=seg5;end
            8'b11011111:begin an<=8'b10111111;seg<=seg6;end
            8'b10111111:begin an<=8'b01111111;seg<=seg7;end
            8'b01111111:begin an<=8'b11111110;seg<=seg0;end
            default:an<=8'b01111111;
            endcase
            end
    ////vga
    assign CounterXmaxed = (CounterX == 1040); // 800
    assign CounterYmaxed = (CounterY == 666); // 600
    always @(posedge clk50mhz)
    if (CounterXmaxed)
      CounterX <= 0;
    else
      CounterX <= CounterX + 1;
    always @(posedge clk50mhz)
    begin
      if (CounterXmaxed)
      begin
        if(CounterYmaxed)
          CounterY <= 0;
        else
          CounterY <= CounterY + 1;
      end
    end
    always @(posedge clk50mhz)
    begin
      vga_HS <= (CounterX > 856 && (CounterX < 976));   // active for 120 clocks
      vga_VS <= (CounterY > 637 && (CounterY < 643));   // active for 6 clocks
    end
    assign hs = ~vga_HS;
    assign vs = ~vga_VS;
    //
    /*wire [7:0]en0;
    vga b07 (seg7,CounterX[9:0],CounterY[8:0],length*1,length*1,en0[7]);
	vga b06 (seg6,CounterX[9:0],CounterY[8:0],length*2,length*1,en0[6]);
	vga b05 (seg5,CounterX[9:0],CounterY[8:0],length*3,length*1,en0[5]);
	vga b04 (seg4,CounterX[9:0],CounterY[8:0],length*4,length*1,en0[4]);
	vga b03 (seg3,CounterX[9:0],CounterY[8:0],length*5,length*1,en0[3]);
	vga b02 (seg2,CounterX[9:0],CounterY[8:0],length*6,length*1,en0[2]);
	vga b01 (seg1,CounterX[9:0],CounterY[8:0],length*7,length*1,en0[1]);
	vga b00 (seg0,CounterX[9:0],CounterY[8:0],length*8,length*1,en0[0]);*/
	assign EN=|en;
	always @(posedge clk50mhz)
    begin
        if(EN)
        begin
            vrgb<=12'hfff;
        end
        else
            vrgb<=12'b0;
    end
    //////
    ////
    
    ////move
    always @ (posedge clk1k or posedge rst)
    begin
        if(rst)
            addr <= 8'b0;
        else 
        begin
            if (inc == 1 && inc1 == 0)
            begin
                inc1 <= 1;
                addr <= addr + 1;
            end
            else if (inc == 0 && inc1 == 1)
                inc1 <= 0;
            if (dec == 1 && dec1 == 0)
            begin
                dec1 <= 1;
                addr <= addr - 1;
            end
            else if (dec == 0 && dec1 == 1)
                dec1 <= 0;
        end
    end
    
    always @ (posedge clk1k or posedge rst)
    begin 
        if(rst)
            run <= 0;
        else if (cont == 1)
            run <= 1;
        /*else if (in[15] == 1)
			begin
			if(cnt > {in[3:0],6'b0})
				cnt <= 10'b0;
			else cnt <= cnt + 10'b1;
			run <= cnt==10'b1?1:0;
			end*/
		else
        begin 
            if (step == 1 && step1 == 0)
            begin
                step1 <= 1;
                run <= 1;
            end
            else if (step == 1 && step1 == 1)
                run <= 0;
            else if (step == 0 && step1 == 1)
                step1 <= 0;
        end    
    end    
endmodule

module display#(parameter length=30,Y=1)(
    input [31:0]data,
    input [9:0]CounterX,
    input [8:0]CounterY,
    output EN
    );
    wire [6:0] seg [7:0];
    wire [7:0]en0;
    BCD7 bit00(data[3:0],0,seg[0]);
    BCD7 bit01(data[7:4],0,seg[1]);
    BCD7 bit02(data[11:8],0,seg[2]);
    BCD7 bit03(data[15:12],0,seg[3]);
    BCD7 bit04(data[19:16],0,seg[4]);
    BCD7 bit05(data[23:20],0,seg[5]);
    BCD7 bit06(data[27:24],0,seg[6]);
    BCD7 bit07(data[31:28],0,seg[7]);
    vga b07 (seg[7],CounterX[9:0],CounterY[8:0],length*1,length*Y,en0[7]);
	vga b06 (seg[6],CounterX[9:0],CounterY[8:0],length*2,length*Y,en0[6]);
	vga b05 (seg[5],CounterX[9:0],CounterY[8:0],length*3,length*Y,en0[5]);
	vga b04 (seg[4],CounterX[9:0],CounterY[8:0],length*4,length*Y,en0[4]);
	vga b03 (seg[3],CounterX[9:0],CounterY[8:0],length*5,length*Y,en0[3]);
	vga b02 (seg[2],CounterX[9:0],CounterY[8:0],length*6,length*Y,en0[2]);
	vga b01 (seg[1],CounterX[9:0],CounterY[8:0],length*7,length*Y,en0[1]);
	vga b00 (seg[0],CounterX[9:0],CounterY[8:0],length*8,length*Y,en0[0]);
	assign EN=|en0;
endmodule

module BCD7 (
    input [3:0] x,
    input flag,
    output reg [6:0] seg
    );
    always @ *
    begin
    if(flag) seg=7'b1111111;
    else
    case(x)
    4'b0000:seg=7'b1000000;
    4'b0001:seg=7'b1111001;
    4'b0010:seg=7'b0100100;
    4'b0011:seg=7'b0110000;
    4'b0100:seg=7'b0011001;
    4'b0101:seg=7'b0010010;
    4'b0110:seg=7'b0000010;
    4'b0111:seg=7'b1111000;
    4'b1000:seg=7'b0000000;
    4'b1001:seg=7'b0010000;
    4'b1010:seg=7'b0001000;
    4'b1011:seg=7'b0000011;
    4'b1100:seg=7'b1000110;
    4'b1101:seg=7'b0100001;
    4'b1110:seg=7'b0000110;
    4'b1111:seg=7'b0001110;
    endcase
    end   
endmodule
module vga #(parameter size=25)(
    input [6:0] seg,
    input [9:0]cx,
    input [8:0]cy,
    input [9:0]x,
    input [8:0]y,
    output EN
    );
    //parameter size=40;
    wire [6:0]en;
    assign en[0]=~seg[0]&(cx>x)&(cx<x+size)&(cy==y);
    assign en[1]=~seg[1]&(cx==x+size)&(cy<y+size)&(cy>y);
    assign en[2]=~seg[2]&(cx==x+size)&(cy<y+2*size)&(cy>y+size);
    assign en[3]=~seg[3]&(cx>x)&(cx<x+size)&(cy==y+2*size);
    assign en[4]=~seg[4]&(cx==x)&(cy<y+2*size)&(cy>y+size);
    assign en[5]=~seg[5]&(cx==x)&(cy<y+size)&(cy>y);
    assign en[6]=~seg[6]&(cx>x)&(cx<x+size)&(cy==y+size);
    assign EN=|en;
endmodule
module frequency(
    input clk50mhz,
    input enable,
    output pulse
    );
    wire clk_out;
    reg [22:0] cnt;
    
    always@(posedge clk50mhz)
    begin
    if(enable)
    begin
        if(cnt>=23'd50000)
            cnt<=23'h0;
        else cnt<=cnt+23'h1; 
    end
    end
    assign pulse=(cnt==23'd1)?1:0;
endmodule