SIM_ARGS += --wave=nvc.vcd --format=vcd
TOPLEVEL_LANG=vhdl
VHDL_SOURCES +=$(shell pwd)/GenericComponent.vhdl
VHDL_SOURCES +=$(shell pwd)/Inversor.vhdl
TOPLEVEL =genericcomponent
MODULE =ForceTest
include $(shell cocotb-config --makefiles)/Makefile.sim
#make SIM=nvc -w
