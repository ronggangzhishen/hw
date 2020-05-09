`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/07 14:15:40
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
    input clk100mhz,
    input gamemode,
    input policelevel,
    input w,
    input s,
    input a,
    input d,
    input pw,
    input ps,
    input pa,
    input pd,
    output ppw,
    output pps,
    output ppa,
    output ppd,
    //input [3:0]level,
    input start,
    output reg [7:0]AN,
    output reg [6:0]seg,
    output reg [2:0]px,
    output reg [2:0]tx,
    output reg [1:0]py,
    output reg [1:0]ty
    );
    
    reg [22:0]cnt1;
    reg [21:0]cnt3;
    reg [12:0]cnt2;
    reg [4:0]cnttime;
    reg [2:0]cas;
    reg arrest;
    wire clk5mhz;
    reg clk1,clk2,clks;
    clk_wiz_0 DUT1 (.clk_in1(clk100mhz),.clk_out1(clk5mhz));
    
    always@(posedge clk5mhz)
    begin
        if(cnt1 >= 23'd500_0000)    //level
            cnt1<=0;
        else
            cnt1<=cnt1+1;
    end
        always@(cnt1) clk1=(cnt1==1)?1:0;    // 4*level hz,police
            always@(posedge clk5mhz)
        begin
            if(cnt3 >= 23'd250_0000)    //level
                cnt3<=0;
            else
                cnt3<=cnt3+1;
        end
            always@(cnt3) clk2=(cnt3==1)?1:0;   //2*level hz,thief
    always@(posedge clk5mhz)
            begin
                if(cnt2 >= 13'd5000)    //level
                    cnt2<=0;
                else
                    cnt2<=cnt1+1;
            end
                always@(cnt2) clks=(cnt2==1)?1:0;//1000hz,显示用
                
    always@(posedge clk2)              
    begin
        if(start == 1)          // 初始化
        begin
            px=3'b000; py=2'b00;
            tx=3'b100; ty=2'b01;
            cnttime=5'b00000;
            arrest=1'b0;
        end
        else                        //as for thief
        begin
        if(w==1) begin
            if(ty==0) ty<=2;
            else     ty<=ty-1;
        end
            else if(s==1) begin    
                if(ty==2) ty<=0;
                else     ty<=ty+1;
            end
                else if(a==1) begin        
                        if(tx==0) tx<=7;
                        else     tx<=tx-1;
                end
                    else if(d==1) begin                
                                if(tx==7) tx<=0;
                                else     tx<=tx+1;
                    end
            if(gamemode==0)     //频率相同时的双人对战模式，15s胜利
            begin
                     cnttime=cnttime+1;
                        if(px==tx&&py==ty) arrest=1;    //
                                        if(pw==1) begin
                                            if(py==0) py<=2;
                                            else     py<=py-1;
                                        end
                                            else if(ps==1) begin    
                                                if(py==2) py<=0;
                                                else     py<=py+1;
                                            end
                                                else if(pa==1) begin        
                                                        if(px==0) px<=7;
                                                        else     px<=px-1;
                                                end
                                                    else if(pd==1) begin                
                                                                if(px==7) px<=0;
                                                                else     px<=px+1;
                                                    end
               end
       end
    end
    always@(posedge clk1)        //as for police
                                 //gamemode=1，玩家为小偷对抗电脑的警察,30s胜利
    begin//只会巡逻的警察
      if(policelevel==0)
      begin
        if(px<7) px=px+1;
        else  px=0;
        if(py<2) py=py+1;
        else py=0;
        if(px==tx&&py==ty) arrest=1;
      end
          else // 稍微聪明一些的警察，会根据小偷位置移动
          begin
            if(px==0)
            begin
                if(tx==0)
                begin
                    case(py)
                    2'd0: if(ty==0) arrest<=1; else py<=1;
                    2'd1: if(ty==1) arrest<=1; else py<=2;
                    2: if(ty==2) arrest<=1; else py<=0;
                    endcase
                end
                else if(tx<=4) px<=1;
                else    px<=7;
            end
            else if(px==1)
            begin
                if(tx==1)
                begin
                    case(py)
                0: if(ty==0) arrest<=1; else py<=1;
                1: if(ty==1) arrest<=1; else py<=2;
                2: if(ty==2) arrest<=1; else py<=0;
                endcase
                end
                else if(tx<=5&&tx>1) px<=2;
                else    px<=0;
            end
            else if(px==2)
            begin
                if(tx==2)
                begin
                    case(py)
                0: if(ty==0) arrest<=1; else py<=1;
                1: if(ty==1) arrest<=1; else py<=2;
                2: if(ty==2) arrest<=1; else py<=0;
                endcase
                end
                else if(tx<=6&&tx>2) px<=3;
                else    px<=1;
            end
            else if(px==3)
            begin
                if(tx==3)
                begin
                    case(py)
                0: if(ty==0) arrest<=1; else py<=1;
                1: if(ty==1) arrest<=1; else py<=2;
                2: if(ty==2) arrest<=1; else py<=0;
                endcase
                end
                else if(tx<=7&&tx>3) px<=4;
                else    px<=2;
            end
            else if(px==4)
            begin
                if(tx==4)
                begin
                    case(py)
                0: if(ty==0) arrest<=1; else py<=1;
                1: if(ty==1) arrest<=1; else py<=2;
                2: if(ty==2) arrest<=1; else py<=0;
                endcase
                end
                else if(tx<=7&&tx>4) px<=5;
                else    px<=3;
            end
            else if(px==5)
            begin
                if(tx==5)
                begin
                    case(py)
                0: if(ty==0) arrest<=1; else py<=1;
                1: if(ty==1) arrest<=1; else py<=2;
                2: if(ty==2) arrest<=1; else py<=0;
                endcase
                end
                else if(tx>=1&&tx<5) px<=4;
                else    px<=6;
            end
            else if(px==6)
            begin
                if(tx==6)
                begin
                    case(py)
                0: if(ty==0) arrest<=1; else py<=1;
                1: if(ty==1) arrest<=1; else py<=2;
                2: if(ty==2) arrest<=1; else py<=0;
                endcase
                end
                else if(tx>=2&&tx<6) px<=5;
                else    px<=7;
            end
            else //if(px==7)
            begin
                if(tx==7)
                begin
                    case(py)
                0: if(ty==0) arrest<=1; else py<=1;
                1: if(ty==1) arrest<=1; else py<=2;
                2: if(ty==2) arrest<=1; else py<=0;
                endcase
                end
                else if(tx>=3&&tx<7) px<=6;
                else    px<=0;
            end
          end
             /*最聪明的警察，按照最短路径移动，但是没有来得及调出来
                   if(px == tx) begin
                       if(py==ty) arrest=1'b1;    //warning
                       else if(py<ty) begin
                           if(py==ty-1) py=py+1;
                           else         py=2;
                           end
                       else begin   //py>ty
                           if(py==ty+1) py=py-1;
                           else         py=0;
                           end
                   end
                   else if(px<tx) begin
                       if(tx-px <= 3'b100) px=px+1;
                       else if(px==0) px=7;
                       else           px=px-1;
                   end
                   else begin  //px>tx
                       if(px-tx <= 3'b100) px=px-1;
                       else if(px==7) px=0;
                       else           px=px+1;
                   end*/
    end
    //assign ppw=pw;  //体现出点到了什么键
    //assign pps=ps;
    //assign ppa=pa;
    //assign ppd=pd;
    
    
    
    
    /*用假时钟上升沿控制thief移动，bug
    always@(w)                  //as for thief
    begin
        if(ty==0) ty=2;
        else     ty=ty-1;
    end
    always@(s)
    begin
        if(ty==2) ty=0;
        else     ty=ty+1;
    end
    always@(a)
    begin
        if(tx==0) tx=7;
        else     tx=tx-1;
    end
    always@(d)
    begin
        if(tx==7) tx=0;
        else     tx=tx+1;
    end
    */
    always@(posedge clks)       //show
    begin
        if(arrest==1)           //you loss
        begin
            if(cas==0) begin
            AN=8'b0111_1111;
            seg=7'b001_0001;
            cas=1;
            end
            else if(cas==1) begin
            AN=8'b1011_1111;
            seg=7'b100_0000;
            cas=2;
            end
            else if(cas==2) begin
            AN=8'b1101_1111;
            seg=7'b100_0001;
            cas=3;
            end
            else if(cas==3) begin
            AN=8'b1110_1111;
            seg=7'b111_1111;
            cas=4;
            end
            else if(cas==4) begin
            AN=8'b1111_0111;
            seg=7'b100_0111;
            cas=5;
            end
            else if(cas==5) begin
            AN=8'b1111_1011;
            seg=7'b100_0000;
            cas=6;
            end
            else if(cas==6) begin
            AN=8'b1111_1101;
            seg=7'b001_0010;
            cas=7;
            end
            else if(cas==7) begin
            AN=8'b1111_1110;
            seg=7'b000_0110;
            cas=0;
            end
        end
        else if(cnttime >= 30) //he loss
        begin
                    if(cas==0) begin
                    AN=8'b0111_1111;
                    seg=7'b000_1001;
                    cas=1;
                    end
                    else if(cas==1) begin
                    AN=8'b1011_1111;
                    seg=7'b000_0110;
                    cas=2;
                    end
                    else if(cas==2) begin
                    AN=8'b1101_1111;
                    seg=7'b111_1111;
                    cas=3;
                    end
                    else if(cas==3) begin
                    AN=8'b1110_1111;
                    seg=7'b111_1111;
                    cas=4;
                    end
                    else if(cas==4) begin
                    AN=8'b1111_0111;
                    seg=7'b100_0111;
                    cas=5;
                    end
                    else if(cas==5) begin
                    AN=8'b1111_1011;
                    seg=7'b100_0000;
                    cas=6;
                    end
                    else if(cas==6) begin
                    AN=8'b1111_1101;
                    seg=7'b001_0010;
                    cas=7;
                    end
                    else if(cas==7) begin
                    AN=8'b1111_1110;
                    seg=7'b000_0110;
                    cas=0;
                    end
        end
        else                    //show
        begin
            if(cas==0)
                begin
                AN=8'b0111_1111;//0号管
                seg=7'b111_1111;
                if(px==cas)
                    case(py)
                    0: seg[0]=0;
                    1: seg[6]=0;
                    2: seg[3]=0;
                    endcase
                if(tx==cas)
                    case(ty)
                    0: seg[0]=0;
                    1: seg[6]=0;
                    2: seg[3]=0;
                    endcase
                cas=1;//next
                end
            else if(cas==1)
            begin
            AN=8'b1011_1111;
            seg=7'b111_1111;
            if(px==cas)
                case(py)
                0: seg[0]=0;
                1: seg[6]=0;
                2: seg[3]=0;
                endcase
            if(tx==cas)
                case(ty)
                0: seg[0]=0;
                1: seg[6]=0;
                2: seg[3]=0;
                endcase
            cas=2;
            end
            else if(cas==2)
            begin
            AN=8'b1101_1111;
            seg=7'b111_1111;
            if(px==cas)
                case(py)
                0: seg[0]=0;
                1: seg[6]=0;
                2: seg[3]=0;
                endcase
            if(tx==cas)
                case(ty)
                0: seg[0]=0;
                1: seg[6]=0;
                2: seg[3]=0;
                endcase
            cas=3;
            end
            else if(cas==3)
            begin
            AN=8'b1110_1111;
            seg=7'b111_1111;
            if(px==cas)
                case(py)
                0: seg[0]=0;
                1: seg[6]=0;
                2: seg[3]=0;
                endcase
            if(tx==cas)
                case(ty)
                0: seg[0]=0;
                1: seg[6]=0;
                2: seg[3]=0;
                endcase
            cas=4;
            end
            else if(cas==4)
            begin
            AN=8'b1111_0111;
            seg=7'b111_1111;
            if(px==cas)
                case(py)
                0: seg[0]=0;
                1: seg[6]=0;
                2: seg[3]=0;
                endcase
            if(tx==cas)
                case(ty)
                0: seg[0]=0;
                1: seg[6]=0;
                2: seg[3]=0;
                endcase
            cas=5;
            end
            else if(cas==5)
            begin
            AN=8'b1111_1011;
            seg=7'b111_1111;
            if(px==cas)
                case(py)
                0: seg[0]=0;
                1: seg[6]=0;
                2: seg[3]=0;
                endcase
            if(tx==cas)
                case(ty)
                0: seg[0]=0;
                1: seg[6]=0;
                2: seg[3]=0;
                endcase
            cas=6;
            end
            else if(cas==6)
            begin
            AN=8'b1111_1101;
            seg=7'b111_1111;
            if(px==cas)
                case(py)
                0: seg[0]=0;
                1: seg[6]=0;
                2: seg[3]=0;
                endcase
            if(tx==cas)
                case(ty)
                0: seg[0]=0;
                1: seg[6]=0;
                2: seg[3]=0;
                endcase
            cas=7;
            end
            else //if(cas==7)
            begin
            AN=8'b1111_1110;
            seg=7'b111_1111;
            if(px==cas)
                case(py)
                0: seg[0]=0;
                1: seg[6]=0;
                2: seg[3]=0;
                endcase
            if(tx==cas)
                case(ty)
                0: seg[0]=0;
                1: seg[6]=0;
                2: seg[3]=0;
                endcase
            cas=0;
            end
        end
    end
    
endmodule
