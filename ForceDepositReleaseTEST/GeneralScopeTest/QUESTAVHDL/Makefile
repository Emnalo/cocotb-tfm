PWD=$(shell pwd)
#GUI=1
TOPLEVEL_LANG = vhdl
VHDL_SOURCES += $(PWD)/GenericComponent.vhdl
VHDL_SOURCES += $(PWD)/Inversor.vhdl
TOPLEVEL = genericcomponent
MODULE = FailTest
WAVES = 1
#COMPILE_ARGS ?=
#RUN_ARGS ?=
#SIM_ARGS ?= vcd file my_vcdfile.vcd vcd add /home/emnalo/Test/ForceDepositReleaseTEST/QUESTAVHDL/*
#SCRIPT_FILE =
include $(shell cocotb-config --makefiles)/Makefile.sim

#make sim=questa
