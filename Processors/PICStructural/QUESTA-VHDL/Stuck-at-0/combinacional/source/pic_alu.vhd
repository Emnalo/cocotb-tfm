-- "pic_alu.vhd"
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
-- Arithmetic-Logic Unit.

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY pic_alu IS
  PORT (
         operation : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
         a         : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
         b         : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
         res       : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         carry_in  : IN  STD_LOGIC;
         carry_out : OUT STD_LOGIC;
         zero      : OUT STD_LOGIC
       );
END pic_alu;

ARCHITECTURE dataflow OF pic_alu IS

CONSTANT  ALUOP_ADD        : STD_LOGIC_VECTOR (3 DOWNTO 0)  := "0000";
CONSTANT  ALUOP_SUB        : STD_LOGIC_VECTOR (3 DOWNTO 0)  := "0001";
CONSTANT  ALUOP_AND        : STD_LOGIC_VECTOR (3 DOWNTO 0)  := "0010";
CONSTANT  ALUOP_OR         : STD_LOGIC_VECTOR (3 DOWNTO 0)  := "0011";
CONSTANT  ALUOP_XOR        : STD_LOGIC_VECTOR (3 DOWNTO 0)  := "0100";
CONSTANT  ALUOP_COM        : STD_LOGIC_VECTOR (3 DOWNTO 0)  := "0101";
CONSTANT  ALUOP_ROR        : STD_LOGIC_VECTOR (3 DOWNTO 0)  := "0110";
CONSTANT  ALUOP_ROL        : STD_LOGIC_VECTOR (3 DOWNTO 0)  := "0111";
CONSTANT  ALUOP_SWAP       : STD_LOGIC_VECTOR (3 DOWNTO 0)  := "1000";
CONSTANT  ALUOP_BITCLR     : STD_LOGIC_VECTOR (3 DOWNTO 0)  := "1001";
CONSTANT  ALUOP_BITSET     : STD_LOGIC_VECTOR (3 DOWNTO 0)  := "1010";
CONSTANT  ALUOP_BITTESTCLR : STD_LOGIC_VECTOR (3 DOWNTO 0)  := "1011";
CONSTANT  ALUOP_BITTESTSET : STD_LOGIC_VECTOR (3 DOWNTO 0)  := "1100";
CONSTANT  ALUOP_PASSA      : STD_LOGIC_VECTOR (3 DOWNTO 0)  := "1101";
CONSTANT  ALUOP_PASSB      : STD_LOGIC_VECTOR (3 DOWNTO 0)  := "1110";

SIGNAL temp_b     : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL temp_carry : UNSIGNED(0 downto 0);

SIGNAL result, temp_c : STD_LOGIC_VECTOR (8 DOWNTO 0);

SIGNAL bit_pattern : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL bit_test    : STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN

  bit_pattern <= "00000001" WHEN b(7 DOWNTO 5) = "000" ELSE
                 "00000010" WHEN b(7 DOWNTO 5) = "001" ELSE
                 "00000100" WHEN b(7 DOWNTO 5) = "010" ELSE
                 "00001000" WHEN b(7 DOWNTO 5) = "011" ELSE
                 "00010000" WHEN b(7 DOWNTO 5) = "100" ELSE
                 "00100000" WHEN b(7 DOWNTO 5) = "101" ELSE
                 "01000000" WHEN b(7 DOWNTO 5) = "110" ELSE
                 "10000000" WHEN b(7 DOWNTO 5) = "111" ELSE
                 "XXXXXXXX"; -- Only for simulation.

  -- temp_b and temp_carry are used for ADD/SUB operations.
  -- temp_carry is the carry-in of the ADDER.
  -- Note that the ALU's carry-in is only used in shift operations. 
 
  temp_carry <= "1" WHEN operation = ALUOP_SUB ELSE "0";
  temp_b <= NOT b WHEN operation = ALUOP_SUB ELSE b;

  result <=  std_logic_vector(unsigned("0" & a) + unsigned(temp_b) + temp_carry) 
      WHEN (operation = ALUOP_ADD OR operation = ALUOP_SUB) ELSE "ZZZZZZZZZ";
  result <= "-" & (a AND b)
      WHEN operation = ALUOP_AND ELSE "ZZZZZZZZZ";
  result <= "-" & (a OR b)
      WHEN operation = ALUOP_OR ELSE "ZZZZZZZZZ";
  result <= "-" & (a XOR b)
      WHEN operation = ALUOP_XOR ELSE "ZZZZZZZZZ";
  result <= "-" & (NOT a)
      WHEN operation = ALUOP_COM ELSE "ZZZZZZZZZ";
  result <= a(0) & carry_in & a(7 DOWNTO 1)
      WHEN operation = ALUOP_ROR ELSE "ZZZZZZZZZ";
  result <= a & carry_in
      WHEN operation = ALUOP_ROL ELSE "ZZZZZZZZZ";
  result <= "-" & a(3 DOWNTO 0) & a(7 DOWNTO 4)
      WHEN operation = ALUOP_SWAP ELSE "ZZZZZZZZZ";
  result <= "-" & ((NOT bit_pattern) AND a)
      WHEN operation = ALUOP_BITCLR ELSE "ZZZZZZZZZ";
  result <= "-" & (bit_pattern OR a)
      WHEN operation = ALUOP_BITSET ELSE "ZZZZZZZZZ";
  result <= "-" & a
      WHEN operation = ALUOP_PASSA ELSE "ZZZZZZZZZ";
  result <= "-" & b
      WHEN operation = ALUOP_PASSB ELSE "ZZZZZZZZZ";

  res <= result(7 DOWNTO 0);
  carry_out <= result(8);

  bit_test <= bit_pattern AND a;

  zero <= '1' WHEN (bit_test /= "00000000") AND 
                   (operation = ALUOP_BITTESTSET) ELSE
          '1' WHEN (bit_test = "00000000") AND 
                   (operation = ALUOP_BITTESTCLR) ELSE
          '1' WHEN result(7 DOWNTO 0) = "00000000" ELSE
          '0';

END dataflow;
