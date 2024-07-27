SIM_ARGS += --wave=nvc.vcd --format=vcd --dump-arrays
TOPLEVEL_LANG=vhdl
VHDL_SOURCES +=$(shell pwd)/source/bench.vhd
VHDL_SOURCES +=$(shell pwd)/source/fadr_mux.vhd
VHDL_SOURCES +=$(shell pwd)/source/pic_alu.vhd
VHDL_SOURCES +=$(shell pwd)/source/pic_core.vhd
VHDL_SOURCES +=$(shell pwd)/source/pic_ctrl.vhd
VHDL_SOURCES +=$(shell pwd)/source/pic_rom.vhd
VHDL_SOURCES +=$(shell pwd)/source/reg_8rst.vhd
VHDL_SOURCES +=$(shell pwd)/source/reg_8t.vhd
VHDL_SOURCES +=$(shell pwd)/source/reg_cons.vhd
VHDL_SOURCES +=$(shell pwd)/source/reg_file.vhd
VHDL_SOURCES +=$(shell pwd)/source/reg_fsr.vhd
VHDL_SOURCES +=$(shell pwd)/source/reg_inst.vhd
VHDL_SOURCES +=$(shell pwd)/source/reg_io.vhd
VHDL_SOURCES +=$(shell pwd)/source/reg_pc.vhd
VHDL_SOURCES +=$(shell pwd)/source/reg_s.vhd
VHDL_SOURCES +=$(shell pwd)/source/reg_w.vhd
TOPLEVEL = pic_core_test
MODULE =GoldenRun
include $(shell cocotb-config --makefiles)/Makefile.sim
#make SIM=nvc -w
