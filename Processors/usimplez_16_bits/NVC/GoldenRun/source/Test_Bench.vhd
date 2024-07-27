-- test bench for chipkill 

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_std.all;

entity Bench is
end Bench;

architecture Test_Bench of Bench is

  component usimplez_top
	port
	(	clk_i :  in  std_logic;
		rst_i :  in  std_logic;
		we_o :  out  std_logic;
		in0_o :  out  std_logic;
		in1_o :  out  std_logic;
		op0_o :  out  std_logic;
		op1_o :  out  std_logic
	);
  end component;

  signal clock, reset : std_logic;
  signal we_o, in0_o, in1_o, op0_o, op1_o : std_logic;


begin

  top: usimplez_top
  port map (
    clk_i => clock, 
	rst_i => reset, 
	we_o => we_o,
	in0_o => in0_o,
	in1_o => in1_o,
	op0_o => op0_o,
	op1_o => op1_o
	);

  reset <= '1' after 0 ns, '0' after 15 ns;

  ClockGen: process 
  begin
      clock <= '0';
      wait for 5 ns;
      clock <= '1';
      wait for 5 ns;
  end process ClockGen;

end Test_Bench;

