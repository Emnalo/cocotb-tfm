library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Inversor is
    Generic (
        N : integer := 4  -- Tamaño del vector
    );
    Port (
        entrada     : in  std_logic_vector(N-1 downto 0); -- Entrada
        salida : out std_logic_vector(N-1 downto 0)  -- Salida
    );
end Inversor;

architecture Behavioral of Inversor is
begin
	salida <= not entrada;
end Behavioral;

