#GUI=1
PWD=$(shell pwd)
TOPLEVEL_LANG = verilog
LANGUAGE = verilog
VERILOG_SOURCES += $(PWD)/CounterComponent.v
TOPLEVEL = CounterComponent
MODULE = ForceTest
WAVES = 1
include $(shell cocotb-config --makefiles)/Makefile.sim

#make sim=questa
