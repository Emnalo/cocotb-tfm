TOPLEVEL_LANG=vhdl
VHDL_SOURCES +=$(shell pwd)/source/Test_Bench.vhd
VHDL_SOURCES +=$(shell pwd)/source/components.vhd
VHDL_SOURCES +=$(shell pwd)/source/usimplez_cpu.vhd
VHDL_SOURCES +=$(shell pwd)/source/usimplez_ram.vhd
VHDL_SOURCES +=$(shell pwd)/source/usimplez_top.vhd
WAVES = 1
TOPLEVEL = bench
MODULE =GoldenRun
include $(shell cocotb-config --makefiles)/Makefile.sim
#make SIM=questa
