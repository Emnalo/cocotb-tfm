SIM_ARGS += --wave=nvc.vcd --format=vcd
TOPLEVEL_LANG=vhdl
VHDL_SOURCES +=$(shell pwd)/BooleanComponent.vhdl
TOPLEVEL =booleancomponent
MODULE =ForceTest
include $(shell cocotb-config --makefiles)/Makefile.sim
#make SIM=nvc 
