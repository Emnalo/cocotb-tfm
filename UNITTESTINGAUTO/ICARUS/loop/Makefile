TOPLEVEL_LANG=verilog
VERILOG_SOURCES +=$(PWD)/ArithmeticLogicUnit.v
VERILOG_SOURCES +=$(PWD)/RegisterNbits.v
VERILOG_SOURCES +=$(PWD)/RegisteredALU.v
VERILOG_SOURCES +=$(PWD)/RegisteredALU_tb.v
TOPLEVEL =RegisteredALU_tb
MODULE =ParametricTest
include $(shell cocotb-config --makefiles)/Makefile.sim
#make SIM=icarus
