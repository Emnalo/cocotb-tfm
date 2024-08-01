-- "bench.vhd"
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

------------------------------------------------------------------------
-- architecture declaration
------------------------------------------------------------------------

entity pic_core_test is
generic (CLK_PERIOD : TIME := 10 ns);
end pic_core_test;

architecture tbench_1 of pic_core_test is
   component pic_core
   port(
      clock		: in std_logic ;
      reset		: in std_logic ;
      port_a		: inout std_logic_vector( 7 downto 0  ) ;
      port_b		: inout std_logic_vector( 7 downto 0  ) ;
      port_c		: inout std_logic_vector( 7 downto 0  )
       ) ;


   end component ;

      signal t_clock		:std_logic := '0';
      signal t_reset		:std_logic ;
      signal t_port_a		:std_logic_vector( 7 downto 0  ) ;
      signal t_port_b		:std_logic_vector( 7 downto 0  ) ;
      signal t_port_c		:std_logic_vector( 7 downto 0  ) ;
begin

  top : pic_core
	port map (
	   clock => t_clock ,
	   reset => t_reset ,
	   port_a => t_port_a ,
	   port_b => t_port_b ,
	   port_c => t_port_c
	 ) ;

        t_clock <= NOT t_clock after CLK_PERIOD/2;
        t_reset <= '1', '0' after 5 ns, '1' after 1000 ns;


end tbench_1;
