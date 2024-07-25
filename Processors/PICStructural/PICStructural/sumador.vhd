-- "sumador.vhd"
--
-- Copyright (C) 2001  Joaquín Gracia
--     
-- Adder.

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY sumador IS
  PORT ( a         : IN  STD_LOGIC;
         b         : IN  STD_LOGIC;
         carry_in  : IN  STD_LOGIC;
         s         : OUT STD_LOGIC;
         carry_out : OUT STD_LOGIC
       );
END sumador;

ARCHITECTURE structural OF sumador IS

  component half_adder
    PORT ( a         : IN  STD_LOGIC;
           b         : IN  STD_LOGIC;
           s         : OUT STD_LOGIC;
           carry_out : OUT STD_LOGIC
         );
  END component;
  
  SIGNAL s1, s2, s3 : STD_LOGIC;

BEGIN
  
  half_adder1 : half_adder port map (
                          a         => a,
  			  b         => b,
  			  s         => s1,
  			  carry_out => s2
  			  );


  half_adder2 : half_adder port map (
                          a         => s1,
  			  b         => carry_in,
  			  s         => s,
  			  carry_out => s3
  			  );


  carry_out <= s2 or s3;
  
END structural;