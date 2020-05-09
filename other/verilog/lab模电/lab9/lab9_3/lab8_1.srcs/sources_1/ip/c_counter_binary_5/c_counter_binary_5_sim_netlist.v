// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Fri Nov 23 17:12:41 2018
// Host        : C09-COMPUTE-D6 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/admin/Desktop/lab9_3/lab8_1.srcs/sources_1/ip/c_counter_binary_5/c_counter_binary_5_sim_netlist.v
// Design      : c_counter_binary_5
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_counter_binary_5,c_counter_binary_v12_0_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_9,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module c_counter_binary_5
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
  c_counter_binary_5_c_counter_binary_v12_0_9 U0
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
module c_counter_binary_5_c_counter_binary_v12_0_9
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
  c_counter_binary_5_c_counter_binary_v12_0_9_viv i_synth
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
FIUt3Zj1Rcef0eE+IKb5aq/3LvYvRz4uDs2xxqlxEccFQWY0jECKVt38y0RMgZCs1NvxF6bfNRaR
4fR5Rt1B9WReoqMXvWWBdkSDt0EwOadp5naD7hnM9QsvvuAsSFD3vCC6UDEVrHd7aR4OpYVWsdtN
BHzXyRXl1BhRV7AkNmrDU1V5zip2N1bFYMUrD9j912DRp6QGLtmAjqx/EP3GDN5BMHigIUQICap1
t7UH89RM9Bw3yD1zrydpPF2WIbQkS8qzgX7SkA4z1uPa6jgkA2nuP0BLPotSVIivA+EJAMD3vGRj
4G5WlRcvhgzb+Ftlqpfdiycnsqzvy4gofUnusA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
TOxgtF3/l6yS8hToglVGSg+sl5EpOeKjA6F/ITCuJY8znJrnn0hx2QG02x3kfUZF4PcbbNkXCAZs
V7HAuCBSHSPKklLYAFxVy6Uox9vSachcgdS3bsihTt1Wc1bRlCGVsO1ZCiW065MN9u7kn0c5HFL1
s3+TddpW6NvrCyaxzjFy1hs/9OmlVm7jdaoKuNuafRH0BxlhBDcKwnC5SrALJVFg5H/ra1FOHXQG
FWqbAVFCcC17f+7jRZvCCdthCBss4ifJ7fasZIxT3gOB5NypI48eoTFX9HsRkfoLKK1Xpv732Cur
L3EMvZVZmuEai+Q/omTfAKP1sgjnqvSX6HW9cg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 6656)
`pragma protect data_block
c11+7OfdDnDjTVIvUtnZJ4rMFuPum75QZnYNeYGlLIgX4o+v0iixlfBxNv6PLc+YbAAj0yYixihH
IOiw2ePfqgQqybcov+fMxq6LrLkzZ6x3y2fcFx4FJNzcLQyKDGMRgUaqYmzjID9D/EWw6oWtJJe+
sptcYqOyUInVUzANYLNEfm4k+5diSUsvdMa/Br0pXBqG8zPfEdy+AdNgFq4OKS+Ohe2udxOJQC6y
wrB+CawA84rg2u+8rhumcr44DwZLJPDObntRj00QbLyqOokbKeNEe8QzX7/Nmk8J/Vvb61HYVRe9
JlW/6HJfGGimVwTHsnNExxwFWJcn/BKvFketq6kkK4x4qZ4ZYLhv4sFPjgVND58fjpZugS4t4fMC
vWEfSpanTnBsiqR3oQLyoFOvWURol1Jrhoo6yajQNm1WPXmENn/xfb3900SynWvH2i3q5i/ZylDa
z9y1eQpHI8hdH0vxUAw+xj96b+5d5/AogCRs1AhAKWmTJv/pgYkyTiPzrg2eWW+Sr6FxmvGTK2x0
tYPnYuAIDLYaEG7ZbBlGzRYkcnvjJNVFqGkbjUmTuKbOlWu3lALZY6+7IU1wGQzruXyTZAbai+Ub
tBt2ITIUx4SBaA3DZOxU619nt27sApIYk9sh16uyR/Lr+MuTbst7hRMBsaQ1oiss7hzJ362N/MBe
YBOgJIPNmbYqZUm7Peraf3MuLFO1OGO64aKeD5T351Q2Kaubu7WyFBmgAz77VlNaXIpTP9RZkuzn
tdDsGSk634Rl6z2LLbbQANTzekg8C+IwJhaD3yKaw4UL2bkEPWPw1ghn0hpFILJd+PsvIsae82i1
7K9osKAYcNTvmz/YHrD+T8pR+SiZEUMzAP68L5eMP5svGb3187gtRAYQrgG1UF+dlf970dyozNnI
OTFUlGHXyHbH7JtDyH6+23K6GaDXqzE/ub5U8J1VF70N7RTLbarlHOiTBqoNZkYaxaYmrFSuqjVq
f0H/Ht4svMqvug3yrOPeETdCc18EjP0vKqzkdnAgDSD3uFUyczGmTdKoV7ozgR92lg0obqobQ/Sv
V12mp3gk8anWvnpGZUbmBrUmogdAgw6uOdDOkXam37F+RFQN0LNOW5cVZXmDiSrRH48USSaBraXd
636RycDcjPekzDNEcpr9KseeGzyb4Q3QtG795NoUvrORnLekArWpfRSaz74JTwuI3LAtoEs2TyrK
sFLx4ObR5KanHywV8wSbVvtsxljI6hfSAac9R/a4SUWomNFQ7HoZCo9jUx6P5nV7ZKPWe1YxIZqh
EbxysuEhW6YLdoHg8HtiS9ntWkz7VN9jZ7p3Kuvv0G6hB87xtJRUB659akQUQjssAgXHVHUJIZfP
BgwKkGBOWpZQcGtSCXbMKLqetlx+x6FDNVd7ceUvWyrpNbP7q001zN8eHlB2Noxogi2z96Ms4EFN
+P8O4tDhd7nSC18GpW5MVGseOjCsRz1xm5Mca2iDAeKKVVJO4ruxqMqynUGj2KvGQeCAYkqKAVLS
4KqPAvI3HxwNRX3Q90viHsFcndlvRS+i9qCfeokMioVhsXI1W91/m7ZG3PG3OztF6J0Yhc5NN6du
Nu6TaYHd/iVlPKg2MX6BTeWg8OGdPyUyNzv03RODmwz8IWgr/axyCzW482W9oS6jQFjo5oYoluiq
WUqcbQ+uScG1/idvsPuP2YMwrPzoZTHp7+6lBzbcf0kruJFM79+YIXCTungJnmT73XMxyvulhddN
4kvPmTrwUm5AP2e7Q2i4lZLrgJV+vlxnryZG9quWvtwWFVwp6q+7ylhCO6opnAqUN1DHqsXHUP2h
42jx5WavXcUxCVDpuXFLK5ciYWaQTAm2nej3/+nIPdr55igKLeXYzkSTa3/ya8Fi7e4aVtgNmYqH
a0B/iDAgIz9qkIT2s0AazwSFn5CwDXflbIEgEU2lIqt9MOGpuNOeTc4ktcbPZrbtRsopq5W+2JPR
i+bbALH88x+udPKucmXiXskr005x/cdD6e7UmhC6Qrq1UXc1z4g7l4q4+QE77gp6i+5l4mIKEPe2
+WI/3AFV+Mns8K0QCTXvhJ8RuJN2zo3+5ltvZpSACxhnMPtxITqV2bwJ8DPYgCSCMpdiEr6pFGvi
gFYyzZ24qxCrURfsy0YphPCITTMgjt+9eMstklqn442RS2f+nBsVRkIZguI/DfWDXJDriEco8uea
8OMj513nZZC32ocAr4+140OEuow3R5N2JDRA8ydbHmpc4E2aNH8v1SHLbsfxq5MADO2Mf1M+CyNn
m4Q/p0DGnrDfWf12DHFMYYz8VWxn16wn6kTNeIyuXZji0jO9PTp5HdHaiLx289whwQbNd3XMB5Oa
M0ROddWWNt5uaZosDVEdu+c9tvpMuxiC/5DGtQ3aFoTJnKBZAc9PpkK+dx9YJDl3pJrvmmw1qUy4
McmgAe8LAiyDjbKy+pQopOV+HI0jVSCTep7y/soeEysJz8lISxOsstVcZ9NxZsV3aNj7Jnfe4Oov
/3V+MD6omtPNQ5HoHfzdxuIelpwDbVyl8R3xZBfxf5rdylrKD/K6mK/9ur1m6YVB24LcG8oIqXda
jX6xhxsXxNYnXZw42e3e9tiKSexKXUfFVzgzR+zxZon14PgT1U+XPrvjEfjQGdBf46ezNQeccYT3
oNOQxezPn4FJ92u/xNrBCKTnZ4UNMJtg9AoXtbWy9NjczMESS6925OTXCuoNxAVgC3LG0Jrr0ZwH
eC36coxhgslD5LqDnrhFNl1ASMu3Hj1+NBRfnhOPOti/sPPMiiMeR2GGyvEtouhc0O/qqIWm4nJ/
RG9zJeZN2lPUi0gTpVLZJRiUFULHbmTAj2dtlArHx9Fs4e1ExFqar1Qu7CWd8H0yNS5E6TRdIcnr
NVe4To/EyzLP+6T9htNieNE50DV2LPMfWQHGtxAz8fXEcDDHMLVZ2Bxfo+dVOo7ZE24OjEVXofus
l8z1i5s43HibcJ0Kg614FMUxpui1zL7Z0mGVbt2pM6haFDuzCMcv7eto8ZJYx0tk1UDeSovMzDCL
q/f0pzemlwn29+7hLdVrFOczBjbLoN1rPQKkCwOX8RA/laoDLrO76MBK4rtvf5eorH+i6K3OBFV5
WWf07G6A0qY871Ww1lWgg2hFAiHNuHZaPZsBgt1jCBgLBn4eLAUHBCB+IcH+IWZeDY4Fy0OQXWCU
cRTn97SOeuUU7BTT0+41J2/xCfJIxoIYjrhpAaN9/iOcn+p8rKBfzjDhXI8Bgrvjk9uYOEMFaIK5
HwG3/SHut81Zaz2p7yS6iJkgJ+4TrYaFnTkowYMtIfLZBr4AiMTmweydiiN8CiMuYfnZcynVTP7T
EZqp+/kkLRqYF+tOJngUsWVXNfcq55vdla4ZM4paM146bH1ATyZKiobvLhVonBirZKWKvqVVCNbN
p/FK+jH2j3dLabvPlJr5M0fppWBIpctr0enCl4+WNzsquepDqNRYGGF5pNWKsfSL+zpBAtI5Ul8z
ByI6kxpYfqqMUo7A/sH7Yn0zRx/1i8mPSVe6FItCdZWVQwYpSVKjHCt+nBoODMX60TJ2wo7aLYjj
zQ7zkXCab+elVzvWdqQof3wSv7onwd2a9ZumY4IDCyMgyJuzgA6mljQABs61trJc1kABizyep32P
HF5mbYPi9b9I86JNpOSBRPtW193RdvOtcKMZj8ANEZx5ukCc/rAPr/LuW9+NHpEvgE8mfF8tfMf+
7GNqi02xRRwP169zC2t34QJO8W9CAbnjTSNwQSCoFamCzR51k73iqussFn5wL4oRhZxuKPBo2rOe
nsF1eghtMzrsKc8PQo4itkgrlKyxfFsGr9iHHJ4Xq8OLN7iq3kXUzRdLoj89z0DT98/MO0WOm9Br
1OTfio63MFLFuvVF8MJXJzhqUzbKgTpbhySjcIo3KbOuw6cuAnH5cJ5XkOrxGw+PrzOn/WNMRDvY
dJwNSx42y6viVzO8jUCpTRa2wx7JgirMN2SpvR27Y/CzUoS57NlOrwCONRan/WBUrAg4tE4YnmYt
KCwHwwPA9Kbpv7r8Yl5nqPHf5mFYuWimBl30ktcGRPEBaOrHFDIhCd5oOU98arBzZo0G8DeMZFxt
Vu3xiRgxP/lDUT4pfcLO8wFT1kzf9MZfmGV2z3ih5RnsSBSBGh4wrKGQsudDjIAw38T4Dzmqivw0
iN8+JYrearOv1JDEtkqOa8MAp+EDfsWMihEiyIKxaV28XhvN84wsrS8ItlgZlGIiJd9y5sjeEKLn
wyatNl2qikIXuIDJ/R9cc9/0dASSW0BXBem8LLdfU/HzUFqXJT6sj79In5nWqIr8X9dKEmCGZ+ux
9mSZaTOEPDksAGi+a72yWUfm2lGN2rm8GRb/ddQu3sOYa/UVA+q3nw5+nV8gOwK9C3z3dXtbbcQR
W64tw/rzbDrYazzDRWsCFHnoDb3KN3PeoTlYvJSYeW3XyPkpValP4gWXipoooysAGU2/HtQ2xwZp
MLNgLR+Fha7IDGguB6YruB9jsPu3+oFPZtcZJdld67TJebvMt7xFzzuLvUprXyB3k8pys9Op3lxj
mWQCB4Sg+TChRYJdpF/H7hu4wnPkO9qQ2p3j9TGfxe1fF0ePEq7Jaay/5VpNtMYAJ+VvlSXchjLK
MeHp9G+MZhIDKkmJjFAgN7pd189d7ifDh9MFBjKRrIEG37RYgy1PySxOyzg8ddFZDcrEMr5jfqiT
7bXEnehBagitzmVjhsM68kylHYPqTFDc6f4p0UsplrfasUqXxr5FHh2r/co7mLTta0j21pgYtfH0
U/xGP9l+Jsy8oi8W2ZpNZbI9Vm3NxHFOc7x0rNYS8eZxs85sVSraBNe0IFSRTThh4yGiofr1WJ00
zxAJ9Sn4Moh7T78svJvGYYD8+hqurMzjoedDRlbcKIkSboRfGwQIKjxZ8ma+WfId3a6872AMIQt5
J91b5ZDjMSs88ArdvGFMHecPKEgW0d19/v6qPDpuaNV+FiXFzYg7oVJdhqHPSk/0gjwdCvqAATqD
TD90Ik1/S9ILMeWr15BxPMCJ88GhfxBn3+pl3UJ0aQu7cDbPtfsmxKea0SMWex5zrIdGkEWTN9SX
5bc/4na6ZDocIP9G3jYFDJL2c8bLsteTFVfEuoFcOSRYpzuhwPeqWxL5dC+jiRcN0kPKSP1nfL2v
4CY+wgtslpKu0Egjbq+hAmvCEjbYcau1t7Sz+3kKQyxtquSxg/gki6PQPMgOk99a+JwpYxeMpjU1
W7iIhYkvPOr/fsQZ7aMRdJmPghMzdHTGlKn8B7B9UuKwbWu3MHU1mywGxyO8jF+iC5ZL04eYNmF2
CamQOQpw6HI3NCYo39ACRCLCFRkdQ8h0cKkSeiS1kGbq4FFewzAhKLYrWaGos5jlSH/yvUbhWxvm
yelZw7LKkr6A5WCZ8tfj7/i3AXhhEuOvH3SDVIjICD2joGaG95JsLA26aeaaPISF52kEK/RhF9qn
TgQLbmWcUFSu0WJAQ0t67z6D4YuavDFh25otLTHmKAVAmweA8VW4lhV9dI8bL4xXsPZqFUXavVzD
uXuZdgtaeZtpczo4b+BSXZYjnbGg8+HUyD177PYtABJIEaNdTcu5m/rkpDp2iDUFwNJ2KShiIRDX
YHfYHf8kDzPe/KSAzdl7bVlry21b5uBkhhHu5uxkojwFzpCQviIgfDXpcsX0lZT8Sg9z/xLQ//C7
5IPUe57BvLxfAXe4PgJpJuTfYOTWhqBA/l9YDA2pW9Cg+3ZwryA4+zH/Ucs9uKMbvjwhq2s+j0lM
fKqKZKVRmSPMBz3H8PT2XykO2fWoFZ3bd7E0OSgU4gOZ3YUhIM8KRHlVoPGlSNgVqRbKpDsGjhNv
bQw63uqNQR2eNjv7zfMtSMEGocYX8+EX0pyTKAX1M56fv0Z1OMOOQ10PnKH+0EQ/7iMZUdl0chKs
c/ugaHXytcPaAEocHd7vatVjfWaAgHo2hgD62g7JwxCfi4iUMCsEUr6F9RIhXlPyXGwtwaf0JFbi
HWd79cdYARjMmF09ctBdZzct/1gTP7Hrf07XP8I/C2lO6b53KnVI/hSToiDagfAgKSov1lI+iBXD
CRAkL2aUN7Kcq/5brcceXo3tDXtmtffBW7EeNc4X4JdgC/vU21BkrjJQl7agaIKvmZ/bjyhlH+UX
hT+comS5//gkt6nmtyHqAiRIk2wyHMevEcI4/OzlwMsThHPP748Utq+wGy9SZQS8oBe73efwVwI2
a84blnZZZzRKJzWj1uExMoeuniFsbsG8f6JaSaeAiXv7b4J0vBgPmB4suZ8OAbHi3qGGLnq/P1Qw
+N/9iGPSO++ZKrCs7g6s22UovNpFuyVoJIwm7xKFJ0GPH190CGYkyU9jn88ivvB9RD5dDGmbTmQW
XzGxv/6ixsYfcg7DSUuQh8u3fW/xn9ymlH4WNddtv/IyfFzGFyb2F7SX3Cv4etSbKLO4JhB1c2+C
B+mTJX04braMbrMo+ahTZCHHyiHbPsS7GAWxGqmV8T0SBG/z8jaU+WTrgc4IDekfMMCzFqb+8Rcl
nOKHrUqBHvkIH1IhkJXfyYBVjicHmnLK745vlvv+i76WhjF97JHUJzkvBFlqkdDqa+ZNtJ9jPM2c
OJmKd83LWnCKKtXsp+Sz+sLDXysIRZ5Mj4mxvl5uoCLum5FoukmKwG4v/3/w0GPOnmvEUrng85rK
soYim+mPeMTY5a1zkKYS4LMOnIayuZ5h5Z+omQLnmaa2fROW7zDdKkfqrz20QQTwSw1kEO1Fjpsj
N5hQ9HJ1JjjXkHpXEZ/aNp6IWOKdVmTowSusDb+BVgmEx4r8BdBnewDB92hZSLwahiikmlOClrsO
hL1inIfqbFtbUXIaNWByqR1Gh4zCjeQE5tlY8u0Y0hcQkWX0wTKzqeG1o5T+6V/wD0qtCcZkNRnJ
I2uC8+DUKJAOFb1k6EOyt74/UEoh/4SNiqsP3iafvkHJ8u7OdQz/0oQjDBDeh60ocw22ksoQK4nF
uQSs+Brm9M18Cz35WntbEGZWe6tkCXWPKh0d4oNsxgaOgF0G76K/LEhO1our6a8TLn4rqXY/2IuY
A0GsXgghf1ZQuIpmUUVcYmsRs/ed33LoCo5DQvSyqfddQbATl93xK4Lq+u3RrxQJPEzw9oxLev84
ZLiVlLDQduCXxRq/5ab7+aeP0bGHXyh+5pbcpsmDdqiPsp6ZjfpJRJMMG1gGKap0LzCBSw4fwtK6
L8jPbJLM2EfG1Xgi63miV8NOmYIGwOe56yK/8QBBopBn+kNmmfuJEi236KRqKbvNt3bRprhbtfvZ
3oO5a8mnepj3MRxMWgSMDs8QOcrukCJsPj5k3yFrQhDCHsdQISjJYyD768bsqM2nktx2PsI8sCkX
6W7uX7VzwWK7Hm4gMzg5XLrAvEYlPNf6kjyhd4pAHnT3DAuwXvGoQ36UM7KPjDmdQoPEVCOo/Zn+
VQ/YRCAnjvJYRSU7DvWq7FwJDfDa4Cx93vKFnrrm2oAHaUxFJsxnqODMjWuSR9acU42Zo7XsDnfT
IiElqKMQFbklrDECkqztVD5s+2JogMYfzRfrP06WOs0cZnaiKNepz5zal89zl2C9TQz85PJaT8SL
OGUEUA3huqvcX7nwHrzb8Us+FXQjLZ3MHtejkLNPO9Ua8+lXwxVGxCyMmkKyzQKKK6V62Skz2n4E
Ik6uK28mWc8D5+Y5azOQ1QQJWLHrV/yiOoJ+jyou0cj1X9DQQifSjSxt/xwCnnfLUv36rGzUQv/0
goutdFPgjbw2UbdgQOzgWw37Y13gjs/IWWgVi54J+nqtPO/3J0WniwZNisbbgjArZg+9MF1rH3OH
mtBcS8+IKdo0SYIE4jx2YE+90+ytmSBXpadjyAogi54iqVkzKN7DqFCAPGQ2tpk4rMXAInyuj3Fg
tRxXwKoW4KfXfK3UHIwXLpxXNx88lJI9ZVWm5djnwx03XlH+327y/Lo5qRmnglJKIHEOE0PxVy6b
PDU/l7jfrlzPBJxBytcpYNl578uSL3vPMay//+MGEzn/q9Q/H5k73uKuQ76oooVpmgg4n8Gsgs96
Qrq+aTSq1foGLGLOmrAspwliyOiG99/4i35Z/mP9WhND6Amdq+495ATz0ZhAmV9wOaMEZ6cEje04
D27wNQZvJ0AYWQ7/g4R8P9uBZhsF4oq/B/0kehn4kBaN3P/hS4ERxkw8zI/oxofYhXOuEPXjF/3f
tq/9LxDY/kz4urlPejRHdPPxlM7gBZ5M29H0TiP7GbqOCJHu+i3akD5oOL3jdGokQgS+f+/f/MUh
6lFPIpU6wMT4t76Ol3onrGbN3e6DhdENtopze9bdpJswXOI+8ZtaXMrHO/tTvytzT/dMaTIk9HGd
jquBTZ80h48iV9xhj2/BEeKiGDURdvgIdR54AJaJRyjNTNqcJvkckm0/ghN1jRX5b+bSdRyoO8MY
hADsf6PG+BFS/Jt5wU5x/USnlW4nXOuqeM/8NYg5Yhl3colv0n9zJfqavqSi0RKrCitcieH2oPcJ
I6y09knZqvnc6uPTZW/esNIYlRcZTPHC3wf/rG/J6+Jc/seEky9lzO9B+wG28tByTpDRNnlaE3tD
ZFK5FIvSk6Erzn+qMMNt/1+lmR2VW1PQtBYjtE1f1AEpW59MdiZCG4lLV5BvAlJgZfGm7WNnuFiz
AbOkKB7Eb9UI9YRmubA61i5HCbZhX753NFGvtqfslw5Gzg4oD431oJmzMUW2wSD/qW68AcGizWHB
YuWvq22heojnVbVZ3aHuSwv9JWWLafW/d49F6lX6PS42nb5pHMRHeIrscSPfWIBwsh1ZSk3efYet
8yh8syIFH4xcSb4zt3vEFe0yZPOOihvXlYnhc2qtQ3BUjPgPQnfGg/GfiOI=
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
