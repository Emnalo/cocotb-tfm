SIM_ARGS += --wave=nvc.vcd --format=vcd
TOPLEVEL_LANG=vhdl
VHDL_SOURCES +=$(PWD)/ArithmeticLogicUnit.vhd
VHDL_SOURCES +=$(PWD)/RegisterNbits.vhd
VHDL_SOURCES +=$(PWD)/RegisteredALU.vhd
VHDL_SOURCES +=$(PWD)/RegisteredALU_tbloop.vhd
TOPLEVEL =registeredalu_tbloop
MODULE =LoopTest
#COCOTB_PLUSARGS = +OBSERVABLES=a,b,c
include $(shell cocotb-config --makefiles)/Makefile.sim
#make SIM=nvc -w
