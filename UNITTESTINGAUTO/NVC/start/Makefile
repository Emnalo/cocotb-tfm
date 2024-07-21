SIM_ARGS += --wave=nvc.vcd --format=vcd
TOPLEVEL_LANG=vhdl
VHDL_SOURCES +=$(PWD)/ArithmeticLogicUnit.vhd
VHDL_SOURCES +=$(PWD)/RegisterNbits.vhd
VHDL_SOURCES +=$(PWD)/RegisteredALU.vhd
TOPLEVEL =registeredalu
MODULE =StartTest
#COCOTB_PLUSARGS = +OBSERVABLES=a,b,c
include $(shell cocotb-config --makefiles)/Makefile.sim
#make SIM=nvc -w
