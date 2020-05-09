`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/18 18:51:03
// Design Name: 
// Module Name: vga
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


module vga(
    input clk100mhz,
    input [11:0]rgb,
    input [3:0]dir,
    input draw,
    input rst,
    output reg[11:0]vrgb,
    output hs,
    output vs
    );
    wire clk50mhz,clk5hz;
    reg [19:0]cnt1; //10_0000
    wire [15:0]addra,addrb;
    reg in,vga_HS, vga_VS;
    reg [10:0]CounterX;
    reg [9:0]CounterY;
    wire CounterXmaxed; // 800
    wire CounterYmaxed; // 600
    wire [11:0]dout;
    reg [7:0]x,y,bx,by;
    clk_wiz_0 DUT1 (.clk_in1(clk100mhz),.clk_out1(clk50mhz));
    always@(posedge clk50mhz)
    begin
        if(cnt1 >= 20'd100_0000) cnt1 <= 20'b0;
        else                    cnt1 <= cnt1+20'b1;
    end
    assign clk5hz = (cnt1 == 20'b1);
    blk_mem_gen_0 DUT2(.addra(addra),.clka(clk50mhz),.dina(rgb),.wea(draw),.addrb(addrb),.clkb(clk50mhz),.doutb(dout),.enb(in),.rstb(rst));
    //draw
    
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
    always @(posedge clk50mhz)
    begin
        in <= (CounterX < 529) && (CounterY < 429) && (CounterX > 271) && (CounterY > 171);
    end
    assign hs = ~vga_HS;
    assign vs = ~vga_VS;
    assign addrb=(CounterX-272)*256+(CounterY-172);
    assign addra=x*256+y;
    
    always @(posedge clk5hz)                        //paint
    begin
        if(rst)
        begin
            x<=8'd128;
            y<=8'd128;
        end
        else
        begin
            if(dir[0]) y<=y-8'b1;
            if(dir[1]) x<=x-8'b1;
            if(dir[2]) x<=x+8'b1;
            if(dir[3]) y<=y+8'b1;
        end
    end
    always @(posedge clk50mhz)
    begin
        if(in)
        begin
            if(x+270<CounterX && x+276>CounterX && y+172==CounterY ||
            y+169<CounterY && y+175>CounterY && x+273==CounterX)
            vrgb<=12'hfff;
            else
            vrgb<=dout;
        end
        else
            vrgb<=12'b0;
    end
endmodule
