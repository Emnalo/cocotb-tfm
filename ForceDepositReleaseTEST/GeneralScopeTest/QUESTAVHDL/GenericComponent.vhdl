library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity GenericComponent is
    Generic (
        N : integer := 4   -- Constante genérica
    );
    Port ( 
        clk     : in  std_logic;     -- Puerto de entrada
        rst     : in  std_logic;     -- Puerto de entrada
        din     : in  std_logic_vector(N-1 downto 0); -- Puerto de entrada
        dout    : out std_logic_vector(N-1 downto 0); -- Puerto de salida
        inversa : out std_logic_vector(N-1 downto 0)  -- Nueva salida
    );
end GenericComponent;

architecture Behavioral of GenericComponent is

    -- Declaración del componente Inversor
    component Inversor is
        Generic (
            N : integer := 4  -- Tamaño del vector
        );
        Port (
            entrada     : in  std_logic_vector(N-1 downto 0);
            salida : out std_logic_vector(N-1 downto 0)
        );
    end component;

    type state_type is (IDLE, WORKING, DONE);
    type array_type is array (N-1 downto 0) of std_logic;

    signal counter  : integer := 0;  -- Tipo integer
    signal state    : state_type;    -- Tipo ENUM
    signal enable   : boolean := false;  -- Tipo Boolean
    signal array_signal : array_type := (others => '0');
    constant array_constant: std_logic_vector(N-1 downto 0) := (others => '1');
    signal temporal : std_logic_vector(N-1 downto 0);
    signal temp_inversa : std_logic_vector(N-1 downto 0); -- Señal interna para la inversa

begin
    U_Inversor: Inversor
        generic map (
            N => N
        )
        port map (
            entrada => din,
            salida => temp_inversa
        );

    process(clk, rst)
        variable temp_var : std_logic_vector(N-1 downto 0); -- Variable en proceso
    begin
        if rst = '1' then
            dout <= (others => '0');
            counter <= 0;
            state <= IDLE;
            enable <= false;
            array_signal <= (others => '0');
            inversa <= (others => '0'); 
        elsif rising_edge(clk) then
            case state is
                when IDLE =>
                    if enable then
                        state <= WORKING;
                    end if;
                when WORKING =>
                    temporal <= din;
                    array_signal <= array_type(temporal); -- Convertir en array_type
                    dout <= temporal;
                    inversa <= temp_inversa;
                    counter <= counter + 1;
                    if counter = 9 then
                        state <= DONE;
                    end if;
                when DONE =>
                    dout <= array_constant;
                    array_signal <= array_type(array_constant);
                    inversa <= temp_inversa;
            end case;
        end if;
    end process;

end Behavioral;

