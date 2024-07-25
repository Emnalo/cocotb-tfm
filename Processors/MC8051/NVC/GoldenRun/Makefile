SIM_ARGS += --wave=nvc.vcd --format=vcd
TOPLEVEL_LANG=vhdl
VHDL_SOURCES +=$(shell pwd)/bench.vhd
VHDL_SOURCES +=$(shell pwd)/fadr_mux.vhd
VHDL_SOURCES +=$(shell pwd)/half_adder.vhd
VHDL_SOURCES +=$(shell pwd)/operadores.vhd
VHDL_SOURCES +=$(shell pwd)/operadores_y_puertas.vhd
VHDL_SOURCES +=$(shell pwd)/pic_alu.vhd
VHDL_SOURCES +=$(shell pwd)/pic_core.vhd
VHDL_SOURCES +=$(shell pwd)/pic_ctrl.vhd
VHDL_SOURCES +=$(shell pwd)/pic_rom.vhd
VHDL_SOURCES +=$(shell pwd)/puertas.vhd
VHDL_SOURCES +=$(shell pwd)/puertas_y_operadores.vhd
VHDL_SOURCES +=$(shell pwd)/reg_8rst.vhd
VHDL_SOURCES +=$(shell pwd)/reg_8t.vhd
VHDL_SOURCES +=$(shell pwd)/reg_cons.vhd
VHDL_SOURCES +=$(shell pwd)/reg_file.vhd
VHDL_SOURCES +=$(shell pwd)/reg_fsr.vhd
VHDL_SOURCES +=$(shell pwd)/reg_inst.vhd
VHDL_SOURCES +=$(shell pwd)/reg_io.vhd
VHDL_SOURCES +=$(shell pwd)/reg_pc.vhd
VHDL_SOURCES +=$(shell pwd)/reg_s.vhd
VHDL_SOURCES +=$(shell pwd)/reg_w.vhd
VHDL_SOURCES +=$(shell pwd)/sumador.vhd
TOPLEVEL =bench
MODULE =GoldenRun
include $(shell cocotb-config --makefiles)/Makefile.sim
#make SIM=nvc -w
