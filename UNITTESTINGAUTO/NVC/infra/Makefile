SIM_ARGS += --wave=nvc.vcd --format=vcd
TOPLEVEL_LANG=vhdl
VHDL_SOURCES +=$(PWD)/../source/ArithmeticLogicUnit.vhd
VHDL_SOURCES +=$(PWD)/../source/RegisterNbits.vhd
VHDL_SOURCES +=$(PWD)/../source/RegisteredALU.vhd
VHDL_SOURCES +=$(PWD)/../source/RegisteredALU_tb.vhd
TOPLEVEL =registeredalu_tb
MODULE =ParametricTest
include $(shell cocotb-config --makefiles)/Makefile.sim
#make SIM=nvc -w
