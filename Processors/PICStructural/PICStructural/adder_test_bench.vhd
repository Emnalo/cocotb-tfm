-- "sumador.vhd"
--
-- Copyright (C) 2001  Joaquín Gracia
--     
-- Test Bench for the Adder.

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY adder_test_bench IS
END adder_test_bench;


ARCHITECTURE comportamental OF adder_test_bench IS

  component sumador
  PORT ( a         : IN  STD_LOGIC;
         b         : IN  STD_LOGIC;
         carry_in  : IN  STD_LOGIC;
         s         : OUT STD_LOGIC;
         carry_out : OUT STD_LOGIC
       );
  END component;

  SIGNAL e1, e2, s_aux : STD_LOGIC_VECTOR(1 downto 0);
  signal c1, c2 : std_logic;
  signal cero : std_logic := '0';

BEGIN

  e1 <= "00" after 1 ns, "01" after 25 ns, "10" after 40 ns;
  e2 <= "00" after 1 ns, "10" after 15 ns, "01" after 30 ns, "11" after 50 ns;
  
  sumador1 : sumador port map (
                       a => e1(0),
                       b => e2(0),
                       carry_in => cero,
                       s => s_aux(0),
                       carry_out => c1);

  sumador2 : sumador port map (
                       a => e1(1),
                       b => e2(1),
                       carry_in => c1,
                       s => s_aux(1),
                       carry_out => c2);


END comportamental;