----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.07.2024 11:15:47
-- Design Name: 
-- Module Name: mc8051_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mc8051_tb is
--  Port ( );
end mc8051_tb;

architecture Behavioral of mc8051_tb is

    component mc8051_top is
        generic(
        C_IMPL_N_EXT : integer := 1;
        C_IMPL_N_TMR : integer := 1;
        C_IMPL_N_SIU : integer := 1
        );
        
      port (clk       : in std_logic;   -- system clock
            reset     : in std_logic;   -- system reset
            int0_i    : in std_logic_vector(C_IMPL_N_EXT-1 downto 0);  -- ext.Int
            int1_i    : in std_logic_vector(C_IMPL_N_EXT-1 downto 0);  -- ext.Int
            -- counter input 0 for T/C
            all_t0_i  : in std_logic_vector(C_IMPL_N_TMR-1 downto 0);
            -- counter input 1 for T/C
            all_t1_i  : in std_logic_vector(C_IMPL_N_TMR-1 downto 0);
            -- serial input for SIU
            all_rxd_i : in std_logic_vector(C_IMPL_N_SIU-1 downto 0);
            p0_i      : in std_logic_vector(7 downto 0);  -- IO-port0 input
            p1_i      : in std_logic_vector(7 downto 0);  -- IO-port1 input
            p2_i      : in std_logic_vector(7 downto 0);  -- IO-port2 input
            p3_i      : in std_logic_vector(7 downto 0);  -- IO-port3 input 
    
            p0_o        : out std_logic_vector(7 downto 0);  -- IO-port0 output
            p1_o        : out std_logic_vector(7 downto 0);  -- IO-port1 output
            p2_o        : out std_logic_vector(7 downto 0);  -- IO-port2 output
            p3_o        : out std_logic_vector(7 downto 0);  -- IO-port3 output
            -- Mode 0 serial output for SIU
            all_rxd_o   : out std_logic_vector(C_IMPL_N_SIU-1 downto 0);
            -- serial output for SIU 
            all_txd_o   : out std_logic_vector(C_IMPL_N_SIU-1 downto 0);
            -- rxd direction signal
            all_rxdwr_o : out std_logic_vector(C_IMPL_N_SIU-1 downto 0));  
    
    end component;
    
  signal clk : STD_LOGIC := '0';
  signal reset : STD_LOGIC := '1';
  signal Din_p0, Din_p3 : STD_LOGIC_VECTOR(7 downto 0);
  signal Intvec : STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
  signal FinishFlag : STD_LOGIC := '0';
  type array_res is array (0 to 19) of STD_LOGIC_VECTOR(15 downto 0); 
  signal RES : array_res;
  
  signal p1_o, p2_o : STD_LOGIC_VECTOR(7 downto 0);
  
  constant cycle : time := 50 ns;    
    
begin

    top : mc8051_top 
    port map (
        clk => clk,
        reset => reset,
        int0_i(0)    => '0',
        int1_i(0)    => '0',
        all_t0_i(0)  => '0',
        all_t1_i(0)  => '0',
        all_rxd_i(0) => '0',
        p0_i      => Din_p0,
        p1_i      => x"00",
        p2_i      => x"00",
        p3_i      => Din_p3,
        p0_o        => open,
        p1_o        => p1_o,
        p2_o        => p2_o,
        p3_o        => open,
        all_rxd_o   => open,
        all_txd_o   => open,
        all_rxdwr_o => open
    );  
    
    clk <= not clk after cycle / 2;
    reset <= '1', '0' after 5.2*cycle;

    process
        variable cnt : integer := 0;
    begin
        Din_p0 <= x"09";
        Din_p3 <= x"03";
        wait for cycle*35000;
        for cnt in 0 to 19 loop
            Din_p3 <= std_logic_vector(to_unsigned(cnt, 8));
            wait for cycle*200;
            RES(cnt)(7 downto 0) <= p1_o;
            RES(cnt)(15 downto 8) <= p2_o;
        end loop;
        wait for cycle*200;
        FinishFlag <= '1';
        wait;
    end process;
        
end Behavioral;
