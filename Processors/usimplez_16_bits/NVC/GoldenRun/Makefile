SIM_ARGS += --wave=nvc.vcd --format=vcd
TOPLEVEL_LANG=vhdl
VHDL_SOURCES +=$(shell pwd)/Test_Bench.vhd
VHDL_SOURCES +=$(shell pwd)/components.vhd
VHDL_SOURCES +=$(shell pwd)/usimplez_cpu.vhd
VHDL_SOURCES +=$(shell pwd)/usimplez_ram.vhd
VHDL_SOURCES +=$(shell pwd)/usimplez_top.vhd
TOPLEVEL = bench
MODULE =GoldenRun
include $(shell cocotb-config --makefiles)/Makefile.sim
#make SIM=nvc -w
