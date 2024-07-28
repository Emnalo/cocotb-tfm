-- "reg_file.vhd"
--
-- register-file.
--
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

ENTITY reg_file IS
    PORT (
           clock    : IN  STD_LOGIC;
           write_en : IN  STD_LOGIC;
           out_en   : IN  STD_LOGIC;
           address  : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
           data_in  : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
           data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
         );
END reg_file;

ARCHITECTURE mixed OF reg_file IS

SIGNAL r8  :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL r9  :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL r10 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL r11 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL r12 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL r13 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL r14 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL r15 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL r16 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL r17 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL r18 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL r19 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL r20 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL r21 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL r22 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL r23 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL r24 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL r25 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL r26 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL r27 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL r28 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL r29 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL r30 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL r31 :  STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN
    data_out <= r8  WHEN address = "01000" AND out_en = '1' ELSE "ZZZZZZZZ";
    data_out <= r9  WHEN address = "01001" AND out_en = '1' ELSE "ZZZZZZZZ";
    data_out <= r10 WHEN address = "01010" AND out_en = '1' ELSE "ZZZZZZZZ";
    data_out <= r11 WHEN address = "01011" AND out_en = '1' ELSE "ZZZZZZZZ";
    data_out <= r12 WHEN address = "01100" AND out_en = '1' ELSE "ZZZZZZZZ";
    data_out <= r13 WHEN address = "01101" AND out_en = '1' ELSE "ZZZZZZZZ";
    data_out <= r14 WHEN address = "01110" AND out_en = '1' ELSE "ZZZZZZZZ";
    data_out <= r15 WHEN address = "01111" AND out_en = '1' ELSE "ZZZZZZZZ";
    data_out <= r16 WHEN address = "10000" AND out_en = '1' ELSE "ZZZZZZZZ";
    data_out <= r17 WHEN address = "10001" AND out_en = '1' ELSE "ZZZZZZZZ";
    data_out <= r18 WHEN address = "10010" AND out_en = '1' ELSE "ZZZZZZZZ";
    data_out <= r19 WHEN address = "10011" AND out_en = '1' ELSE "ZZZZZZZZ";
    data_out <= r20 WHEN address = "10100" AND out_en = '1' ELSE "ZZZZZZZZ";
    data_out <= r21 WHEN address = "10101" AND out_en = '1' ELSE "ZZZZZZZZ";
    data_out <= r22 WHEN address = "10110" AND out_en = '1' ELSE "ZZZZZZZZ";
    data_out <= r23 WHEN address = "10111" AND out_en = '1' ELSE "ZZZZZZZZ";
    data_out <= r24 WHEN address = "11000" AND out_en = '1' ELSE "ZZZZZZZZ";
    data_out <= r25 WHEN address = "11001" AND out_en = '1' ELSE "ZZZZZZZZ";
    data_out <= r26 WHEN address = "11010" AND out_en = '1' ELSE "ZZZZZZZZ";
    data_out <= r27 WHEN address = "11011" AND out_en = '1' ELSE "ZZZZZZZZ";
    data_out <= r28 WHEN address = "11100" AND out_en = '1' ELSE "ZZZZZZZZ";
    data_out <= r29 WHEN address = "11101" AND out_en = '1' ELSE "ZZZZZZZZ";
    data_out <= r30 WHEN address = "11110" AND out_en = '1' ELSE "ZZZZZZZZ";
    data_out <= r31 WHEN address = "11111" AND out_en = '1' ELSE "ZZZZZZZZ";

    do_it: PROCESS (clock)
    BEGIN
        IF clock'EVENT AND clock = '1' THEN
            IF write_en = '1' THEN
                CASE address IS
                    WHEN "01000" => r8  <= data_in;
                    WHEN "01001" => r9  <= data_in;
                    WHEN "01010" => r10 <= data_in;
                    WHEN "01011" => r11 <= data_in;
                    WHEN "01100" => r12 <= data_in;
                    WHEN "01101" => r13 <= data_in;
                    WHEN "01110" => r14 <= data_in;
                    WHEN "01111" => r15 <= data_in;
                    WHEN "10000" => r16  <= data_in;
                    WHEN "10001" => r17 <= data_in;
                    WHEN "10010" => r18 <= data_in;
                    WHEN "10011" => r19 <= data_in;
                    WHEN "10100" => r20 <= data_in;
                    WHEN "10101" => r21 <= data_in;
                    WHEN "10110" => r22 <= data_in;
                    WHEN "10111" => r23 <= data_in;
                    WHEN "11000" => r24 <= data_in;
                    WHEN "11001" => r25 <= data_in;
                    WHEN "11010" => r26 <= data_in;
                    WHEN "11011" => r27 <= data_in;
                    WHEN "11100" => r28 <= data_in;
                    WHEN "11101" => r29 <= data_in;
                    WHEN "11110" => r30 <= data_in;
                    WHEN "11111" => r31 <= data_in;
                    WHEN OTHERS => NULL;
                END CASE;
            END IF;
        END IF;
    END PROCESS;
END mixed;
