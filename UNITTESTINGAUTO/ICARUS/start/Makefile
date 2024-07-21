TOPLEVEL_LANG=verilog
VERILOG_SOURCES +=$(PWD)/ArithmeticLogicUnit.v
VERILOG_SOURCES +=$(PWD)/RegisterNbits.v
VERILOG_SOURCES +=$(PWD)/RegisteredALU.v
TOPLEVEL = RegisteredALU
MODULE =StartTest
include $(shell cocotb-config --makefiles)/Makefile.sim
#make SIM=icarus
