-- "reg_cons.vhd"
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
-- Constants generator.
-- Generates the constants 0 (used for CLR instructions) 
-- and 1 (used for INC/DEC instructions).

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY reg_cons IS
    PORT (
           out_en    : IN  STD_LOGIC;
           const_01  : IN  STD_LOGIC;
           data_out  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
         );
END reg_cons;

ARCHITECTURE dataflow OF reg_cons IS
BEGIN
    data_out(7 DOWNTO 0) <= "0000000" & const_01 WHEN out_en = '1' ELSE 
                            "ZZZZZZZZ";
END dataflow;
