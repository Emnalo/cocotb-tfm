TOPLEVEL_LANG=verilog
VERILOG_SOURCES +=$(PWD)/ArithmeticLogicUnit.v
VERILOG_SOURCES +=$(PWD)/RegisterNbits.v
VERILOG_SOURCES +=$(PWD)/RegisteredALU.v
VERILOG_SOURCES +=$(PWD)/RegisteredALU_tbloop.v
TOPLEVEL =RegisteredALU_tbloop
MODULE =LoopTest
include $(shell cocotb-config --makefiles)/Makefile.sim
#make SIM=icarus
