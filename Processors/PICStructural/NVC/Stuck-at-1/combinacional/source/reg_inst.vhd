-- "reg_inst.vhd"       
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
--
--
-- Instruction register.  
-- 
-- This register holds the instruction-word being executed.
-- If skip = '0' a new instruction word is loaded from the code bus,
-- otherwise a NOP is loaded.  This feature is used in the 2-cycles
-- instructions.  
--
-- imm_out is a tri-state output for immmediate operands and goes on bus_b.

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY reg_inst IS
    PORT (
           clock     : IN  STD_LOGIC;
           reset     : IN  STD_LOGIC;
           skip      : IN  STD_LOGIC;
           out_en    : IN  STD_LOGIC;
           inst_in   : IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
           inst_out  : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
           imm_out   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
         );
END reg_inst;

ARCHITECTURE mixed OF reg_inst IS
SIGNAL value : STD_LOGIC_VECTOR (11 DOWNTO 0);
BEGIN
    imm_out <= value(7 DOWNTO 0) WHEN out_en = '1' ELSE "ZZZZZZZZ";
    inst_out <= value;

    do_it: PROCESS (clock, reset)
    BEGIN
        IF reset = '0' THEN
            value <= "000000000000"; -- This is a NOP.
        ELSIF clock'EVENT AND clock = '1' THEN
            IF skip = '1' THEN
                value <= "000000000000"; -- This is a NOP.
            ELSE
                value <= inst_in;
            END IF;
        END IF;
    END PROCESS;
END mixed;
