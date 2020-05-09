// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Fri Nov 23 16:50:23 2018
// Host        : C09-COMPUTE-D6 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/admin/Desktop/lab9_3/lab8_1.srcs/sources_1/ip/c_counter_binary_2/c_counter_binary_2_sim_netlist.v
// Design      : c_counter_binary_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_counter_binary_2,c_counter_binary_v12_0_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_9,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module c_counter_binary_2
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
  (* c_count_to = "101" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "1" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "101" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_counter_binary_2_c_counter_binary_v12_0_9 U0
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
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "101" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "1" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "1" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "1" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "101" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "3" *) 
(* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_counter_binary_v12_0_9" *) (* downgradeipidentifiedwarnings = "yes" *) 
module c_counter_binary_2_c_counter_binary_v12_0_9
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
  (* c_count_to = "101" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "1" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "101" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_counter_binary_2_c_counter_binary_v12_0_9_viv i_synth
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
o2duUBEHPs9V+nxYw898N0/FZkZWm9X9stw151aVQjEesfAC4gBsR8e/hJW0Zwez+pqxvQqdKaOG
blbaqzR/l+pTrOTTL4fQs/5jzghpnCInC6tmDEmnzgGUuJ0PeFEZG+uyDf394F7FMFkKJ6zbiFry
vVtdJ7LoxCyyO82ZtK0nu7qtOUMa2zQoATj1DECXu45tIXmnXPiMg6WLQzWjo7dLiY7k2bHYtmBJ
XTjRsMzTiH17WpT6kC2qsH0llmJLszlYQxLaXRU9f4Zolq7PIYTgXMVbTNzKWdrRqeALDnm0Oey2
T8IH/U7waL10R5NxrEdCDxlIkbdw6kjM5tqbnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
I228zsXs/TnTg0J3Qb4HBkHx9YvR4lExema9cMsIGYLEqk3EvymEaqzgG3DyPNDEpsGAzFTb0+cz
X/fGdOGlpDziINg8IBlAZLgaZfk42JYffFRaDY0+VT4Da1VfKSIHZGlXxNTkiJrXt+YlfDxW4VJM
4n9Hrm56/3EoSHehD4olT6TnUQmuSnC1eVDFrsKiHfOS59/TRtA1Yk0m5OXuk0I5DOzHQRJyxEuO
/ExK/rfMpM2wDLuCg3J89O+BX94TIgJibl4P0sEZmTd7aRnNEZ8phdJ7xLJcXsLjXypsYo/hB570
J8GGT7JAWsOD6QHGS2G5ZJcmKkI9FyC1tlfMeA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 6384)
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
