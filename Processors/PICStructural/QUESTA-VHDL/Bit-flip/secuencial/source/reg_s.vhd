-- "reg_s.vhd"
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
-- Status register.  It has a main 3-state output plus some special
-- inputs/outputs for the carry and zero flags.

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY reg_s IS
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
END reg_s;

ARCHITECTURE mixed OF reg_s IS
SIGNAL value : STD_LOGIC_VECTOR (7 DOWNTO 0);
BEGIN
    data_out <= value WHEN out_en = '1' ELSE "ZZZZZZZZ";
    carry_out <= value(2);    

    do_it: PROCESS (clock, reset)
    BEGIN
        IF reset = '0' THEN
            value <= "00000000";
        ELSIF clock'EVENT AND clock = '1' THEN
            IF write_en = '1' THEN
                value <= data_in;
            ELSE
                IF carry_wr = '1' THEN     
                    value(2) <= carry_in;
                END IF;
                IF zero_wr = '1' THEN     
                    value(0) <= zero_in;
                END IF;
            END IF;
        END IF;
    END PROCESS;
END mixed;
