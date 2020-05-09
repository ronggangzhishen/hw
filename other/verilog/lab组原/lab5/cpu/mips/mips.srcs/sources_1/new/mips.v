`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/10 17:31:35
// Design Name: 
// Module Name: mips
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


module mips(
    input clk100mhz,
    input cont,
    input step,     //one ins
    input mem,      //1men,0rf
    input inc,      //next
    input dec,      //pre
    input reset,
    output [15:0]LED,//addr
    output reg[7:0]AN,  //
    output reg[6:0]seg  //[31:0]data
    );
    
    reg pcwritecond,pcwritecondne,pcwrite,iord,memwrite,memtoreg,irwrite,alusrca,regwrite,regdst;
    reg [1:0]pcsource,aluop,alusrcb;
    
    reg [31:0]ir;
    reg [31:0]MDR,B,A,aluo,ALUOut,PC;
    wire [31:0]alua,alub;
    reg [31:0] rf [0:5];

    reg [3:0]alus;
    reg ZERO;
    wire PCen;
    wire [7:0]pc;
    wire [31:0]PC2,PC3,NPC,wd,ir_out;
    wire [4:0]wa;
    wire [31:0] MemData;
    wire [31:0]addr;
    reg [7:0]mr_addr;
    wire [31:0]mem_data,reg_data,data;
    reg [3:0]st;
    reg [7:0] cnt;
    reg run,plug,prerun;

    wire [6:0] seg0,seg1,seg2,seg3,seg4,seg5,seg6,seg7;
    wire clk5mhz,clk1khz,clk5hz;
    reg [12:0]cnt1; //5000
    reg [9:0]cnt2;  //1000
    
    
    dist_mem_gen_0 DUT1 (.clk(clk1khz),.a(addr[9:2]),.d(B),.we(memwrite),.spo(MemData),.dpra(mr_addr),.dpo(mem_data));
    clk_wiz_0 DUT2 (.clk_in1(clk100mhz),.clk_out1(clk5mhz));
    always@(posedge clk5mhz)
    begin
        if(cnt1 >= 13'd5000) cnt1 <= 13'b0;
        else                 cnt1 <= cnt1+13'b1;
    end
    assign clk1khz = (cnt1 == 13'b1); //1khz
    always@(posedge clk1khz)
    begin
        if(cnt2 >= 10'd1000) cnt2 <= 10'b0;
        else               cnt2 <= cnt2+10'b1;
    end
    assign clk5hz = (cnt2 == 10'b1); //5hz
    //////////////////////////////////////
    //ddu
    BCD7 bit0(data[3:0],seg0);
    BCD7 bit1(data[7:4],seg1);
    BCD7 bit2(data[11:8],seg2);
    BCD7 bit3(data[15:12],seg3);
    BCD7 bit4(data[19:16],seg4);
    BCD7 bit5(data[23:20],seg5);
    BCD7 bit6(data[27:24],seg6);
    BCD7 bit7(data[31:28],seg7);
    
    assign data=mem?mem_data:reg_data;
    assign LED = {pc,mr_addr};
    always@(posedge clk1khz)
            begin
            //if(|cnt && plug) cnt<=cnt+1;
            case(AN)
            8'b11111110:begin AN<=8'b11111101;seg<=seg1;end
            8'b11111101:begin AN<=8'b11111011;seg<=seg2;end
            8'b11111011:begin AN<=8'b11110111;seg<=seg3;end
            8'b11110111:begin AN<=8'b11101111;seg<=seg4;end
            8'b11101111:begin AN<=8'b11011111;seg<=seg5;end
            8'b11011111:begin AN<=8'b10111111;seg<=seg6;end
            8'b10111111:begin AN<=8'b01111111;seg<=seg7;end
            8'b01111111:begin AN<=8'b11111110;seg<=seg0;end
            default:AN<=8'b01111111;
            endcase
            end
            
            //
    always @ (posedge clk1khz or posedge reset)
    begin
        if(reset)
        begin
            run<=0;
            mr_addr<=8'b0;
            cnt<=6'b0;
            plug<=0;
        end
        else
        begin
            if(prerun) begin
            run<=0;
            prerun<=0;
            end
            if(plug)
            begin
                if(~|cnt) plug<=0;
                else cnt<=cnt+1;
            end
            else
            begin
                if(cont) 
                begin
                    run<=~run;
                    cnt<=8'b00000001;//{{(CNT-1){1'b0}},1'b1};
                    plug<=1;
                end
                else if(step)
                begin
                    prerun<=1;
                    run<=1;
                    cnt<=8'b00000001;//{{(CNT-1){1'b0}},1'b1};
                    plug<=1;
                end
                else if(inc && ~dec)
                begin
                    mr_addr<=mr_addr+1;
                    cnt<=8'b00000001;//{{(CNT-1){1'b0}},1'b1};
                    plug<=1;
                end
                else if(dec && ~inc)
                begin
                    mr_addr<=mr_addr-1;
                    cnt<=8'b00000001;//{{(CNT-1){1'b0}},1'b1};
                    plug<=1;
                end
            end
        end
    end     
    /*always@(posedge clk1khz)
    begin
        if(reset)
        begin
            run <= 0;
            prerun <=0;
            //mr_addr <=8'b0;
        end
        else
        begin
            if(prerun)
            begin
                run<=0;
                prerun<=0;
            end
            else if(cont) run <= 1;
            else if(step) begin run<=1; prerun<=1; end

        end
    end
    always@(posedge clk5hz)
    begin
        if(~reset)begin
            if(inc) mr_addr <= mr_addr+8'b1;
            else if(dec&&mr_addr>8'b0) mr_addr <= mr_addr-8'b1;
            end
    end
    assign Addr=reset==0?0:mr_addr;*/
    /////////////////////////////////////////////////
    ////
    assign PCen = (ZERO && pcwritecond) || pcwrite || (~ZERO && pcwritecondne);
    assign PC2 = {PC[31:28],ir[25:0],2'b00};//j
    assign PC3 = {ir_out[29:0],2'b00};      //branch
    assign pc = PC[7:0];
    assign ir_out = (ir[15] == 1) ? {16'b1111111111111111,ir[15:0]} : {16'b0000000000000000,ir[15:0]};
    assign NPC = pcsource == 2'b00 ? aluo : (pcsource == 2'b01 ? ALUOut : PC2);
    assign alub = alusrcb == 2'b00 ? B : (alusrcb == 2'b01 ? 4 : (alusrcb == 2'b10 ? ir_out : PC3));
    assign alua = alusrca == 1 ? A : PC;
    assign wd = memtoreg == 1 ? MDR : ALUOut; 
    assign addr = iord == 1 ? ALUOut : PC;
    assign wa = regdst == 1 ? ir[15:11] : ir[20:16];
    //
    always@(posedge clk1khz)//
        if(reset)
        begin
            PC <= 0;
            //rf[0] <= 32'b0;
        end
        else
        begin
            if(PCen) PC <= NPC; 
            A <= rf[ir[25:21]];
            B <= rf[ir[20:16]];
            ALUOut <= aluo;
            MDR <= MemData;
            if(irwrite) ir <= MemData;//
        end
    ////////////////////////////////////////
    //rf
    //assign alua = rf[ir[25:21]];
    //assign alub = rf[ir[20:16]];
    assign reg_data = rf[mr_addr[4:0]];//ddu
    always@(posedge clk1khz)
    begin
        if(regwrite) rf[wa] <= wd;
    end
    /////////////////////////////////////
    parameter ADD = 4'b0010;
    parameter SUB = 4'b0110;
    parameter AND = 4'b0000;
    parameter OR = 4'b0001;
    parameter XOR = 4'b1110;
    parameter NOR = 4'b1111;
    parameter SLT = 4'b0111;
    always@(*)//alu control
    begin 
        case(aluop)
            2'b00:alus <= 4'b0010;//pc
            2'b01:alus <= 4'b0110;//branch
            2'b10:
                case(ir[5:0])//r
                    6'b100000:alus <= 4'b0010;
                    6'b100010:alus <= 4'b0110;
                    6'b100100:alus <= 4'b0000;
                    6'b100101:alus <= 4'b0001;
                    6'b100110:alus <= 4'b1110;
                    6'b100111:alus <= 4'b1111;
                    6'b101010:alus <= 4'b0111;
                    default:alus <= 4'b0000;
                endcase
            2'b11:
                case(ir[31:26])//i r
                    6'b001000:alus <= 4'b0010;
                    6'b001100:alus <= 4'b0000;
                    6'b001101:alus <= 4'b0001;
                    6'b001110:alus <= 4'b1110;
                    6'b001010:alus <= 4'b0111;
                    default:alus <= 4'b0000;
                endcase
        endcase
    end
    ////
    always@(*)//alu
    begin
        case(alus)
            ADD:
            begin
                {aluo} <= {alua} + {alub};
                ZERO <= ~(|aluo);
            end
            SUB:
            begin
                {aluo} <= {alua} + ~{alub} + 1;
                ZERO <= ~(|aluo);
            end   
            AND:
            begin
                aluo <= alua & alub;
                ZERO <= ~(|aluo);
            end
            OR:
            begin
                aluo <= alua | alub;
                ZERO <= ~(|aluo);
            end
            XOR:
            begin
                aluo <= alua ^ alub;
                ZERO <= ~(|aluo);
            end
            NOR:
            begin
                aluo <= ~(alua | alub);
                ZERO <= ~(|aluo);
            end
            SLT:
            begin
                if(alua < alub)
                begin
                    aluo <= 1;
                    ZERO <= ~(|aluo);
                end
                else
                begin
                    aluo <= 0;
                    ZERO <= ~(|aluo);
                end            
            end
            default:
            begin
                aluo <= 0;
                ZERO <= 0;
            end
        endcase
    end
    /////////////////////////////////////////
    ////control
    parameter start = 4'b1111,s0 = 4'b0000,s1 = 4'b0001,s2 = 4'b0010,s3 = 4'b0011,s4 = 4'b0100,s5 = 4'b0101,s6 = 4'b0110,s7 = 4'b0111,s8 = 4'b1000,s9 = 4'b1001,s10 = 4'b1010,s11=4'b1011,s12=4'b1100; 
    parameter LW = 6'b100011;
    parameter SW = 6'b101011;
    parameter R_type = 6'b000000;
    parameter BEQ = 6'b000100;
    parameter J = 6'b000010;
    parameter BNE = 6'b000101;
    parameter ADDI = 6'b001000;
    parameter ANDI = 6'b001100;
    parameter ORI = 6'b001101;
    parameter XORI = 6'b001110;
    parameter SLTI = 6'b001010;
    always@(posedge clk1khz)
    begin
        case(st) 
            start:
            begin
                if(run == 0)
                    st <= start;
                else
                    st <= s0;
            end
            s0:
            begin
                pcwritecond<=0;
                pcwritecondne<=0;
                pcwrite<=1;     //pc=pc+4
                irwrite<=1;     //
                alusrca<=0;
                alusrcb<=2'b01;
                aluop<=2'b00;
                regdst<=0;
                pcsource<=2'b00;
                regwrite<=0;
                iord<=0;
                memwrite<=0;
                memtoreg<=0;
                st <= s1;
            end
            s1:
            begin
                pcwritecond<=0;
                pcwritecondne<=0;
                pcwrite<=0;
                irwrite<=0;
                alusrca<=0;
                alusrcb<=2'b11;
                aluop<=2'b00;
                regdst<=~|ir[31:26];
                pcsource<=2'b00;
                regwrite<=0;
                iord<=0;
                memwrite<=0;
                memtoreg<=0;
                //Opreg<=Op; 
                case(ir[31:26])
                    LW:st <= s2;
                    SW:st <= s2;
                    R_type:st <= s6;
                    BEQ:st <= s8;
                    J:st <= s9;
                    BNE:st <= s10;
                    ADDI:st <= s11;
                    ANDI:st <= s11;
                    ORI:st <= s11;
                    XORI:st <= s11;
                    SLTI:st <= s11;
                endcase
            end
            s2:
            begin
                pcwritecond<=0;
                pcwritecondne<=0;
                pcwrite<=0;
                irwrite<=0;
                alusrca<=1;
                alusrcb<=2'b10;
                aluop<=2'b00;
                regdst<=0;
                pcsource<=2'b00;
                regwrite<=0;
                iord<=0;
                memwrite<=0;
                memtoreg<=0;
                case(ir[31:26])
                    LW:st <= s3;
                    SW:st <= s5;
                endcase
            end
            s3:
            begin
                pcwritecond<=0;
                pcwritecondne<=0;
                pcwrite<=0;
                irwrite<=0;
                alusrca<=1;
                alusrcb<=2'b10;
                aluop<=2'b00;
                regdst<=0;
                pcsource<=2'b00;
                regwrite<=0;
                iord<=1;
                memwrite<=0;
                memtoreg<=0;
                st <= s4;
            end
            s4:
            begin
                pcwritecond<=0;
                pcwritecondne<=0;
                pcwrite<=0;
                irwrite<=0;
                alusrca<=1;
                alusrcb<=2'b10;
                aluop<=2'b00;
                regdst<=0;
                pcsource<=2'b00;
                regwrite<=1;
                iord<=1;
                memwrite<=0;
                memtoreg<=1;
                if(run == 0)
                    st <= start;
                else
                    st <= s0;
            end
            s5:
            begin
                pcwritecond<=0;
                pcwritecondne<=0;
                pcwrite<=0;
                irwrite<=0;
                alusrca<=1;
                alusrcb<=2'b10;
                aluop<=2'b00;
                regdst<=0;
                pcsource<=2'b00;
                regwrite<=0;
                iord<=1;
                memwrite<=1;
                memtoreg<=0;
                st <= s0;
            end
            s6:
            begin 
                pcwritecond<=0;
                pcwritecondne<=0;
                pcwrite<=0;
                irwrite<=0;
                alusrca<=1;
                alusrcb<=2'b00;
                aluop<=2'b10;//
                regdst<=0;//
                pcsource<=2'b00;//
                regwrite<=0;
                iord<=0;//
                memwrite<=0;
                memtoreg<=0;//
                st <= s7;
            end
            s7:
            begin
                pcwritecond<=0;
                pcwritecondne<=0;
                pcwrite<=0;
                irwrite<=0;
                alusrca<=1;
                alusrcb<=2'b10;
                aluop<=2'b00;//
                regdst<=1;//
                pcsource<=2'b00;//
                regwrite<=1;
                iord<=0;//
                memwrite<=0;
                memtoreg<=0;
                if(run == 0)
                    st <= start;
                else
                    st <= s0;
            end
            s8:
            begin
                pcwritecond<=1;
                pcwritecondne<=0;
                pcwrite<=0;
                irwrite<=0;
                alusrca<=1;
                alusrcb<=2'b00;
                aluop<=2'b01;
                regdst<=0;//
                pcsource<=2'b01;
                regwrite<=0;
                iord<=0;//
                memwrite<=0;
                memtoreg<=0;//
                if(run == 0)
                    st <= start;
                else
                    st <= s0;
            end
            s9:
            begin
                pcwritecond<=0;
                pcwritecondne<=0;
                pcwrite<=1;
                irwrite<=0;
                alusrca<=1;
                alusrcb<=2'b10;
                aluop<=2'b00;//+
                regdst<=0;//
                pcsource<=2'b10;//
                regwrite<=0;
                iord<=0;//
                memwrite<=0;
                memtoreg<=0;//
                if(run == 0)
                    st <= start;
                else
                    st <= s0;
            end
            s10:
            begin
                pcwritecond<=0;
                pcwritecondne<=1;
                pcwrite<=0;
                irwrite<=0;
                alusrca<=1;
                alusrcb<=2'b00;
                aluop<=2'b01;
                regdst<=0;//
                pcsource<=2'b01;
                regwrite<=0;
                iord<=0;//
                memwrite<=0;
                memtoreg<=0;//
                if(run == 0)
                    st <= start;
                else
                    st <= s0;
            end
            s11:
            begin//addi andi..ex
                pcwritecond<=0;
                pcwritecondne<=0;
                pcwrite<=0;
                irwrite<=0;
                alusrca<=1;
                alusrcb<=2'b10;
                aluop<=2'b11;//
                regdst<=0;//
                pcsource<=2'b00;//
                regwrite<=0;
                iord<=0;//
                memwrite<=0;
                memtoreg<=0;//
                st <= s12;
            end
            s12:
            begin
                pcwritecond<=0;
                pcwritecondne<=0;
                pcwrite<=0;
                irwrite<=0;
                alusrca<=1;
                alusrcb<=2'b10;
                aluop<=2'b00;//
                regdst<=0;//
                pcsource<=2'b00;//
                regwrite<=1;
                iord<=0;//
                memwrite<=0;
                memtoreg<=0;
                if(run == 0)
                    st <= start;
                else
                    st <= s0;
            end
            default: st<=start;
        endcase
    end

endmodule

module BCD7 (
    input [3:0] x,
    output reg [6:0] seg
    );
    always @ *
    begin
    case(x)
    4'b0000:seg<=7'b1000000;
    4'b0001:seg<=7'b1111001;
    4'b0010:seg<=7'b0100100;
    4'b0011:seg<=7'b0110000;
    4'b0100:seg<=7'b0011001;
    4'b0101:seg<=7'b0010010;
    4'b0110:seg<=7'b0000010;
    4'b0111:seg<=7'b1111000;
    4'b1000:seg<=7'b0000000;
    4'b1001:seg<=7'b0010000;
    4'b1010:seg<=7'b0001000;
    4'b1011:seg<=7'b0000011;
    4'b1100:seg<=7'b1000110;
    4'b1101:seg<=7'b0100001;
    4'b1110:seg<=7'b0000110;
    4'b1111:seg<=7'b0001110;
    endcase
    end
endmodule