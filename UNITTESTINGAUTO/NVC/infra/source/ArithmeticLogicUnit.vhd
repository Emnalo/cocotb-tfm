----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2023 18:17:17
-- Design Name: 
-- Module Name: ArithmeticLogicUnit - Behavioral
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

entity ArithmeticLogicUnit is
    Port ( a_i : in STD_LOGIC_VECTOR (7 downto 0);          -- first operand
           b_i : in STD_LOGIC_VECTOR (7 downto 0);          -- second operand
           operation_i : in STD_LOGIC_VECTOR (2 downto 0);  -- operation
           zero_o : out STD_LOGIC;                          -- zero flag
           result_o : out STD_LOGIC_VECTOR (7 downto 0));   -- result
end ArithmeticLogicUnit;

architecture Behavioral of ArithmeticLogicUnit is

    constant ZERO : std_logic_vector(7 downto 0) := (others => '0');    -- zero
    signal add_result, sub_result, and_result, or_result,               -- result of operations
           slt_result, aux_result : std_logic_vector(7 downto 0);
           
begin

    add_result <= std_logic_vector(unsigned(a_i) + unsigned(b_i));               -- add result
    sub_result <= std_logic_vector(unsigned(a_i) - unsigned(b_i));               -- sub result
    and_result <= a_i and b_i;                                                   -- and result
    or_result <= a_i or b_i;                                                     -- or result
    
    slt_result <= (0 => '1', others => '0') when a_i < b_i else (others => '0'); -- slt result
    
    with operation_i select                        -- result depends on operation_i
    aux_result <= add_result      when "010",
                  sub_result      when "110",
                  and_result      when "000",
                  or_result       when "001",
                  slt_result      when "111",
                  (others => '0') when others;
                  
    zero_o <= '1' when aux_result = ZERO else '0'; -- flag active when result = x"00"
    
    result_o <= aux_result;                        -- output

end Behavioral;
