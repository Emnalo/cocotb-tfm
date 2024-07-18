----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.09.2023 09:28:25
-- Design Name: 
-- Module Name: RegisteredALU_tb - Behavioral
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

library STD;
use STD.TEXTIO.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisteredALU_tb is
--  Port ( );
end RegisteredALU_tb;

architecture Behavioral of RegisteredALU_tb is

    -- component declaration for the Unit Under Test (UUT)
    component RegisteredALU is     
        Port ( rst_i : in STD_LOGIC;                            -- reset
               clk_i : STD_LOGIC;                               -- clock
               en_i : STD_LOGIC;                                -- enable
               a_i : in STD_LOGIC_VECTOR (7 downto 0);          -- first operand
               b_i : in STD_LOGIC_VECTOR (7 downto 0);          -- second operand
               operation_i : in STD_LOGIC_VECTOR (2 downto 0);  -- operation
               zero_o : out STD_LOGIC;                          -- zero flag
               result_o : out STD_LOGIC_VECTOR (7 downto 0));   -- result
    end component;
    
    -- Constants
    constant CLOCK_PERIOD : time := 10 ns;  -- clock frequency = 100 MHz
    -- Inputs
    signal rst, clk : std_logic := '0';
    signal en : std_logic := '1';
    signal a, b : std_logic_vector(7 downto 0) := (others => '0');
    signal operation : std_logic_vector(2 downto 0) := (others => '0');
    -- Ouputs
    signal zero : std_logic;
    signal result : std_logic_vector(7 downto 0);

begin

    -- Instance of the Unit Under Test (UUT)
    uut : RegisteredALU
    port map (
        rst_i           => rst,
        clk_i           => clk,
        en_i            => en,
        a_i             => a,
        b_i             => b,
        operation_i     => operation,
        zero_o          => zero,
        result_o        => result
    );
    
    -- Stimuli
    clk <= not clk after CLOCK_PERIOD/2;
    
    stimuli_process : process
        variable experiments : natural := 0;
        variable failures : natural := 0;
        variable results : line;
    begin

        a <= "00000000"; -- 0
        b <= "00000000"; -- 0

        -- 0 + 0 = 0
        operation <= "010";
        wait for CLOCK_PERIOD;	
        if result /= "00000000" or zero /= '1' then
         failures := failures + 1;
        end if;
        experiments := experiments + 1;
        
        -- 0 - 0 = 0
        operation <= "110";
        wait for CLOCK_PERIOD;	
        if result /= "00000000" or zero /= '1' then
         failures := failures + 1;
        end if;
        experiments := experiments + 1;
        
        -- 0 AND 0 = 0
        operation <= "000";
        wait for CLOCK_PERIOD;	
        if result /= "00000000" or zero /= '1' then
         failures := failures + 1;
        end if;
        experiments := experiments + 1;
        
        -- 0 OR 0 = 0
        operation <= "001";
        wait for CLOCK_PERIOD;	
        if result /= "00000000" or zero /= '1' then
         failures := failures + 1;
        end if;
        experiments := experiments + 1;
        
        -- 0 < 0 = '0'
        operation <= "111";
        wait for CLOCK_PERIOD;	
        if result /= "00000000" or zero /= '1' then
         failures := failures + 1;
        end if;
        experiments := experiments + 1;
        
        a <= "00111010"; -- 58
        b <= "00011001"; -- 25
        
        -- 58 + 25 = 83 ("01010011")
        operation <= "010";
        wait for CLOCK_PERIOD;	
        if result /= "01010011" or zero /= '0' then
         failures := failures + 1;
        end if;
        experiments := experiments + 1;
        
        -- 58 - 25 = 33 ("00100001")
        operation <= "110";
        wait for CLOCK_PERIOD;	
        if result /= "00100001" or zero /= '0' then
         failures := failures + 1;
        end if;
        experiments := experiments + 1;
        
        -- "00111010" AND "00011001" = "00011000"
        operation <= "000";
        wait for CLOCK_PERIOD;	
        if result /= "00011000" or zero /= '0' then
         failures := failures + 1;
        end if;
        experiments := experiments + 1;
         
        -- "00111010" OR "00011001" = "00111011"
        operation <= "001";
        wait for CLOCK_PERIOD;	
        if result /= "00111011" or zero /= '0' then
         failures := failures + 1;
        end if;
        experiments := experiments + 1;
        
        -- 58 < 25 = '0'
        operation <= "111";
        wait for CLOCK_PERIOD;	
        if result /= "00000000" or zero /= '1' then
         failures := failures + 1;
        end if;
        experiments := experiments + 1;
         
        a <= "00001110"; -- 14
        b <= "00011001"; -- 25
        
        -- 14 + 25 = 39 ("00100111")
        operation <= "010";
        wait for CLOCK_PERIOD;	
        if result /= "00100111" or zero /= '0' then
         failures := failures + 1;
        end if;
        experiments := experiments + 1;
         
        -- 14 - 25 = -11 ("11110101")
        operation <= "110";
        wait for CLOCK_PERIOD;	
        if result /= "11110101" or zero /= '0' then
         failures := failures + 1;
        end if;
        experiments := experiments + 1;
         
        -- "00001110" AND "00011001" = "00001000"
        operation <= "000";
        wait for CLOCK_PERIOD;	
        if result /= "00001000" or zero /= '0' then
         failures := failures + 1;
        end if;
        experiments := experiments + 1;
         
        -- "00001110" OR "00011001" = "00011111"
        operation <= "001";
        wait for CLOCK_PERIOD;	
        if result /= "00011111" or zero /= '0' then
         failures := failures + 1;
        end if;
        experiments := experiments + 1;
         
        -- 14 < 25 = '1'
        operation <= "111";
        wait for CLOCK_PERIOD;	
        if result /= "00000001" or zero /= '0' then
         failures := failures + 1;
        end if;
        experiments := experiments + 1;
        
        -- print the count of faults injected and failures observed
        write(results, string'("Experiments: "));
        write(results, experiments);
        write(results, string'(", Failures: "));
        write(results, failures);
        writeline(output, results);
        
        wait;   -- stop the simulation
    end process;

end Behavioral;
