SIM_ARGS += --wave=nvc.vcd --format=vcd
TOPLEVEL_LANG=vhdl
VHDL_SOURCES +=~/Test/UNITTESTINGAUTO/NVC/infra/source/ArithmeticLogicUnit.vhd
VHDL_SOURCES +=~/Test/UNITTESTINGAUTO/NVC/infra/source/RegisterNbits.vhd
VHDL_SOURCES +=~/Test/UNITTESTINGAUTO/NVC/infra/source/RegisteredALU.vhd
VHDL_SOURCES +=~/Test/UNITTESTINGAUTO/NVC/infra/source/RegisteredALU_tb.vhd
TOPLEVEL =registeredalu_tb
MODULE =ParametricTest
include $(shell cocotb-config --makefiles)/Makefile.sim
#make SIM=nvc -w
