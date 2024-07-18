PWD=$(shell pwd)
TOPLEVEL_LANG = verilog
LANGUAGE = verilog
VERILOG_SOURCES +=$(PWD)/GenericComponent.v
VERILOG_SOURCES +=$(PWD)/Inversor.v
TOPLEVEL = GenericComponent
MODULE = FailTest
include $(shell cocotb-config --makefiles)/Makefile.sim
#make SIM=questa

