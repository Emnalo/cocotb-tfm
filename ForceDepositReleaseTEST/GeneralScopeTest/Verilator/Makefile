#VERILATOR_TRACE = 1
#EXTRA_ARGS += --trace-fst --trace-structs
#WAVES = 1
TOPLEVEL_LANG=verilog
VERILOG_SOURCES +=$(PWD)/GenericComponent.v
VERILOG_SOURCES +=$(PWD)/Inversor.v
TOPLEVEL = GenericComponent
MODULE = FailTest
include $(shell cocotb-config --makefiles)/Makefile.sim
#make SIM=verilator
