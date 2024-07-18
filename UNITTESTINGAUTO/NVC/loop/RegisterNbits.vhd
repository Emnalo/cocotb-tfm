----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.09.2023 09:07:59
-- Design Name: 
-- Module Name: RegisterNbits - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterNbits is
    Generic (SIZE : POSITIVE);                            -- number of bits
    Port ( rst_i : in STD_LOGIC;                          -- reset
           clk_i : in STD_LOGIC;                          -- clock
           en_i : in STD_LOGIC;                           -- enable
           d_i : in STD_LOGIC_VECTOR (SIZE-1 downto 0);   -- data
           q_o : out STD_LOGIC_VECTOR (SIZE-1 downto 0)); -- output
end RegisterNbits;

architecture Behavioral of RegisterNbits is

    signal aux : std_logic_vector(SIZE-1 downto 0) := (others => '0');  -- internal storage

begin

    process(rst_i, clk_i)
    begin
        if rst_i = '1' then                 -- asynchronous reset
            aux <= (others => '0');
        elsif rising_edge(clk_i) then       -- synchronous inputs
            if en_i = '1' then
                aux <= d_i;                 -- store data when enabled
            end if;
        end if;
    end process;

    q_o <= aux;
    
end Behavioral;
