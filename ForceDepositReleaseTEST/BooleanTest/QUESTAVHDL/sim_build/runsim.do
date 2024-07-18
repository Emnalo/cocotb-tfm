# Autogenerated file
onerror {
	quit -f -code 1
}
vmap -c
if [file exists sim_build/work] {vdel -lib sim_build/work -all}
vlib sim_build/work
vmap work sim_build/work
vcom -work work +acc /home/emnalo/Test/BooleanTest/QUESTAVHDL/BooleanComponent.vhdl
vsim  -onfinish exit -t 1ps -foreign "cocotb_init /home/emnalo/.local/lib/python3.10/site-packages/cocotb/libs/libcocotbfli_modelsim.so"   sim_build/work.booleancomponent
vcd file my_vcd.vcd
vcd add sim:/*
log -recursive /*
onbreak resume
run -all
quit
