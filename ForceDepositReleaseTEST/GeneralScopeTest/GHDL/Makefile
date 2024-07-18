SIM_ARGS ?= --vcd=failcocotb.vcd
TOPLEVEL_LANG=vhdl
VHDL_SOURCES +=$(shell pwd)/GenericComponent.vhdl
VHDL_SOURCES +=$(shell pwd)/Inversor.vhdl
TOPLEVEL =genericcomponent
MODULE =FailTest
include $(shell cocotb-config --makefiles)/Makefile.sim
#make SIM=ghdl
