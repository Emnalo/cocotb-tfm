library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BooleanComponent is
    Port ( 
        clk     : in  std_logic;  -- Señal de reloj
        rst     : in  std_logic;  -- Señal de reset
        bool_signal : out boolean -- Señal de tipo boolean
    );
end BooleanComponent;

architecture Behavioral of BooleanComponent is
    signal bool_reg : boolean := false; -- Registro interno de tipo boolean
begin
    process(clk, rst)
    begin
        if rst = '1' then
            bool_reg <= false; -- Reiniciar el registro a false
        elsif rising_edge(clk) then
            bool_reg <= not bool_reg; -- Alternar el valor del registro
        end if;
    end process;

    -- Asignar el valor del registro a la salida
    bool_signal <= bool_reg;
end Behavioral;

