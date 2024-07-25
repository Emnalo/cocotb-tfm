-- "half_adder.vhd"
--
-- Copyright (C) 2001  Joaquín Gracia
--     
-- Half Adder.

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY half_adder IS
  PORT ( a         : IN  STD_LOGIC;
         b         : IN  STD_LOGIC;
         s         : OUT STD_LOGIC;
         carry_out : OUT STD_LOGIC
       );
END half_adder;

ARCHITECTURE structural OF half_adder IS

BEGIN
  
  s         <= a XOR b;
  carry_out <= a AND b;
  
END structural;