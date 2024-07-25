vlib work
vmap work work

vcom -vopt +acc HDL/mc8051_p.vhd
vcom -vopt +acc HDL/addsub_core_.vhd
vcom -vopt +acc HDL/addsub_core_struc.vhd
vcom -vopt +acc HDL/addsub_cy_.vhd
vcom -vopt +acc HDL/addsub_cy_rtl.vhd
vcom -vopt +acc HDL/addsub_ovcy_.vhd
vcom -vopt +acc HDL/addsub_ovcy_rtl.vhd
vcom -vopt +acc HDL/alucore_.vhd
vcom -vopt +acc HDL/alucore_rtl.vhd
vcom -vopt +acc HDL/alumux_.vhd
vcom -vopt +acc HDL/alumux_rtl.vhd
vcom -vopt +acc HDL/comb_divider_.vhd
vcom -vopt +acc HDL/comb_divider_rtl.vhd
vcom -vopt +acc HDL/comb_mltplr_.vhd
vcom -vopt +acc HDL/comb_mltplr_rtl.vhd
vcom -vopt +acc HDL/control_fsm_.vhd
vcom -vopt +acc HDL/control_fsm_rtl.vhd
vcom -vopt +acc HDL/control_mem_.vhd
vcom -vopt +acc HDL/control_mem_rtl.vhd
vcom -vopt +acc HDL/dcml_adjust_.vhd
vcom -vopt +acc HDL/dcml_adjust_rtl.vhd
vcom -vopt +acc HDL/mc8051_alu_.vhd
vcom -vopt +acc HDL/mc8051_alu_struc.vhd
vcom -vopt +acc HDL/mc8051_control_.vhd
vcom -vopt +acc HDL/mc8051_control_struc.vhd
vcom -vopt +acc HDL/mc8051_core.vhd
vcom -vopt +acc HDL/mc8051_core_struc.vhd
vcom -vopt +acc HDL/mc8051_siu_.vhd
vcom -vopt +acc HDL/mc8051_siu_rtl.vhd
vcom -vopt +acc HDL/mc8051_tmrctr_.vhd
vcom -vopt +acc HDL/mc8051_tmrctr_rtl.vhd		
vcom -vopt +acc HDL/RAM.vhd		
vcom -vopt +acc HDL/SRAMX.vhd		
vcom -vopt +acc HDL/ROM.vhd		


vcom -vopt +acc HDL/mc8051_top_.vhd
vcom -vopt +acc HDL/mc8051_top_struc_Xilinx.vhd	 

vlog -vopt +acc TbTop.v
