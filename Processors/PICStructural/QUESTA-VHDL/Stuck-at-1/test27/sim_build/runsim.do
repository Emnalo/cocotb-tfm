# Autogenerated file
onerror {
	quit -f -code 1
}
vmap -c
if [file exists sim_build/work] {vdel -lib sim_build/work -all}
vlib sim_build/work
vmap work sim_build/work
vcom -work work +acc /home/emnalo/cocotb-tfm/Processors/PICStructural/QUESTA-VHDL/Stuck-at-1/test27/../source/bench.vhd /home/emnalo/cocotb-tfm/Processors/PICStructural/QUESTA-VHDL/Stuck-at-1/test27/../source/fadr_mux.vhd /home/emnalo/cocotb-tfm/Processors/PICStructural/QUESTA-VHDL/Stuck-at-1/test27/../source/pic_alu.vhd /home/emnalo/cocotb-tfm/Processors/PICStructural/QUESTA-VHDL/Stuck-at-1/test27/../source/pic_core.vhd /home/emnalo/cocotb-tfm/Processors/PICStructural/QUESTA-VHDL/Stuck-at-1/test27/../source/pic_ctrl.vhd /home/emnalo/cocotb-tfm/Processors/PICStructural/QUESTA-VHDL/Stuck-at-1/test27/../source/pic_rom.vhd /home/emnalo/cocotb-tfm/Processors/PICStructural/QUESTA-VHDL/Stuck-at-1/test27/../source/reg_8rst.vhd /home/emnalo/cocotb-tfm/Processors/PICStructural/QUESTA-VHDL/Stuck-at-1/test27/../source/reg_8t.vhd /home/emnalo/cocotb-tfm/Processors/PICStructural/QUESTA-VHDL/Stuck-at-1/test27/../source/reg_cons.vhd /home/emnalo/cocotb-tfm/Processors/PICStructural/QUESTA-VHDL/Stuck-at-1/test27/../source/reg_file.vhd /home/emnalo/cocotb-tfm/Processors/PICStructural/QUESTA-VHDL/Stuck-at-1/test27/../source/reg_fsr.vhd /home/emnalo/cocotb-tfm/Processors/PICStructural/QUESTA-VHDL/Stuck-at-1/test27/../source/reg_inst.vhd /home/emnalo/cocotb-tfm/Processors/PICStructural/QUESTA-VHDL/Stuck-at-1/test27/../source/reg_io.vhd /home/emnalo/cocotb-tfm/Processors/PICStructural/QUESTA-VHDL/Stuck-at-1/test27/../source/reg_pc.vhd /home/emnalo/cocotb-tfm/Processors/PICStructural/QUESTA-VHDL/Stuck-at-1/test27/../source/reg_s.vhd /home/emnalo/cocotb-tfm/Processors/PICStructural/QUESTA-VHDL/Stuck-at-1/test27/../source/reg_w.vhd
vsim  -onfinish exit -t 1ps -foreign "cocotb_init /home/emnalo/.local/lib/python3.10/site-packages/cocotb/libs/libcocotbfli_modelsim.so"   sim_build/work.pic_core_test
log -recursive /*
onbreak resume
run -all
quit
