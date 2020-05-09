// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Fri Nov 23 17:12:08 2018
// Host        : C09-COMPUTE-D6 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/admin/Desktop/lab9_3/lab8_1.srcs/sources_1/ip/c_counter_binary_4/c_counter_binary_4_sim_netlist.v
// Design      : c_counter_binary_4
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_counter_binary_4,c_counter_binary_v12_0_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_9,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module c_counter_binary_4
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
  c_counter_binary_4_c_counter_binary_v12_0_9 U0
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
module c_counter_binary_4_c_counter_binary_v12_0_9
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
  c_counter_binary_4_c_counter_binary_v12_0_9_viv i_synth
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
cT60/kliPc7sMvblDO8bYppA8co0RwxpL30Rqu5XoTZ0M2Ejfev9fl7N90L3EFgul0DdUJxmNqgT
zkddQekBOfRlx6db8VZEFIeP9XJotLGUcjnLg2fJk2yJ2mAc4hFoSJH6a67ll+y1NrxcTN/2vA+/
TMji22FW5uJMAqBpuwK/h5lp6MVsUZ1atocli4H8oj+mnmFUJPxOC7y9K0zXaKWA1CFntKzOiQ/F
/459FTOVvgRBw8V5ADm/+a2dC7fe0YSXgqZRRk5UhJQR4Rv/pLDwxdnpKpxjlbh1bZkBfuCWPnTy
gYySXgCso4yOCLsC0JeKHSoNXOm48+AnomAi3w==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
VE+DqGDvSGOp1xIyJ2bM4Mve0+vyftVrsjh7CZQ3RjLt9BbyzyfmMz36+M/+Ws/eOGfgZOpkOjbB
8Kspt2hpOQiwNh5hL5Nh+9YfJYgrnbnhSCuJs9sV5hZbk6twZHFuXMEVdFFXwJbeTyC4Aj+ZQTt1
GVbvB2DY+9m7nIFjT24JchLUDTsWsp1vjz5NPqcCDFnlIisj/8mo7eu79tpRr60dFNIhc3kwpUCJ
vsMm1xRxU2jbn+rnBzukitmm/V5+tnJ6/1tLeFUZO9GnueuGmOjDcAOlu4qe8DHogVg9ufN0gN+U
la/3nRBLN6p9NTkH7hxSuOuLp6yw4PjSkUssRw==

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
