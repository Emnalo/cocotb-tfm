----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.09.2023 09:06:23
-- Design Name: 
-- Module Name: RegisteredALU - Behavioral
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

entity RegisteredALU is     -- This component defines a registered ALU
    Port ( rst_i : in STD_LOGIC;                            -- reset
           clk_i : STD_LOGIC;                               -- clock
           en_i : STD_LOGIC;                                -- enable
           a_i : in STD_LOGIC_VECTOR (7 downto 0);          -- first operand
           b_i : in STD_LOGIC_VECTOR (7 downto 0);          -- second operand
           operation_i : in STD_LOGIC_VECTOR (2 downto 0);  -- operation
           zero_o : out STD_LOGIC;                          -- zero flag
           result_o : out STD_LOGIC_VECTOR (7 downto 0));   -- result
end RegisteredALU;

architecture Behavioral of RegisteredALU is

    -- The RegisteredALU may use some ArithmeticLogicUnits
    component ArithmeticLogicUnit is
        Port ( a_i : in STD_LOGIC_VECTOR (7 downto 0);          -- first operand
               b_i : in STD_LOGIC_VECTOR (7 downto 0);          -- second operand
               operation_i : in STD_LOGIC_VECTOR (2 downto 0);  -- operation
               zero_o : out STD_LOGIC;                          -- zero flag
               result_o : out STD_LOGIC_VECTOR (7 downto 0));   -- result
    end component;

    -- The RegisteredALU may use some RegisterNBits
    component RegisterNbits is
        Generic (SIZE : POSITIVE);                            -- number of bits
        Port ( rst_i : in STD_LOGIC;                          -- reset
               clk_i : in STD_LOGIC;                          -- clock
               en_i : in STD_LOGIC;                           -- enable
               d_i : in STD_LOGIC_VECTOR (SIZE-1 downto 0);   -- data
               q_o : out STD_LOGIC_VECTOR (SIZE-1 downto 0)); -- output
    end component;

    -- Set of signals required to interconnect the components
    signal result : std_logic_vector(7 downto 0);
    signal zero : std_logic;
    
begin

    -- Instance of ArithmeticLogicUnit
    alu : ArithmeticLogicUnit
    port map (
        a_i         => a_i,
        b_i         => b_i,
        operation_i => operation_i,
        zero_o      => zero,
        result_o    => result
    );
    
    -- Instance of an 8-bits register that holds the result
    result_register : RegisterNbits
    generic map (SIZE => 8)
    port map (
        rst_i   => rst_i,
        clk_i   => clk_i,
        en_i    => en_i,
        d_i     => result,
        q_o     => result_o
    );
    
    -- Instance of a 1-bit register that holds the zero flag
    zero_register : RegisterNbits
    generic map (SIZE => 1)
    port map (
        rst_i   => rst_i,
        clk_i   => clk_i,
        en_i    => en_i,
        d_i(0)  => zero,
        q_o(0)  => zero_o
    );


end Behavioral;
