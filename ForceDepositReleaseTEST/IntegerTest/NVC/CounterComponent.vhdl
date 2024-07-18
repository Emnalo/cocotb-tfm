library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CounterComponent is
    Port ( 
        clk         : in  std_logic;  -- Señal de reloj
        rst         : in  std_logic;  -- Señal de reset
        int_counter : out integer;    -- Salida del contador de tipo integer
        unsigned_counter : out unsigned(3 downto 0) -- Salida del contador de tipo unsigned (4 bits para contar hasta 10)
    );
end CounterComponent;

architecture Behavioral of CounterComponent is

    signal int_counter_reg : integer := 0; -- Registro del contador de tipo integer
    signal unsigned_counter_reg : unsigned(3 downto 0) := (others => '0'); -- Registro del contador de tipo unsigned

begin

    process(clk, rst)
    begin
        if rst = '1' then
            -- Reiniciar los contadores a 0
            int_counter_reg <= 0;
            unsigned_counter_reg <= (others => '0');
        elsif rising_edge(clk) then
            -- Incrementar el contador integer
            if int_counter_reg < 10 then
                int_counter_reg <= int_counter_reg + 1;
            else
                int_counter_reg <= 0; -- Reiniciar el contador después de llegar a 10
            end if;
            
            -- Incrementar el contador unsigned
            if unsigned_counter_reg < 10 then
                unsigned_counter_reg <= unsigned_counter_reg + 1;
            else
                unsigned_counter_reg <= (others => '0'); -- Reiniciar el contador después de llegar a 10
            end if;
        end if;
    end process;

    -- Asignar los valores de los registros a las salidas
    int_counter <= int_counter_reg;
    unsigned_counter <= unsigned_counter_reg;

end Behavioral;

