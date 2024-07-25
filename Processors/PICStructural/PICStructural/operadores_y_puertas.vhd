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

-- "puertas_logicas.vhd"
--
-- Copyright (C) 2001  Francisco González
--     
-- Implementación de las puertas lógicas básicas.


-------------------------------------------
-- puerta NOT
-------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY p_NOT IS
  PORT ( a         : IN  STD_LOGIC;
         s         : OUT STD_LOGIC
       );
END p_NOT;

ARCHITECTURE structural OF p_NOT IS
BEGIN
    s <= NOT a;
END structural;


-------------------------------------------
-- puerta OR
-------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY p_OR IS
  PORT ( a         : IN  STD_LOGIC;
         b         : IN  STD_LOGIC;
         s         : OUT STD_LOGIC
       );
END p_OR;

ARCHITECTURE structural OF p_OR IS
BEGIN
    s <= a OR b;
END structural;


-------------------------------------------
-- puerta XOR
-------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY p_XOR IS
  PORT ( a         : IN  STD_LOGIC;
         b         : IN  STD_LOGIC;
         s         : OUT STD_LOGIC
       );
END p_XOR;

ARCHITECTURE structural OF p_XOR IS
BEGIN
    s <= a XOR b;
END structural;

-------------------------------------------
-- puerta AND
-------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY p_AND IS
  PORT ( a         : IN  STD_LOGIC;
         b         : IN  STD_LOGIC;
         s         : OUT STD_LOGIC
       );
END p_AND;

ARCHITECTURE structural OF p_AND IS
BEGIN
    s <= a AND b;
END structural;


-------------------------------------------
-- puerta AND3
-------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY p_AND3 IS
  PORT ( a         : IN  STD_LOGIC; 
	 b	   : IN  STD_LOGIC;
	 c	   : IN  STD_LOGIC;
         s         : OUT STD_LOGIC
       );
END p_AND3;


ARCHITECTURE structural OF p_AND3 IS

  COMPONENT p_AND
    PORT ( a         : IN  STD_LOGIC;
           b         : IN  STD_LOGIC;
           s         : OUT STD_LOGIC
         );
  END COMPONENT;

SIGNAL aux: STD_LOGIC;

BEGIN
    p1: p_AND PORT MAP (a, b, aux);
    p2: p_AND PORT MAP (c, aux, s);
END structural;


-------------------------------------------
-- puerta NAND
-------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY p_NAND IS
  PORT ( a         : IN  STD_LOGIC;
         b         : IN  STD_LOGIC;
         s         : OUT STD_LOGIC
       );
END p_NAND;

ARCHITECTURE structural OF p_NAND IS
BEGIN
    s <= a NAND b;
END structural;


-------------------------------------------
-- puerta NAND3
-------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY p_NAND3 IS
  PORT ( a         : IN  STD_LOGIC; 
	 b	   : IN  STD_LOGIC;
	 c	   : IN  STD_LOGIC;
         s         : OUT STD_LOGIC
       );
END p_NAND3;


ARCHITECTURE structural OF p_NAND3 IS

  COMPONENT p_AND3
    PORT ( a         : IN  STD_LOGIC;
           b         : IN  STD_LOGIC;
           c	     : IN  STD_LOGIC;
           s         : OUT STD_LOGIC
         );
  END COMPONENT;
  
  COMPONENT p_NOT
  PORT ( a         : IN  STD_LOGIC;
         s         : OUT STD_LOGIC
       );
  END COMPONENT;

SIGNAL aux: STD_LOGIC;

BEGIN
    p1: p_AND3 PORT MAP (a, b, c, aux);
    p2: p_NOT PORT MAP (aux, s);
END structural;


-------------------------------------------
-- Decodificador de 3 bits
-------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY deco IS
  PORT ( c         : IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
         s         : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
       );
END deco;

ARCHITECTURE structural OF deco IS
 
  COMPONENT p_NOT
     PORT ( a         : IN  STD_LOGIC;
            s         : OUT STD_LOGIC
          );
  END COMPONENT;
  COMPONENT p_AND3
     PORT ( a         : IN  STD_LOGIC;
     	    b         : IN  STD_LOGIC;
     	    c         : IN  STD_LOGIC;
            s         : OUT STD_LOGIC
          );
  END COMPONENT;

SIGNAL not_c: STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN

    senyales_negadas: FOR I IN 2 DOWNTO 0 GENERATE
    	c_negada: p_NOT PORT MAP( a => c(i),
                               s => not_c(i)
                              );
    END GENERATE senyales_negadas;
    
    s0: p_AND3 PORT MAP(
                  c => not_c(2),
                  b => not_c(1),
                  a => not_c(0),
                  s => s(0)
        );
    s1: p_AND3 PORT MAP(
                  c => not_c(2),
                  b => not_c(1),
                  a => c(0),
                  s => s(1)
        );
    s2: p_AND3 PORT MAP(
                  c => not_c(2),
                  b => c(1),
                  a => not_c(0),
                  s => s(2)
        );    
    s3: p_AND3 PORT MAP(
                  c => not_c(2),
                  b => c(1),
                  a => c(0),
                  s => s(3)
        );             
    s4: p_AND3 PORT MAP(
                  c => c(2),
                  b => not_c(1),
                  a => not_c(0),
                  s => s(4)
        );             
    s5: p_AND3 PORT MAP(
                  c => c(2),
                  b => not_c(1),
                  a => c(0),
                  s => s(5)
        );             
    s6: p_AND3 PORT MAP(
                  c => c(2),
                  b => c(1),
                  a => not_c(0),
                  s => s(6)
        );             
    s7: p_AND3 PORT MAP(
                  c => c(2),
                  b => c(1),
                  a => c(0),
                  s => s(7)
        );
 
END structural;


-------------------------------------------
-- Comparador a 0 de 8 bits
-------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY comparador_a_0 IS
  PORT ( e         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
         s         : OUT STD_LOGIC
       );
END comparador_a_0;

ARCHITECTURE structural OF comparador_a_0 IS

  COMPONENT p_NOT
    PORT ( a         : IN  STD_LOGIC;
           s         : OUT STD_LOGIC
         );
  END COMPONENT;
  COMPONENT p_OR
    PORT ( a         : IN  STD_LOGIC;
           b         : IN  STD_LOGIC;
           s         : OUT STD_LOGIC
         );
  END COMPONENT;

SIGNAL not_i, i0, i1, i2, i3, i4, i5, i6: STD_LOGIC;

BEGIN
    
    s0: p_OR PORT MAP(
                  a => e(1),
                  b => e(0),
                  s => i0
        );
    s1: p_OR PORT MAP(
                  a => e(3),
                  b => e(2),
                  s => i1
        );
    s2: p_OR PORT MAP(
                  a => e(5),
                  b => e(4),
                  s => i2
        );    
    s3: p_OR PORT MAP(
                  a => e(7),
                  b => e(6),
                  s => i3
        );             
    s4: p_OR PORT MAP(
                  a => i0,
                  b => i1,
                  s => i4
        );             
    s5: p_OR PORT MAP(
                  a => i2,
                  b => i3,
                  s => i5
        );             
    s6: p_OR PORT MAP(
                  a => i4,
                  b => i5,
                  s => i6
        );             
    c_negada: p_NOT PORT MAP( a => i6,
                              s => s
                            );
 
END structural;












-------------------------------------------
-- operador NOT de 8 bits
-------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY o_NOT8 IS
  PORT ( a         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
         s         : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
       );
END o_NOT8;

ARCHITECTURE structural OF o_NOT8 IS

  COMPONENT p_NOT
    PORT ( a         : IN  STD_LOGIC;
           s         : OUT STD_LOGIC
         );
  END COMPONENT;

BEGIN

  operador_NOT8 : for i in 7 downto 0 GENERATE
      puerta_not: p_NOT port map (
             a => a(i),
             s => s(i)
            );
  END GENERATE operador_NOT8;
    
END structural;

-------------------------------------------
-- operador OR de 8 bits
-------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY o_OR8 IS
  PORT ( a         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
         b         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
         s         : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
       );
END o_OR8;

ARCHITECTURE structural OF o_OR8 IS

  COMPONENT p_OR
    PORT ( a         : IN  STD_LOGIC;
           b         : IN  STD_LOGIC;
           s         : OUT STD_LOGIC
         );
  END COMPONENT;

BEGIN

  operador_OR8 : for i in 7 downto 0 GENERATE
      puerta_OR: p_OR port map (
             a => a(i),
             b => b(i),
             s => s(i)
            );
  END GENERATE operador_OR8;
    
END structural;

-------------------------------------------
-- operador XOR de 8 bits
-------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY o_XOR8 IS
  PORT ( a         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
         b         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
         s         : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
       );
END o_XOR8;

ARCHITECTURE structural OF o_XOR8 IS

  COMPONENT p_XOR
    PORT ( a         : IN  STD_LOGIC;
           b         : IN  STD_LOGIC;
           s         : OUT STD_LOGIC
         );
  END COMPONENT;

BEGIN

  operador_XOR8 : for i in 7 downto 0 GENERATE
     puerta_XOR: p_XOR port map (
             a => a(i),
             b => b(i),
             s => s(i)
            );
  END GENERATE operador_XOR8;
    
END structural;


-------------------------------------------
-- operador AND de 8 bits
-------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY o_AND8 IS
  PORT ( a         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
         b         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
         s         : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
       );
END o_AND8;

ARCHITECTURE structural OF o_AND8 IS

  COMPONENT p_AND
    PORT ( a         : IN  STD_LOGIC;
           b         : IN  STD_LOGIC;
           s         : OUT STD_LOGIC
         );
  END COMPONENT;

BEGIN

  operador_AND8 : for i in 7 downto 0 GENERATE
     puerta_AND: p_AND port map (
             a => a(i),
             b => b(i),
             s => s(i)
            );
  END GENERATE operador_AND8;
    
END structural;


-------------------------------------------
-- operador BITSET
-------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY o_BITSET IS
  PORT ( a         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
         c         : IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
         s         : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
       );
END o_BITSET;

ARCHITECTURE structural OF o_BITSET IS

  COMPONENT deco
     PORT ( c         : IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
            s         : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
          );
  END COMPONENT;
  
  COMPONENT o_OR8
     PORT ( a         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
            b         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
            s         : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
          );
  END COMPONENT;

SIGNAL sal_deco : STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN

  operador_OR8 : o_OR8 PORT MAP ( a => a,
  				  b => sal_deco,
  				  s => s
  				);
  				
  decodificador : deco PORT MAP ( c => c,
  				  s => sal_deco
  				);  				
    
END structural;

-------------------------------------------
-- operador BITCLR
-------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY o_BITCLR IS
  PORT ( a         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
         c         : IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
         s         : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
       );
END o_BITCLR;

ARCHITECTURE structural OF o_BITCLR IS

  COMPONENT deco
     PORT ( c         : IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
            s         : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
          );
  END COMPONENT;
  
  COMPONENT o_AND8
     PORT ( a         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
            b         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
            s         : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
          );
  END COMPONENT;
  
  COMPONENT o_NOT8
     PORT ( a         : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
            s         : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
          );
  END COMPONENT;

SIGNAL sal_deco, sal_deco_negada : STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN

  operador_NOT8 : o_NOT8 PORT MAP ( a => sal_deco,
  				    s => sal_deco_negada
  				  );
  				
  operador_AND8 : o_AND8 PORT MAP ( a => sal_deco_negada,
				    b => a,
				    s => s
				  );
  				
  decodificador : deco PORT MAP ( c => c,
  				  s => sal_deco
  				);  				
    
END structural;




