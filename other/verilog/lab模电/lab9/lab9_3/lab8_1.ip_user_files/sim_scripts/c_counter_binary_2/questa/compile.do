vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/xpm
vlib msim/xbip_utils_v3_0_6
vlib msim/c_reg_fd_v12_0_2
vlib msim/xbip_dsp48_wrapper_v3_0_4
vlib msim/xbip_pipe_v3_0_2
vlib msim/xbip_dsp48_addsub_v3_0_2
vlib msim/xbip_addsub_v3_0_2
vlib msim/c_addsub_v12_0_9
vlib msim/c_gate_bit_v12_0_2
vlib msim/xbip_counter_v3_0_2
vlib msim/c_counter_binary_v12_0_9

vmap xil_defaultlib msim/xil_defaultlib
vmap xpm msim/xpm
vmap xbip_utils_v3_0_6 msim/xbip_utils_v3_0_6
vmap c_reg_fd_v12_0_2 msim/c_reg_fd_v12_0_2
vmap xbip_dsp48_wrapper_v3_0_4 msim/xbip_dsp48_wrapper_v3_0_4
vmap xbip_pipe_v3_0_2 msim/xbip_pipe_v3_0_2
vmap xbip_dsp48_addsub_v3_0_2 msim/xbip_dsp48_addsub_v3_0_2
vmap xbip_addsub_v3_0_2 msim/xbip_addsub_v3_0_2
vmap c_addsub_v12_0_9 msim/c_addsub_v12_0_9
vmap c_gate_bit_v12_0_2 msim/c_gate_bit_v12_0_2
vmap xbip_counter_v3_0_2 msim/xbip_counter_v3_0_2
vmap c_counter_binary_v12_0_9 msim/c_counter_binary_v12_0_9

vlog -work xil_defaultlib -64 -sv \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_6 -64 \
"../../../ipstatic/xbip_utils_v3_0_6/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_2 -64 \
"../../../ipstatic/c_reg_fd_v12_0_2/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \
"../../../ipstatic/c_reg_fd_v12_0_2/hdl/c_reg_fd_v12_0.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -64 \
"../../../ipstatic/xbip_dsp48_wrapper_v3_0_4/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_2 -64 \
"../../../ipstatic/xbip_pipe_v3_0_2/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
"../../../ipstatic/xbip_pipe_v3_0_2/hdl/xbip_pipe_v3_0.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_2 -64 \
"../../../ipstatic/xbip_dsp48_addsub_v3_0_2/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \
"../../../ipstatic/xbip_dsp48_addsub_v3_0_2/hdl/xbip_dsp48_addsub_v3_0.vhd" \

vcom -work xbip_addsub_v3_0_2 -64 \
"../../../ipstatic/xbip_addsub_v3_0_2/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \
"../../../ipstatic/xbip_addsub_v3_0_2/hdl/xbip_addsub_v3_0.vhd" \

vcom -work c_addsub_v12_0_9 -64 \
"../../../ipstatic/c_addsub_v12_0_9/hdl/c_addsub_v12_0_vh_rfs.vhd" \
"../../../ipstatic/c_addsub_v12_0_9/hdl/c_addsub_v12_0.vhd" \

vcom -work c_gate_bit_v12_0_2 -64 \
"../../../ipstatic/c_gate_bit_v12_0_2/hdl/c_gate_bit_v12_0_vh_rfs.vhd" \
"../../../ipstatic/c_gate_bit_v12_0_2/hdl/c_gate_bit_v12_0.vhd" \

vcom -work xbip_counter_v3_0_2 -64 \
"../../../ipstatic/xbip_counter_v3_0_2/hdl/xbip_counter_v3_0_vh_rfs.vhd" \
"../../../ipstatic/xbip_counter_v3_0_2/hdl/xbip_counter_v3_0.vhd" \

vcom -work c_counter_binary_v12_0_9 -64 \
"../../../ipstatic/c_counter_binary_v12_0_9/hdl/c_counter_binary_v12_0_vh_rfs.vhd" \
"../../../ipstatic/c_counter_binary_v12_0_9/hdl/c_counter_binary_v12_0.vhd" \

vcom -work xil_defaultlib -64 \
"../../../../lab8_1.srcs/sources_1/ip/c_counter_binary_2/sim/c_counter_binary_2.vhd" \

vlog -work xil_defaultlib "glbl.v"

