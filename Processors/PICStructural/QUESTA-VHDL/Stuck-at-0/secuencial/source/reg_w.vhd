-- "reg_w.vhd"
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
-- "Working" register.
-- This register has two 3-state outputs because goes on both busses.

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY reg_w IS
    PORT (
           clock      : IN  STD_LOGIC;
           out_a_en   : IN  STD_LOGIC;
           out_b_en   : IN  STD_LOGIC;
           write_en   : IN  STD_LOGIC;
           data_in    : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
           data_a_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
           data_b_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
         );
END reg_w;

ARCHITECTURE mixed OF reg_w IS
SIGNAL value : STD_LOGIC_VECTOR (7 DOWNTO 0);
BEGIN
    data_a_out <= value WHEN out_a_en = '1' ELSE "ZZZZZZZZ"; 
    data_b_out <= value WHEN out_b_en = '1' ELSE "ZZZZZZZZ"; 

    do_it: PROCESS (clock)
    BEGIN
        IF clock'EVENT AND clock = '1' THEN
            IF write_en = '1' THEN
                value <= data_in;
            END IF;
        END IF;
    END PROCESS;
END mixed;
