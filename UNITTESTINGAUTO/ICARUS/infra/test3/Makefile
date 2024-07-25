TOPLEVEL_LANG=verilog
VERILOG_SOURCES +=$(PWD)/../source/ArithmeticLogicUnit.v
VERILOG_SOURCES +=$(PWD)/../source/RegisterNbits.v
VERILOG_SOURCES +=$(PWD)/../source/RegisteredALU.v
VERILOG_SOURCES +=$(PWD)/../source/RegisteredALU_tb.v
TOPLEVEL =RegisteredALU_tb
MODULE =ParametricTest
include $(shell cocotb-config --makefiles)/Makefile.sim
#make SIM=icarus
