library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;



entity RAM is

  port (clk        : in  std_logic;  			-- clock signal
        reset      : in  std_logic;  			-- reset signal
        ram_data_i : in  std_logic_vector(7 downto 0);  -- data input
        ram_data_o : out std_logic_vector(7 downto 0);  -- data output
        ram_adr_i  : in  std_logic_vector(6 downto 0);  -- adresses
        ram_wr_i   : in  std_logic;  			-- read=0, write=1 
        ram_en_i   : in  std_logic);  			-- inactive=0;active=1 
        attribute bram_map: string;                     ---statement of the blockram
        attribute bram_map of RAM: entity is "yes";    
end RAM;

architecture behav of RAM is

   type   ram_type is array (127 downto 0) of unsigned(7 downto 0); 
   signal gpram:        ram_type;             -- general purpose RAM 
   signal buf_o : std_logic_vector(7 downto 0);
   attribute ram_style        : string;
   attribute ram_style of gpram : signal is "block";  

begin

    ram_data_o <=   buf_o when reset ='0' else
                    "00000000";

    process (clk)
      begin
        if (clk'event and clk='1') then
            buf_o <= std_logic_vector(gpram(conv_integer(unsigned(ram_adr_i))));
            if ((ram_en_i='1') and (ram_wr_i='1')) then
                gpram(conv_integer(unsigned(ram_adr_i))) <= unsigned(ram_data_i);
            end if;
        end if;  
    end process;
  
  
  
  
end behav;






-- entity RAM is

  -- port (clk        : in  std_logic;  			-- clock signal
        -- reset      : in  std_logic;  			-- reset signal
        -- ram_data_i : in  std_logic_vector(7 downto 0);  -- data input
        -- ram_data_o : out std_logic_vector(7 downto 0);  -- data output
        -- ram_adr_i  : in  std_logic_vector(6 downto 0);  -- adresses
        -- ram_wr_i   : in  std_logic;  			-- read=0, write=1 
        -- ram_en_i   : in  std_logic);  			-- inactive=0;active=1 
-- end RAM;



-- architecture behav of RAM is


  -- p_read : process (clk, reset)
  -- begin
    -- if reset='1' then
      -- ram_data_o <= "00000000";
    -- else
      -- if Rising_Edge(clk) then
        -- ram_data_o <= std_logic_vector(gpram(conv_integer(unsigned(ram_adr_i))));
      -- end if;
    -- end if;
  -- end process p_read; 


  -- p_write : process (clk, reset, ram_en_i)
  -- begin
    -- if reset='1' then
      -- gpram <= (others => (others =>'0'));    -- reset every bit
    -- else
      -- if Rising_Edge(clk) then
        -- if ((ram_en_i='1') and (ram_wr_i='1')) then
          -- gpram(conv_integer(unsigned(ram_adr_i))) <= unsigned(ram_data_i);
        -- end if;
      -- end if;
    -- end if;
  -- end process p_write;


-- end behav;