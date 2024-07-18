SIM_ARGS += --wave=nvc.vcd --format=vcd
TOPLEVEL_LANG=vhdl
VHDL_SOURCES +=$(shell pwd)/CounterComponent.vhdl
TOPLEVEL =countercomponent
MODULE =ForceTest
include $(shell cocotb-config --makefiles)/Makefile.sim
#make SIM=nvc -w
