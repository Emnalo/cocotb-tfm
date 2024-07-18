# Autogenerated file
onerror {
	quit -f -code 1
}
vmap -c
if [file exists sim_build/work] {vdel -lib sim_build/work -all}
vlib sim_build/work
vmap work sim_build/work
vlog -work work -sv -timescale 1ns/1ps -mfcu +acc  /home/emnalo/Test/IntegerTest/QUESTAVERILOG/CounterComponent.v
vsim  -onfinish exit -pli /home/emnalo/.local/lib/python3.10/site-packages/cocotb/libs/libcocotbvpi_modelsim.so   sim_build/work.CounterComponent
vcd file my_vcd.vcd
vcd add sim:/*
log -recursive /*
onbreak resume
run -all
quit