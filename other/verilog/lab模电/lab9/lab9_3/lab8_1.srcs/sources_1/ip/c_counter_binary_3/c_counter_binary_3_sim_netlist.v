// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Fri Nov 23 16:51:11 2018
// Host        : C09-COMPUTE-D6 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/admin/Desktop/lab9_3/lab8_1.srcs/sources_1/ip/c_counter_binary_3/c_counter_binary_3_sim_netlist.v
// Design      : c_counter_binary_3
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_counter_binary_3,c_counter_binary_v12_0_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_9,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module c_counter_binary_3
   (CLK,
    CE,
    SCLR,
    THRESH0,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 thresh0_intf DATA" *) output THRESH0;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) output [2:0]Q;

  wire CE;
  wire CLK;
  wire [2:0]Q;
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
  (* C_WIDTH = "3" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* KEEP_HIERARCHY = "true" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "100" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "1" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "100" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_counter_binary_3_c_counter_binary_v12_0_9 U0
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(THRESH0),
        .UP(1'b1));
endmodule

(* C_AINIT_VAL = "0" *) (* C_CE_OVERRIDES_SYNC = "0" *) (* C_COUNT_BY = "1" *) 
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "100" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "1" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "1" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "1" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "100" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "3" *) 
(* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_counter_binary_v12_0_9" *) (* downgradeipidentifiedwarnings = "yes" *) 
module c_counter_binary_3_c_counter_binary_v12_0_9
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
  input [2:0]L;
  output THRESH0;
  output [2:0]Q;

  wire CE;
  wire CLK;
  wire [2:0]L;
  wire LOAD;
  wire [2:0]Q;
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
  (* C_WIDTH = "3" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "100" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "1" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "100" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_counter_binary_3_c_counter_binary_v12_0_9_viv i_synth
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
Yz3kh5bOI00v2GfenA0p3Gxy4zEsWNEsVidcEPEZtJC6RxyuiKa98hkU5t9pN6E8lDy3Nnmb3oK1
2I3bSRFqEivnub6eDvts5ccSo7sNya7axs43gH6jk9kuX4IltX5UCxbOynCHbZ9hvmYD9o0PPOTL
y+9x4nZQDaPO46S6b29n6JhmTRh6LVk2rwNWGeTuwRBBk9iXuO34z+YiFcvNYl9clFgOGh2T2bsp
ljsOvxe4dy1C6at7ekObyqNzZntE7A9YHfYw2Fo6zCk8LssbXo7ywMbWiLO4Urgxg+pPLyaFZxfj
zhcmHeaU95cpNgUmapzzpZy0v8ZLNL3wL5FIHg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
YFMEUzZ2FwCWlMG5JpbUssrOfTGW2ueZOWscz3KY/cMXcua+gITfcRbM0MU3jAs+9nIfvhrZ/mI5
HvVtZ1nsxSuVLlA5rlhffShWnkz0O8awvEmrXNbqPr1Yr27Xq1twM/PohVsjjz/A4F5CPjTUm1lF
K0a97r68t1vF+SF+E0treSrvSor3WaCr5cFKVMMYQSxeIbgT23PBSRFKnfGQtj+pBovfjm2JTsxF
OXejpbuvw2xr66UzTL1fXJGsLw1FG5+HfLjlYNIeEOwiyeV8w4y5Bi7mnDYQADPxEXmg6LFHijkq
jiBDO6kR8RP0hbxFN/rDosehTy9i79qaEV15zQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 6368)
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
