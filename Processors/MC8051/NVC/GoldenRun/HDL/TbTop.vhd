library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TbTop is
end entity TbTop;

architecture Behavioral of TbTop is

    signal clk : std_logic := '0';
    signal reset : std_logic := '1';
    signal Din_p0, Din_p3 : std_logic_vector(7 downto 0);
    signal Intvec : std_logic_vector(5 downto 0) := (others => '0');
    signal FinishFlag : std_logic := '0';
    type RES_array is array (0 to 19) of std_logic_vector(15 downto 0);
    signal RES : RES_array := (others => (others => '0'));

    signal p1_o, p2_o : std_logic_vector(7 downto 0);

    constant cycle : time := 50.000 ns;

begin

    process
    begin
        clk <= '0';
        wait for cycle / 2;
        clk <= '1';
        wait for cycle / 2;
    end process;

    process
    begin
        reset <= '1';
        FinishFlag <= '0';
        Intvec <= (others => '0');
        wait for 5.2 * cycle;
        reset <= '0';
    end process;

    process
        variable cnt : integer := 0;
    begin
        Din_p0 <= std_logic_vector(to_unsigned(9, 8));
        Din_p3 <= (others => '0');
        
        wait for cycle * 35000;

        for cnt in 0 to 20 loop
            Din_p3 <= std_logic_vector(to_unsigned(cnt, 8));
            wait for cycle * 200;
            RES(cnt)(7 downto 0) <= p1_o;
            RES(cnt)(15 downto 8) <= p2_o;
        end loop;

        wait for cycle * 200;
        FinishFlag <= '1';
    end process;

    uut: entity work.mc8051_top
        port map (
            clk => clk,
            reset => reset,
            int0_i => '0',
            int1_i => '0',
            all_t0_i => '0',
            all_t1_i => '0',
            all_rxd_i => '0',
            all_rxd_o => open,
            all_rxdwr_o => open,
            all_txd_o => open,
            p0_i => Din_p0,
            p0_o => open,
            p1_i => (others => '0'),
            p1_o => p1_o,
            p2_i => (others => '0'),
            p2_o => p2_o,
            p3_i => Din_p3,
            p3_o => open
        );

end architecture Behavioral;

