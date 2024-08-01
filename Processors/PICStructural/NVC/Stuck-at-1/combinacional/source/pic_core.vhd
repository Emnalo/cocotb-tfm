-- "pic_core.vhd"
--
-- Copyright (C) 1998  Ernesto Romani  (romani@ascu.unian.it)
--     
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--     
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--     
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY pic_core IS
  PORT (
         clock : IN  STD_LOGIC;
         reset : IN  STD_LOGIC;
         
         port_a : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         port_b : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         port_c : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0)
       );
END pic_core;

ARCHITECTURE structural OF pic_core IS

COMPONENT pic_ctrl
    PORT (
           inst       : IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
           file_addr  : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
           zero       : IN  STD_LOGIC;
           alu_op     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
           tris_a_wen : OUT STD_LOGIC;
           tris_b_wen : OUT STD_LOGIC;
           tris_c_wen : OUT STD_LOGIC;
           port_a_wen : OUT STD_LOGIC;
           port_b_wen : OUT STD_LOGIC;
           port_c_wen : OUT STD_LOGIC;
           w_wen      : OUT STD_LOGIC;
           w_a_oen    : OUT STD_LOGIC;
           w_b_oen    : OUT STD_LOGIC;
           pc_wen     : OUT STD_LOGIC;
           pc_oen     : OUT STD_LOGIC;
           pc_push    : OUT STD_LOGIC;
           pc_pop     : OUT STD_LOGIC;
           pc_load    : OUT STD_LOGIC;
           fsr_wen    : OUT STD_LOGIC;
           fsr_oen    : OUT STD_LOGIC;
           rtcc_wen   : OUT STD_LOGIC;
           rtcc_oen   : OUT STD_LOGIC;
           file_wen   : OUT STD_LOGIC;
           file_oen   : OUT STD_LOGIC;
           inst_skip  : OUT STD_LOGIC;
           imm_oen    : OUT STD_LOGIC;
           status_oen : OUT STD_LOGIC;
           status_wen : OUT STD_LOGIC;
           carry_wen  : OUT STD_LOGIC;
           zero_wen   : OUT STD_LOGIC;
           port_a_oen : OUT STD_LOGIC;
           port_b_oen : OUT STD_LOGIC;
           port_c_oen : OUT STD_LOGIC;
           const_oen  : OUT STD_LOGIC;
           const_01   : OUT STD_LOGIC
         );
END COMPONENT;

COMPONENT pic_rom
  PORT (
         addr   : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
         data   : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
       );
END COMPONENT;

COMPONENT reg_io
    PORT (
           clock     : IN    STD_LOGIC;
           out_en    : IN    STD_LOGIC;
           write_en  : IN    STD_LOGIC;
           data_in   : IN    STD_LOGIC_VECTOR(7 DOWNTO 0);
           data_out  : OUT   STD_LOGIC_VECTOR(7 DOWNTO 0);
           inout_sel : IN    STD_LOGIC_VECTOR(7 DOWNTO 0);
           dataport  : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0)
         );
END COMPONENT;

COMPONENT fadr_mux
    PORT (
           inst_5    : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
           fsr       : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
           file_addr : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
         );
END COMPONENT;

COMPONENT reg_w
    PORT (
           clock      : IN  STD_LOGIC;
           out_a_en   : IN  STD_LOGIC;
           out_b_en   : IN  STD_LOGIC;
           write_en   : IN  STD_LOGIC;
           data_in    : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
           data_a_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
           data_b_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
         );
END COMPONENT;

COMPONENT reg_8rst
    PORT (
           clock     : IN  STD_LOGIC;
           reset     : IN  STD_LOGIC;
           write_en  : IN  STD_LOGIC;
           data_in   : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
           data_out  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
         );
END COMPONENT;

COMPONENT reg_8t
    PORT (
           clock     : IN  STD_LOGIC;
           out_en    : IN  STD_LOGIC;
           write_en  : IN  STD_LOGIC;
           data_in   : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
           data_out  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
         );
END COMPONENT;

COMPONENT reg_fsr
    PORT (
           clock     : IN  STD_LOGIC;
           out_en    : IN  STD_LOGIC;
           write_en  : IN  STD_LOGIC;
           data_in   : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
           data_out  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
           fsr_out  : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
         );
END COMPONENT;

COMPONENT reg_file
    PORT (
           clock    : IN  STD_LOGIC;
           write_en : IN  STD_LOGIC;
           out_en   : IN  STD_LOGIC;
           address  : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
           data_in  : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
           data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
         );
END COMPONENT;

COMPONENT reg_inst
    PORT (
           clock     : IN  STD_LOGIC;
           reset     : IN  STD_LOGIC;
           skip      : IN  STD_LOGIC;
           out_en    : IN  STD_LOGIC;
           inst_in   : IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
           inst_out  : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
           imm_out   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
         );
END COMPONENT;

COMPONENT reg_pc
    PORT (
           clock     : IN  STD_LOGIC;
           reset     : IN  STD_LOGIC;
           out_en    : IN  STD_LOGIC;
           write_en  : IN  STD_LOGIC;
           data_in   : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
           data_out  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
           addr_in   : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
           addr_out  : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
           push      : IN  STD_LOGIC;
           pop       : IN  STD_LOGIC;
           load      : IN  STD_LOGIC
         );
END COMPONENT;

COMPONENT reg_s
    PORT (
           clock     : IN  STD_LOGIC;
           reset     : IN  STD_LOGIC;
           out_en    : IN  STD_LOGIC;
           write_en  : IN  STD_LOGIC;
           data_in   : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
           data_out  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
           carry_out : OUT STD_LOGIC;
           carry_in  : IN  STD_LOGIC;
           zero_in   : IN  STD_LOGIC;
           carry_wr  : IN  STD_LOGIC;
           zero_wr   : IN  STD_LOGIC
         );
END COMPONENT;

COMPONENT pic_alu
  PORT (
         operation :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
         a, b      :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
         res       :  OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         carry_in  :  IN  STD_LOGIC;
         carry_out :  OUT STD_LOGIC;
         zero      :  OUT STD_LOGIC
       );
END COMPONENT;

COMPONENT reg_cons
    PORT (
           out_en    : IN  STD_LOGIC;
           const_01  : IN  STD_LOGIC;
           data_out  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
         );
END COMPONENT;

-- Main busses.  "bus_a" and "bus_b" are 3-state busses and provide the
-- operands for the ALU.  "bus_out" carries the ALU's output.

SIGNAL bus_a, bus_b, bus_out : STD_LOGIC_VECTOR(7 DOWNTO 0);

-- ROM address & data signals.

SIGNAL pic_rom_addr : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL pic_rom_data : STD_LOGIC_VECTOR(11 DOWNTO 0);

-- ALU signals.  "carry_old" is the carry-in (note that this carry is only
-- used in shift operations), "carry_new" is the carry-out.
-- "carry_new" and "zero" go in the status register where they are saved
-- or not depending on the value of the appropriate control signals.
-- "zero" goes also in the controller.

SIGNAL carry_new : STD_LOGIC;
SIGNAL carry_old : STD_LOGIC;
SIGNAL zero      : STD_LOGIC;
SIGNAL alu_op    : STD_LOGIC_VECTOR(3 DOWNTO 0);

-- FSR, used for indirect addressing.  When accessing a register, if
-- its address (contained in "inst(4 DOWNTO 0)") is zero (i.e. it's an 
-- access to the INDF register) it is replaced with FSR.  This is done
-- in "fadr_mux".

SIGNAL fsr : STD_LOGIC_VECTOR(4 DOWNTO 0);

-- Address of a register in the register file.
-- This is the _effective_ address, coming out from "fadr_mux".

SIGNAL file_addr : STD_LOGIC_VECTOR(4 DOWNTO 0);

-- Instruction word.

SIGNAL inst : STD_LOGIC_VECTOR(11 DOWNTO 0);

-- Control signals.  These signals are produced by the controller depending
-- on which instruction has to be executed.  Here "wen" means write-enable
-- (i.e. save the value present on the bus when this signal is high), "oen" 
-- means output-enable (i.e. put the value on the 3-state bus when this 
-- signal is high).  Refer to the other source files for the meanings of the 
-- other signals.

-- input/output configuration of the I/O ports.
SIGNAL port_a_tri : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL port_b_tri : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL port_c_tri : STD_LOGIC_VECTOR(7 DOWNTO 0);

SIGNAL port_a_oen : STD_LOGIC;
SIGNAL port_b_oen : STD_LOGIC;
SIGNAL port_c_oen : STD_LOGIC;
SIGNAL port_a_wen : STD_LOGIC; 
SIGNAL port_b_wen : STD_LOGIC; 
SIGNAL port_c_wen : STD_LOGIC;
SIGNAL tris_a_wen : STD_LOGIC;
SIGNAL tris_b_wen : STD_LOGIC;
SIGNAL tris_c_wen : STD_LOGIC;
SIGNAL w_wen : STD_LOGIC;
SIGNAL w_a_oen : STD_LOGIC;
SIGNAL w_b_oen : STD_LOGIC;
SIGNAL pc_wen : STD_LOGIC;
SIGNAL pc_oen : STD_LOGIC;
SIGNAL pc_push : STD_LOGIC;
SIGNAL pc_pop : STD_LOGIC;
SIGNAL pc_load : STD_LOGIC;
SIGNAL fsr_wen : STD_LOGIC;
SIGNAL fsr_oen : STD_LOGIC;
SIGNAL rtcc_wen : STD_LOGIC;
SIGNAL rtcc_oen : STD_LOGIC;
SIGNAL file_wen : STD_LOGIC;
SIGNAL file_oen : STD_LOGIC;
SIGNAL inst_skip : STD_LOGIC;
SIGNAL imm_oen : STD_LOGIC;
SIGNAL status_oen : STD_LOGIC;
SIGNAL status_wen : STD_LOGIC;
SIGNAL carry_wen : STD_LOGIC;
SIGNAL zero_wen : STD_LOGIC;
SIGNAL const_oen : STD_LOGIC;
SIGNAL const_01 : STD_LOGIC;

BEGIN 

    rom : pic_rom PORT MAP
       (
         addr => pic_rom_addr,
         data => pic_rom_data
       );

    port_a_reg : reg_io PORT MAP
         (
           clock     => clock,
           out_en    => port_a_oen,
           write_en  => port_a_wen,
           data_in   => bus_out,
           data_out  => bus_a,
           inout_sel => port_a_tri,
           dataport  => port_a
         );

    port_b_reg : reg_io PORT MAP
         (
           clock     => clock,
           out_en    => port_b_oen,
           write_en  => port_b_wen,
           data_in   => bus_out,
           data_out  => bus_a,
           inout_sel => port_b_tri,
           dataport  => port_b
         );

    port_c_reg : reg_io PORT MAP
         (
           clock     => clock,
           out_en    => port_c_oen,
           write_en  => port_c_wen,
           data_in   => bus_out,
           data_out  => bus_a,
           inout_sel => port_c_tri,
           dataport  => port_c
         );

    working_register : reg_w PORT MAP
         (
           clock      => clock,
           out_a_en   => w_a_oen,
           out_b_en   => w_b_oen,
           write_en   => w_wen,
           data_in    => bus_out,
           data_a_out => bus_a,
           data_b_out => bus_b
         );

    io_conf_port_a : reg_8rst PORT MAP
         (
           clock     =>  clock,
           reset     =>  reset,
           write_en  =>  tris_a_wen,
           data_in   =>  bus_out,
           data_out  =>  port_a_tri
         );

    io_conf_port_b : reg_8rst PORT MAP
         (
           clock     =>  clock,
           reset     =>  reset,
           write_en  =>  tris_b_wen,
           data_in   =>  bus_out,
           data_out  =>  port_b_tri
         );
    
    io_conf_port_c : reg_8rst PORT MAP
         (
           clock     =>  clock,
           reset     =>  reset,
           write_en  =>  tris_c_wen,
           data_in   =>  bus_out,
           data_out  =>  port_c_tri
         );
    
    instruction_register : reg_inst PORT MAP
         (
           clock     =>  clock,
           reset     =>  reset,
           skip      =>  inst_skip,
           out_en    =>  imm_oen,
           inst_in   =>  pic_rom_data,
           inst_out  =>  inst,
           imm_out   =>  bus_b
         );
    
    fsr_register : reg_fsr PORT MAP
         (
           clock     =>  clock,
           out_en    =>  fsr_oen,
           write_en  =>  fsr_wen,
           data_in   =>  bus_out,
           data_out  =>  bus_a,
           fsr_out   =>  fsr
         );

    file_address_mux : fadr_mux PORT MAP
         (
           inst_5     => inst(4 DOWNTO 0),
           fsr        => fsr,
           file_addr  => file_addr
         );
    
    register_file : reg_file PORT MAP
         (
           clock    =>  clock,
           write_en =>  file_wen,
           out_en   =>  file_oen,
           address  =>  file_addr,
           data_in  =>  bus_out,
           data_out =>  bus_a
         );

    program_counter : reg_pc PORT MAP
         (
           clock     =>  clock,
           reset     =>  reset,
           out_en    =>  pc_oen,
           write_en  =>  pc_wen,
           data_in   =>  bus_out,
           data_out  =>  bus_a,
           addr_in   =>  inst(8 DOWNTO 0),
           addr_out  =>  pic_rom_addr,
           push      =>  pc_push,
           pop       =>  pc_pop,
           load      =>  pc_load
         );

    status_register : reg_s PORT MAP
         (
           clock     =>  clock,
           reset     =>  reset,
           out_en    =>  status_oen,
           write_en  =>  status_wen,
           data_in   =>  bus_out,
           data_out  =>  bus_a,
           carry_out =>  carry_old,
           carry_in  =>  carry_new,
           zero_in   =>  zero,
           carry_wr  =>  carry_wen,
           zero_wr   =>  zero_wen
         );

    constants_generator : reg_cons PORT MAP
         (
           out_en    => const_oen,
           const_01  => const_01,
           data_out  => bus_b
         );

    rtcc : reg_8t PORT MAP
         (
           clock     =>  clock,
           out_en    =>  rtcc_oen,
           write_en  =>  rtcc_wen,
           data_in   =>  bus_out,
           data_out  =>  bus_a
         );
    
    alu : pic_alu PORT MAP
       (
           operation  =>  alu_op,
           a          =>  bus_a,
           b          =>  bus_b,
           res        =>  bus_out,
           carry_in   =>  carry_old,
           carry_out  =>  carry_new,
           zero       =>  zero
       );

    controller : pic_ctrl PORT MAP
       (
         inst       =>  inst,
         file_addr  =>  file_addr,
         zero       =>  zero,
         alu_op     =>  alu_op,
         tris_a_wen =>  tris_a_wen,
         tris_b_wen =>  tris_b_wen,
         tris_c_wen =>  tris_c_wen,
         port_a_wen =>  port_a_wen,
         port_b_wen =>  port_b_wen,
         port_c_wen =>  port_c_wen,
         w_wen      =>  w_wen,
         w_a_oen    =>  w_a_oen,
         w_b_oen    =>  w_b_oen,
         pc_wen     =>  pc_wen,
         pc_oen     =>  pc_oen,
         pc_push    =>  pc_push,
         pc_pop     =>  pc_pop,
         pc_load    =>  pc_load,
         fsr_wen    =>  fsr_wen,
         fsr_oen    =>  fsr_oen,
         rtcc_wen   =>  rtcc_wen,
         rtcc_oen   =>  rtcc_oen,
         file_wen   =>  file_wen,
         file_oen   =>  file_oen,
         inst_skip  =>  inst_skip,
         imm_oen    =>  imm_oen,
         status_oen =>  status_oen,
         status_wen =>  status_wen,
         carry_wen  =>  carry_wen,
         zero_wen   =>  zero_wen,
         port_a_oen =>  port_a_oen,
         port_b_oen =>  port_b_oen,
         port_c_oen =>  port_c_oen,
         const_oen  =>  const_oen,
         const_01   =>  const_01
       );
    
END structural;

