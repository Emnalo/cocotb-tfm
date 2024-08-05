SIM_ARGS += --wave=nvc.vcd --format=vcd --dump-arrays
TOPLEVEL_LANG=vhdl
VHDL_SOURCES += $(shell pwd)/source/mc8051_p.vhd

VHDL_SOURCES += $(shell pwd)/source/addsub_cy_.vhd
VHDL_SOURCES += $(shell pwd)/source/addsub_cy_rtl.vhd
VHDL_SOURCES += $(shell pwd)/source/addsub_ovcy_.vhd
VHDL_SOURCES += $(shell pwd)/source/addsub_ovcy_rtl.vhd
VHDL_SOURCES += $(shell pwd)/source/alumux_.vhd
VHDL_SOURCES += $(shell pwd)/source/alumux_rtl.vhd
VHDL_SOURCES += $(shell pwd)/source/comb_divider_.vhd
VHDL_SOURCES += $(shell pwd)/source/comb_divider_rtl.vhd
VHDL_SOURCES += $(shell pwd)/source/comb_mltplr_.vhd
VHDL_SOURCES += $(shell pwd)/source/comb_mltplr_rtl.vhd
VHDL_SOURCES += $(shell pwd)/source/dcml_adjust_.vhd
VHDL_SOURCES += $(shell pwd)/source/dcml_adjust_rtl.vhd

VHDL_SOURCES += $(shell pwd)/source/addsub_core_.vhd
VHDL_SOURCES += $(shell pwd)/source/addsub_core_struc.vhd
VHDL_SOURCES += $(shell pwd)/source/alucore_.vhd
VHDL_SOURCES += $(shell pwd)/source/alucore_rtl.vhd
VHDL_SOURCES += $(shell pwd)/source/control_fsm_.vhd
VHDL_SOURCES += $(shell pwd)/source/control_fsm_rtl.vhd
VHDL_SOURCES += $(shell pwd)/source/control_mem_.vhd
VHDL_SOURCES += $(shell pwd)/source/control_mem_rtl.vhd
VHDL_SOURCES += $(shell pwd)/source/mc8051_alu_.vhd
VHDL_SOURCES += $(shell pwd)/source/mc8051_alu_struc.vhd
VHDL_SOURCES += $(shell pwd)/source/mc8051_control_.vhd
VHDL_SOURCES += $(shell pwd)/source/mc8051_control_struc.vhd
VHDL_SOURCES += $(shell pwd)/source/mc8051_core.vhd
VHDL_SOURCES += $(shell pwd)/source/mc8051_core_struc.vhd

VHDL_SOURCES += $(shell pwd)/source/mc8051_top_.vhd
VHDL_SOURCES += $(shell pwd)/source/mc8051_top_struc_Xilinx.vhd
VHDL_SOURCES += $(shell pwd)/source/RAM.vhd
VHDL_SOURCES += $(shell pwd)/source/ROM.vhd
VHDL_SOURCES += $(shell pwd)/source/SRAMX.vhd

VHDL_SOURCES += $(shell pwd)/source/mc8051_siu_.vhd
VHDL_SOURCES += $(shell pwd)/source/mc8051_siu_rtl.vhd
VHDL_SOURCES += $(shell pwd)/source/mc8051_tmrctr_.vhd
VHDL_SOURCES += $(shell pwd)/source/mc8051_tmrctr_rtl.vhd

VHDL_SOURCES += $(shell pwd)/source/mc8051_tb.vhd
TOPLEVEL = mc8051_tb
MODULE =GoldenRun
include $(shell cocotb-config --makefiles)/Makefile.sim
#make SIM=nvc -w
