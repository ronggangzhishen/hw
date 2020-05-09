// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Fri Nov 16 19:58:02 2018
// Host        : C09-COMPUTE-A7 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/admin/Desktop/lab8_1/lab8_1.srcs/sources_1/ip/c_counter_binary_0/c_counter_binary_0_sim_netlist.v
// Design      : c_counter_binary_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_counter_binary_0,c_counter_binary_v12_0_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_9,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module c_counter_binary_0
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
  c_counter_binary_0_c_counter_binary_v12_0_9 U0
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
module c_counter_binary_0_c_counter_binary_v12_0_9
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
  c_counter_binary_0_c_counter_binary_v12_0_9_viv i_synth
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
X9fJZTmixgN9Rbv2AAAQgpQ/1a/uk6Y9SjgstOYIvC8kPNtC9q8SHP4uoY7Wovc/asPslFX2QCty
Q80RX1oI6CIbJoprEpHFQ/wnRL/Y2shGfXPT6HF74g/rp0uyXsladcSlSyfKlUrFFNXrwO1gkZK2
h/UAmHn6LkJKyjQFCjeaE0Qklw8DBXLIElUfw1JD4ozN/Q6Bc02LZYMzxBgYEse/MI2dKTWfQhq2
/Mx5EkxjN1KVGsmVDJ+LwVnvUwKjgBiNXENzZoWMh0xnk4BEXCt+RAg8XERh7uWSglTS0uoOcfel
dg/Frhr/6Ed58f6gi8Pvz8q/0mB/6zNjYoXsSA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
Nwx2nMuNHr8RD5UpoZ0ka46V5RRQEsD0eizw+HLgH+XFu3MyQOcaSEWyzDqRqwRN8vFXQcOpEJkA
kReMlpz85G6Chqx9YU5Gj+KayquCMtJRlaNkV5Twt+b3HD6o/9BIsUKiCpDffk1jyjVSRoa5Oqdp
2y9TMHAp2s3SWHZiG+CPczBbAKlpcDoEQ+eQDNmhzFS9TWSX10E5sZDRNG30LayJytDrP9WKiOPX
P82zmJLJdbYtF2Ekc0jTLkcB+l5w12EcWDELAvsyXfO4ImHWngqmbHqyNusw65Trmbio2Wy2Q1LC
RJ9IWPKfYAVS+RzduB0MKZm+gAXti/WlL7BGkQ==

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
