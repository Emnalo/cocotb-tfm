-- "fadr_mux.vhd"
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
-- This unit implements the indirect addressing-mode.
-- References to R0 (INDF) are redirected to the register pointed by FSR.
-- file_addr is the address of the register to be accessed; inst_5 is the
-- register's address specified in the instruction-word.
--
-- This unit is really small and could be coded inside the controller, but 
-- since it doesn't perform a real "control" function, I prefer to keep
-- is separated.  Moreover, the schematic looks nicer this way :)

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY fadr_mux IS
    PORT (
           inst_5    : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
           fsr       : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
           file_addr : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
         );
END fadr_mux;

ARCHITECTURE dataflow OF fadr_mux IS
BEGIN
    file_addr <= fsr WHEN inst_5 = "00000" ELSE
                 inst_5;
END dataflow;
