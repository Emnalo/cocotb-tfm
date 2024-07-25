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

LIBRARY IEEE, util, arith;
USE IEEE.STD_LOGIC_1164.ALL;
use util.util.all;
USE arith.STD_LOGIC_ARITH.ALL;

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
SIGNAL temp_carry : STD_LOGIC;

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
 
  temp_carry <= '1' WHEN operation = ALUOP_SUB ELSE '0';
  temp_b <= NOT b WHEN operation = ALUOP_SUB ELSE b;
  temp_c <= ("0" & a);

  result <=  temp_c + temp_b + temp_carry 
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



-- "pic_alu_puertas.vhd"
--
-- Copyright (C) 1998  Ernesto Romani  (romani@ascu.unian.it)
--               2001  Joaquín Gracia
--		 2002  Francisco González
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

-------------------------------------------
-- PIC_ALU
-------------------------------------------
LIBRARY IEEE, util, arith;
USE IEEE.STD_LOGIC_1164.ALL;
use util.util.all;
USE arith.STD_LOGIC_ARITH.ALL;

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

ARCHITECTURE structural OF pic_alu IS

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

SIGNAL result	   : STD_LOGIC_VECTOR (8 DOWNTO 0);

SIGNAL temp_carry : STD_LOGIC;

SIGNAL bit_pattern 	    : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL bittestset_vector    : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL bittestclr_vector    : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL bittestset_result, not_bittestset_result : STD_LOGIC;
SIGNAL bittestclr_result, not_bittestclr_result : STD_LOGIC;
SIGNAL test_result : STD_LOGIC;
  
SIGNAL a_aux, b_aux, s_aux, c_aux, or_aux :STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL xor_aux, and_aux, not_aux, bitset_aux, bitclr_aux : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL not_aux_a, not_aux_b : STD_LOGIC_VECTOR (7 DOWNTO 0);


-- TXIMO
  component sumador
  PORT ( a         : IN  STD_LOGIC;
         b         : IN  STD_LOGIC;
         carry_in  : IN  STD_LOGIC;
         s         : OUT STD_LOGIC;
         carry_out : OUT STD_LOGIC
       );
  END component;
  
-- FRAGONIB
  component o_NOT8
  PORT ( a         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
         s         : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
       );
  END component;
  
  component o_OR8
  PORT ( a         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
         b         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
         s         : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
       );
  END component;
 
  component o_XOR8
  PORT ( a         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
         b         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
         s         : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
       );
  END component;

  component o_AND8
  PORT ( a         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
         b         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
         s         : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
       );
  END component;
  
  component o_BITCLR
  PORT ( a         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
         c         : IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
         s         : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
       );
  END component;
  
  component o_BITSET
  PORT ( a         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
         c         : IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
         s         : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
       );
  END component;
  
  COMPONENT deco
     PORT ( c         : IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
            s         : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
          );
  END COMPONENT;
  
  COMPONENT comparador_a_0
  PORT ( e         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
         s         : OUT STD_LOGIC
       );
  END COMPONENT;
  
  COMPONENT p_NOT
    PORT ( a         : IN  STD_LOGIC;
           s         : OUT STD_LOGIC
         );
  END COMPONENT;


BEGIN

------------------------------------
-- OPERACIONES Aritmético-Lógicas --
------------------------------------

-- TXIMO
  -- Operador SUMA/RESTA
  -- Observación: 
  --	La señal carry-in de la ALU se usa unicamente en operaciones de desplazamiento.
  temp_carry <= '1' WHEN operation = ALUOP_SUB ELSE '0';
  	-- temp_carry es la entrada de acarreo del sumador
  a_aux <= a WHEN (operation = ALUOP_ADD OR operation = ALUOP_SUB) ELSE "ZZZZZZZZ";
    	-- Complemento a dos del operando b para la resta
  b_aux <= not_aux_b WHEN operation = ALUOP_SUB ELSE b;
    
  adder : for i in 7 downto 0 generate
          condicion1 : if (i = 0) generate
                         adder_0 : sumador port map (
                               a => a_aux(i),
                               b => b_aux(i),
                               carry_in => temp_carry,
                               s => s_aux(i),
                               carry_out => c_aux(i)
                              );
          end generate condicion1;
          condicion2 : if (i > 0) generate
                          adder_n : sumador port map ( 
                               a => a_aux(i),
                               b => b_aux(i),
                               carry_in => c_aux(i-1),
                               s => s_aux(i),
                               carry_out => c_aux(i)
                              );
          end generate condicion2;
  end generate adder;


-- FRAGONIB
  -- Operacion NOT
  operador_not8_a : o_NOT8 port map (
	a => a,
	s => not_aux_a
	);
	
  operador_not8_b : o_NOT8 port map (
	a => b,
	s => not_aux_b
	);  -- Necesario para la resta
	
  -- Operacion OR
  operador_or8 : o_OR8 port map (
	a => a,
	b => b,
	s => or_aux
	);

  -- Operacion XOR
  operador_xor8 : o_XOR8 port map (
	a => a,
	b => b,
	s => xor_aux
	);

  -- Operacion AND
  operador_and8 : o_AND8 port map (
	a => a,
	b => b,
	s => and_aux
	);
	
  -- Operacion BITSET
  operador_bitset : o_BITSET port map (
	a => a,
	c => b(7 DOWNTO 5),
	s => bitset_aux
	);
	
  -- Operacion BITCLR
  operador_bitclr : o_BITCLR port map (
	a => a,
	c => b(7 DOWNTO 5),
	s => bitclr_aux
	);

-----------------------------------
-- Encaminamiento de resultados. --
-----------------------------------

  result <= c_aux(7) & s_aux 
      WHEN (operation = ALUOP_ADD OR operation = ALUOP_SUB) ELSE "ZZZZZZZZZ";
  result <= "-" & and_aux
      WHEN operation = ALUOP_AND ELSE "ZZZZZZZZZ";
  result <= "-" & or_aux
      WHEN operation = ALUOP_OR ELSE "ZZZZZZZZZ";
  result <= "-" & xor_aux
      WHEN operation = ALUOP_XOR ELSE "ZZZZZZZZZ";
  result <= "-" & not_aux_a
      WHEN operation = ALUOP_COM ELSE "ZZZZZZZZZ";
  result <= a(0) & carry_in & a(7 DOWNTO 1)
      WHEN operation = ALUOP_ROR ELSE "ZZZZZZZZZ";
  result <= a & carry_in
      WHEN operation = ALUOP_ROL ELSE "ZZZZZZZZZ";
  result <= "-" & a(3 DOWNTO 0) & a(7 DOWNTO 4)
      WHEN operation = ALUOP_SWAP ELSE "ZZZZZZZZZ";
  result <= "-" & bitclr_aux
      WHEN operation = ALUOP_BITCLR ELSE "ZZZZZZZZZ";
  result <= "-" & bitset_aux
      WHEN operation = ALUOP_BITSET ELSE "ZZZZZZZZZ";
  result <= "-" & a
      WHEN operation = ALUOP_PASSA ELSE "ZZZZZZZZZ";
  result <= "-" & b
      WHEN operation = ALUOP_PASSB ELSE "ZZZZZZZZZ";

  res <= result(7 DOWNTO 0);
  carry_out <= result(8);

  -- Generación del FLAG 'zero'
  bittestpattern: deco
     PORT MAP ( c => b(7 DOWNTO 5),
     		s => bit_pattern               
              );
  
  bittestsetoperator: o_AND8 
     PORT MAP (	a => a,
		b => bit_pattern,
		s => bittestset_vector
	      );
	      
  bittestclroperator: o_AND8 
     PORT MAP (	a => not_aux_a,
		b => bit_pattern,
		s => bittestclr_vector
	      );
	  
  comp0: comparador_a_0
     PORT MAP (	e => bittestset_vector,
		s => bittestset_result
	      );
	      
  comp1: comparador_a_0
     PORT MAP (	e => bittestclr_vector,
		s => bittestclr_result
	      );

  not0: p_NOT
     PORT MAP ( a => bittestset_result,
     		s => not_bittestset_result
     	      );

  not1: p_NOT
     PORT MAP ( a => bittestclr_result,
     		s => not_bittestclr_result
     	      );
	      
  comp2: comparador_a_0
     PORT MAP (	e => result(7 DOWNTO 0),
		s => test_result
	      );	      
	      
  zero <= not_bittestset_result WHEN operation = ALUOP_BITTESTSET ELSE
  	  not_bittestclr_result WHEN operation = ALUOP_BITTESTCLR ELSE
          test_result;

END structural;




