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




