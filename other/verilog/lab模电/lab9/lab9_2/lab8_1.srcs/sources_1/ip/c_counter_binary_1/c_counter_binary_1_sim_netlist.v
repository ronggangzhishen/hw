// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Fri Nov 16 20:35:51 2018
// Host        : C09-COMPUTE-A7 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/admin/Desktop/lab8_1/lab8_1.srcs/sources_1/ip/c_counter_binary_1/c_counter_binary_1_sim_netlist.v
// Design      : c_counter_binary_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_counter_binary_1,c_counter_binary_v12_0_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_9,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module c_counter_binary_1
   (CLK,
    CE,
    SCLR,
    THRESH0,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 thresh0_intf DATA" *) output THRESH0;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) output [3:0]Q;

  wire CE;
  wire CLK;
  wire [3:0]Q;
  wire SCLR;
  wire THRESH0;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "4" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* KEEP_HIERARCHY = "true" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1001" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "1" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "1001" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_counter_binary_1_c_counter_binary_v12_0_9 U0
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(THRESH0),
        .UP(1'b1));
endmodule

(* C_AINIT_VAL = "0" *) (* C_CE_OVERRIDES_SYNC = "0" *) (* C_COUNT_BY = "1" *) 
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "1001" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "1" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "1" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "1" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "1001" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "4" *) 
(* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_counter_binary_v12_0_9" *) (* downgradeipidentifiedwarnings = "yes" *) 
module c_counter_binary_1_c_counter_binary_v12_0_9
   (CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    UP,
    LOAD,
    L,
    THRESH0,
    Q);
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  input UP;
  input LOAD;
  input [3:0]L;
  output THRESH0;
  output [3:0]Q;

  wire CE;
  wire CLK;
  wire [3:0]L;
  wire LOAD;
  wire [3:0]Q;
  wire SCLR;
  wire SINIT;
  wire SSET;
  wire THRESH0;
  wire UP;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "4" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1001" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "1" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "1001" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_counter_binary_1_c_counter_binary_v12_0_9_viv i_synth
       (.CE(CE),
        .CLK(CLK),
        .L(L),
        .LOAD(LOAD),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(SINIT),
        .SSET(SSET),
        .THRESH0(THRESH0),
        .UP(UP));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
A13f8tlz6UJG9JfCNcYl8NLUw8Tlctm35dCRvt/KCTpBFIuXlOawHL7sTHowWNnYPdFQNufThU2P
nq6r7CYRfg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
oJAsCu5zl/OMFEQsA8TK81YQdELnJEDcFa6KQ0EHWxmJrxei82pUrFKy5/0YZah/J8433WTkuMYX
n4DxKRAShIrdY1X7G4VuvTy06p94vL5LjcHyEy4fxae5eyT8gPJ2ix4XQa8NTiv0ndfGQZyw3Nh2
G2fKlAI5x3f8zwZZQY8=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
wvBGFVtHjRF0sOMF1pCWFAGskoPwO7T2ijyj/eL3cj3Mn4RaSun2E2ii2aHguV5ZVFP65oRsiH5d
RuZPDUKAsxBDhHSsGkFSPIwX9KivlJTo2FZHlBDTlkfDQbn+a3fWxc1HcR9KUBo8QndFpzMmqgOV
oDGrjFRMryCx3hlDJdU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UMkVtIsRH0SCXq8LQlXc2SFapNVFtJ6lm3Wp55oPh2JHEa2eDcLuSNAMzka2zwzCEXltR/XJthW1
e74yTmf22SChtep5vBZ+ajUd7h2t8MuWnhQAMciHkyF4IkU7ju3JOoQFlih3FqDO3aUJPcamhd7Q
ccMUMAhIvZFp44NdLzl8HbXnE1qh9bi1m8qU8jMCKESUZ7pg4lNlsQjd+Goa1H9iXaLEv3OfHZuq
AS/RQip05I1DUFL5hACAmmneYHUVM5S4EEaO3aHf1jZ3r/piru3ZRDHXxDir2Y9zXiL2oDUfsV5l
w+Pp691O/rBEAjBLQdevDcp/mZn7axrfo7gedQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BizuB2M20zTA5t6lHKGfnJrucOUdZ0HEVkxiYzkxLH0WP9VZIREBo09OejVavblw0lBdoToGD/Dx
ZN2JWgxB3v9b0Oe7EvwN3oB8w0TKm0RoqDmuPV8JuY7RwxtxkHcrVvcjXuOt8j2BPe5Ix86NYRxZ
8RqRFVGNyOVCKZuaFMVHI+ktnNU/xi6ZGsd+L0PEmNWeJ+y+7ubRYuJBTcZK6n0e0Rv144/nsqdy
X+40+rhcynqZUh14Jaqxwmyc8eu2wmo21it2TUiXXzLiWf9C/rPTasxTNu6GgF2yKIv/qtG5zsH5
iEI5vhFnzG+RShh+IHFb+FdSgnifLxcvxMZyfQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
WBEZpdyDr9NfPjFUCp37UUdIujNIa897wZZ58/x9eMPhksqlKdy3SYhoDdl4U5n1JXPWIonhbpyY
qfWTq0gV9NaH1PiTuV9w+nrQziNvPhnHnWOzNrltlMQ+uTbMRquXZffmAQGphp7ekw56wGNMIqvn
BRmPzqHv8wZfX/RCaFbjfXAJEmAF89kl5TL3IWnE72Kb9o1cSvFtKTxyRoh9m9E0ghJdkhnRh4Pm
wU/+pIGwon3nUS1E00edVC7apMYbKm+8akp/2UT8ovmuCYJtcE90yRZZaeiFNpLq2UTmaGHp3XHC
2ziTOAA9fjUjv2jhCi5RMA2D0eDmOlHleltm9Q==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
LpF70815/lZbTRczacXB5GOF9PzyWw2JBzEUdeoTaGypLC0MkGO9kT7rHOI4rVYbiIA699ozOQVN
2RTZTC2FySmqZpt2OUnQpRkKnk1SCgnBDVCtMNGYHl1iCcT4gxKrAXfTcENqfBVgzJ9QsX8ke/Bm
XPQY4+SEqYctc0qT+GhzEn4fb5ZtgEIR/RFQYFnS8OdSxlhRSi7ZyQWso9kdyi4aM0T9dn1cSBT9
PentXOIQrkjkhlGZmVC1rfMSX/I/Cb5fB9aGdcW1kbcwt973nmOsIAvdZ2SZQ/Bq6g4kSJ73MzS1
6kxws3jCXftOlSaL0hLmBYht9zbThHOz1wUbcg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
WtAaURXWtYpj1oxANrNy9ZubA7/utWDl+R5rZ2PYQEEdBdHUDGD4k1495VSKx4So78ynmkQScjEd
ZsYjVIYexjLE0+EJGyvOy3c82Z3FvNSxQTA4/e/MCcVOYtAZs9/jFzX+ca73jeXHNJW4apS+C/fs
7a8yDpXe/ZktqEqXGHe3nes/ec3mf6lt0Dw7YzUYE3tSoD4X2Q5pCS0rd/uktzroOUeBQdiC0xoa
40vPYIkVjax/Uy+Up41FdnwfDBYPsna5I2+QQfaAuQ3M1QrB8/OX5GU36frdoEvtAVDgxswIerBR
C62iAJnRXjM+83N2Ty51OFDAkE8ol8TH9IjDTA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 6656)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
