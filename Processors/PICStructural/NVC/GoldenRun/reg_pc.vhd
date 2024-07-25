-- "reg_pc.vhd"
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
-- This entity/architecture implements the PC and the related 
-- hardware (incrementor, stack, etc.).
-- 
-- There are two couples of inputs/outpus:
--   data_in & data_out (3-state) which are 8-bit wide and are 
--   connected to main busses;
--   addr_in & addr_out which are 9-bit wide and are used to read/write
--   the full address.
--
-- The possible operations are:
--   write_en = '1' : load 8 bits from the bus;
--   push = '1'     : load 8 bits from the bus and push the pc in the stack;
--   pop  = '1'     : pop the pc from the stack;
--   load = '1'     : load 9 bits from addr_in;
--   OTHERS         : increment the pc.

LIBRARY IEEE, util, arith;
USE IEEE.STD_LOGIC_1164.ALL;
use util.util.all;
USE arith.STD_LOGIC_ARITH.ALL;

ENTITY reg_pc IS
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
END reg_pc;

ARCHITECTURE mixed OF reg_pc IS
SIGNAL pc, stack1, stack2 : STD_LOGIC_VECTOR (8 DOWNTO 0);
BEGIN
    data_out <= pc(7 DOWNTO 0) WHEN out_en = '1' ELSE "ZZZZZZZZ";
    addr_out <= pc;
    
    do_it: PROCESS (clock, reset)
    BEGIN
        IF reset = '0' THEN
            pc <= "000000000";
        ELSIF clock'EVENT AND clock = '1' THEN
            IF write_en = '1' THEN
                pc(7 DOWNTO 0) <= data_in;
                pc(8) <= '0';
            ELSIF push = '1' THEN
                pc(7 DOWNTO 0) <= data_in;
                pc(8) <= '0';
                stack1 <= pc;           
                stack2 <= stack1;
            ELSIF pop = '1' THEN
                pc <= stack1;
                stack1 <= stack2;
            ELSIF load = '1' THEN
                pc <= addr_in;
            ELSE
                pc <= pc + '1';
            END IF;
        END IF;
    END PROCESS;
END mixed;
