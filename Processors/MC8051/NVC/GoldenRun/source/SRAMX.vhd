library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;

entity SRAMX is

  port (clk        : in  std_logic;  			 -- clock signal
        reset      : in  std_logic;  			 -- reset signal
        ram_data_i : in  std_logic_vector(7 downto 0);   -- data input
        ram_data_o : out std_logic_vector(7 downto 0);   -- data output
        ram_adr_i  : in  std_logic_vector(15 downto 0);  -- adresses
        ram_wr_i   : in  std_logic);  			 -- read=0, write=1 

        attribute bram_map: string;                     ---statement of the blockram
        attribute bram_map of SRAMX: entity is "yes";
		  

end SRAMX;



architecture Behavioral of SRAMX is

   type   memory is array (4095 downto 0) of std_logic_vector(7 downto 0);
   signal mem0 : memory  := (others => "00000000");
   signal mem1 : memory  := (others => "00000000");
   signal mem2 : memory  := (others => "00000000");
   signal mem3 : memory  := (others => "00000000");
   signal mem4 : memory  := (others => "00000000");
   signal mem5 : memory  := (others => "00000000");
   signal mem6 : memory  := (others => "00000000");
   signal mem7 : memory  := (others => "00000000");
   signal mem8 : memory  := (others => "00000000");
   signal mem9 : memory  := (others => "00000000");
   signal mem10 : memory  := (others => "00000000");
   signal mem11 : memory  := (others => "00000000");
   signal mem12 : memory  := (others => "00000000");
   signal mem13 : memory  := (others => "00000000");
   signal mem14 : memory  := (others => "00000000");
   signal mem15 : memory  := (others => "00000000");
   
   signal r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15: std_logic_vector(7 downto 0);

  attribute ram_style        : string;
  attribute ram_style of mem0 : signal is "block";
  attribute ram_style of mem1 : signal is "block";
  attribute ram_style of mem2 : signal is "block";
  attribute ram_style of mem3 : signal is "block";
  attribute ram_style of mem4 : signal is "block";
  attribute ram_style of mem5 : signal is "block";
  attribute ram_style of mem6 : signal is "block";
  attribute ram_style of mem7 : signal is "block";
  attribute ram_style of mem8 : signal is "block";
  attribute ram_style of mem9 : signal is "block";
  attribute ram_style of mem10 : signal is "block";
  attribute ram_style of mem11 : signal is "block";
  attribute ram_style of mem12 : signal is "block";
  attribute ram_style of mem13 : signal is "block";
  attribute ram_style of mem14 : signal is "block";
  attribute ram_style of mem15 : signal is "block";

alias sel : std_logic_vector(3 downto 0) is ram_adr_i(15 downto 12);
     
begin

		ram_data_o <= 	r0 when    sel = "0000" and reset='0'  else 
							r1 when    sel = "0001" and reset='0'  else
							r2 when    sel = "0010" and reset='0'  else
							r3 when    sel = "0011" and reset='0'  else 
							r4 when    sel = "0100" and reset='0'  else 
							r5 when    sel = "0101" and reset='0'  else 
							r6 when    sel = "0110" and reset='0'  else 
							r7 when    sel = "0111" and reset='0'  else 
							r8 when    sel = "1000" and reset='0'  else 
							r9 when    sel = "1001" and reset='0'  else 
							r10 when   sel = "1010" and reset='0'  else 
							r11 when   sel = "1011" and reset='0'  else 
							r12 when   sel = "1100" and reset='0'  else 
							r13 when   sel = "1101" and reset='0'  else 
							r14 when   sel = "1110" and reset='0'  else 
							r15 when   sel = "1111" and reset='0'  else
							"00000000";





process (clk)
  begin
      if (clk'event and clk='1') then
                   r0 <= mem0(conv_integer(unsigned(ram_adr_i(11 downto 0))));
                   r1 <= mem1(conv_integer(unsigned(ram_adr_i(11 downto 0))));
                   r2 <= mem2(conv_integer(unsigned(ram_adr_i(11 downto 0))));
                   r3 <= mem3(conv_integer(unsigned(ram_adr_i(11 downto 0))));                    
                   r4 <= mem4(conv_integer(unsigned(ram_adr_i(11 downto 0))));
                   r5 <= mem5(conv_integer(unsigned(ram_adr_i(11 downto 0))));
                   r6 <= mem6(conv_integer(unsigned(ram_adr_i(11 downto 0))));
                   r7 <= mem7(conv_integer(unsigned(ram_adr_i(11 downto 0))));                    
                   r8 <= mem8(conv_integer(unsigned(ram_adr_i(11 downto 0))));
                   r9 <= mem9(conv_integer(unsigned(ram_adr_i(11 downto 0))));
                   r10 <= mem10(conv_integer(unsigned(ram_adr_i(11 downto 0))));
                   r11 <= mem11(conv_integer(unsigned(ram_adr_i(11 downto 0))));                    
                   r12 <= mem12(conv_integer(unsigned(ram_adr_i(11 downto 0))));
                   r13 <= mem13(conv_integer(unsigned(ram_adr_i(11 downto 0))));
                   r14 <= mem14(conv_integer(unsigned(ram_adr_i(11 downto 0))));
                   r15 <= mem15(conv_integer(unsigned(ram_adr_i(11 downto 0))));  

				if ram_wr_i='1' then
                    case ram_adr_i(15 downto 12) is
                        when "0000" => mem0(conv_integer(unsigned(ram_adr_i(11 downto 0))))    <= ram_data_i;
                        when "0001" => mem1(conv_integer(unsigned(ram_adr_i(11 downto 0))))    <= ram_data_i;
                        when "0010" => mem2(conv_integer(unsigned(ram_adr_i(11 downto 0))))    <= ram_data_i;
                        when "0011" => mem3(conv_integer(unsigned(ram_adr_i(11 downto 0))))    <= ram_data_i;              
                        when "0100" => mem4(conv_integer(unsigned(ram_adr_i(11 downto 0))))    <= ram_data_i;
                        when "0101" => mem5(conv_integer(unsigned(ram_adr_i(11 downto 0))))    <= ram_data_i;
                        when "0110" => mem6(conv_integer(unsigned(ram_adr_i(11 downto 0))))    <= ram_data_i;
                        when "0111" => mem7(conv_integer(unsigned(ram_adr_i(11 downto 0))))    <= ram_data_i;              
                        when "1000" => mem8(conv_integer(unsigned(ram_adr_i(11 downto 0))))    <= ram_data_i;
                        when "1001" => mem9(conv_integer(unsigned(ram_adr_i(11 downto 0))))    <= ram_data_i;
                        when "1010" => mem10(conv_integer(unsigned(ram_adr_i(11 downto 0))))   <= ram_data_i;
                        when "1011" => mem11(conv_integer(unsigned(ram_adr_i(11 downto 0))))   <= ram_data_i;                
                        when "1100" => mem12(conv_integer(unsigned(ram_adr_i(11 downto 0))))   <= ram_data_i;
                        when "1101" => mem13(conv_integer(unsigned(ram_adr_i(11 downto 0))))   <= ram_data_i;
                        when "1110" => mem14(conv_integer(unsigned(ram_adr_i(11 downto 0))))   <= ram_data_i;
								when others		=> mem15(conv_integer(unsigned(ram_adr_i(11 downto 0))))   <= ram_data_i;						
                    end case;                                              
				end if;
      end if;
  end process; 
  
end Behavioral;