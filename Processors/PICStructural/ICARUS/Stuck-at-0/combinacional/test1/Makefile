TOPLEVEL_LANG=verilog
VERILOG_SOURCES +=$(shell pwd)/../source/fadr_mux.v
VERILOG_SOURCES +=$(shell pwd)/../source/pic_alu.v
VERILOG_SOURCES +=$(shell pwd)/../source/reg_8rst.v
VERILOG_SOURCES +=$(shell pwd)/../source/reg_8t.v
VERILOG_SOURCES +=$(shell pwd)/../source/reg_cons.v
VERILOG_SOURCES +=$(shell pwd)/../source/reg_file.v
VERILOG_SOURCES +=$(shell pwd)/../source/reg_fsr.v
VERILOG_SOURCES +=$(shell pwd)/../source/reg_inst.v
VERILOG_SOURCES +=$(shell pwd)/../source/reg_io.v
VERILOG_SOURCES +=$(shell pwd)/../source/reg_pc.v
VERILOG_SOURCES +=$(shell pwd)/../source/reg_s.v
VERILOG_SOURCES +=$(shell pwd)/../source/reg_w.v
VERILOG_SOURCES +=$(shell pwd)/../source/pic_core.v
VERILOG_SOURCES +=$(shell pwd)/../source/pic_ctrl.v
VERILOG_SOURCES +=$(shell pwd)/../source/pic_rom.v
VERILOG_SOURCES +=$(shell pwd)/../source/bench.v
TOPLEVEL = bench
MODULE = ParametricTest
include $(shell cocotb-config --makefiles)/Makefile.sim
#make SIM=icarus
