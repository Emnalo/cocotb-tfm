-- "reg_io.vhd"
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
-- 8-bit bidirectional I/O port.
-- 
-- This unit is used to implement the I/O ports of the PIC.
-- Each bit can be configured either as input or output.
-- inout_sel selects a input (1) or output (0) configuration for each bit.
-- The state of the I/O pins is set using data_in & write_en.
-- The state of the I/O pins is sampled at every clock's rising edge
-- and can be read using data_out (3-state) & out_en.

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY reg_io IS
    PORT (
           clock     : IN    STD_LOGIC;
           out_en    : IN    STD_LOGIC;
           write_en  : IN    STD_LOGIC;
           data_in   : IN    STD_LOGIC_VECTOR(7 DOWNTO 0);
           data_out  : OUT   STD_LOGIC_VECTOR(7 DOWNTO 0);
           inout_sel : IN    STD_LOGIC_VECTOR(7 DOWNTO 0);
           dataport  : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0)
         );
END reg_io;

ARCHITECTURE mixed OF reg_io IS
SIGNAL output_value : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL input_value  : STD_LOGIC_VECTOR (7 DOWNTO 0);
BEGIN
    dataport(0) <= output_value(0) WHEN inout_sel(0) = '0' ELSE 'Z';
    dataport(1) <= output_value(1) WHEN inout_sel(1) = '0' ELSE 'Z';
    dataport(2) <= output_value(2) WHEN inout_sel(2) = '0' ELSE 'Z';
    dataport(3) <= output_value(3) WHEN inout_sel(3) = '0' ELSE 'Z';
    dataport(4) <= output_value(4) WHEN inout_sel(4) = '0' ELSE 'Z';
    dataport(5) <= output_value(5) WHEN inout_sel(5) = '0' ELSE 'Z';
    dataport(6) <= output_value(6) WHEN inout_sel(6) = '0' ELSE 'Z';
    dataport(7) <= output_value(7) WHEN inout_sel(7) = '0' ELSE 'Z';
    
    data_out <= input_value WHEN out_en = '1' ELSE "ZZZZZZZZ";    

    do_it: PROCESS (clock)
    BEGIN
        IF clock'EVENT AND clock = '1' THEN
            IF write_en = '1' THEN
                output_value <= data_in;
            END IF;
            input_value <= dataport;
        END IF;
    END PROCESS;
END mixed;
