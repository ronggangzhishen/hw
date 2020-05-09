// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Fri Nov 23 17:10:34 2018
// Host        : C09-COMPUTE-D6 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               C:/Users/admin/Desktop/lab9_3/lab8_1.srcs/sources_1/ip/c_counter_binary_0/c_counter_binary_0_sim_netlist.v
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
  (* c_thresh0_value = "0" *) 
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
(* C_THRESH0_VALUE = "0" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "4" *) 
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
  (* c_thresh0_value = "0" *) 
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
e3INLoPQF6meowfHgiHPuuBTMElPKhtzZYggD8onuOesMhzRqVYFgpIlGX0+hk6KdDtYpEec0+CX
nIr0cGBpgVt7HWbH3AcxXAEooHQsDkeMWoAMQNfTN7ENK+dhNeMxcmNxEl5+Lg+1iOCggcB3TQuu
IUY8PdYqKs57pcLxQ1AVCEbZ8WlwdPAnI6SwLRXrG36DwKmeS90ez0XQU/BXAbEvzIpudhJvd+H2
B/CSs4UDoCT1sJD1GtNYHeixER6/jPlBmxg5SrSYZLZRLGGD1t7aoRMCe6ndKtsLvezLpixPYbc/
aL9za1af9KIiwazN1dHcgqn+KyAR4QIlwmCsRA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
tYaZMgiJuALKCkHtH0KesdTwcPCDlSwk2wtv7cnmszuUDBP3ujjNnc/ilYNJbrmX513ANbQD16RB
ZKK2McYovep2vOyRnh2wanhu7AXBlfDFnPg/ziSHzu+vS8mDLGTib+pyTFkLgGQRFrOzRxIubV9U
yq77ZYreLFCMzK+P1EnF55HyWqaq2+o7x6C/+LzzHJcgNAXUJyRu9PBnZ+WHKphCAJ064ef5/3/k
QAsJGZ7y9rpRPyPQwCdR5cSxvnZ18r3B312K7xYSXdF/Yvk+eOF1QyVLevERlZaKUieL2Hg6OWTk
HruJt13zOQFEnE+pYQneOjaWRyDeNAisS3Qixg==

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
