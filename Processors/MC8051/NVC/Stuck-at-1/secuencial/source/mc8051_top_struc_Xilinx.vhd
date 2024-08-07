-------------------------------------------------------------------------------
--                                                                           --
--          X       X   XXXXXX    XXXXXX    XXXXXX    XXXXXX      X          --
--          XX     XX  X      X  X      X  X      X  X           XX          --
--          X X   X X  X         X      X  X      X  X          X X          --
--          X  X X  X  X         X      X  X      X  X         X  X          --
--          X   X   X  X          XXXXXX   X      X   XXXXXX      X          --
--          X       X  X         X      X  X      X         X     X          --
--          X       X  X         X      X  X      X         X     X          --
--          X       X  X      X  X      X  X      X         X     X          --
--          X       X   XXXXXX    XXXXXX    XXXXXX    XXXXXX      X          --
--                                                                           --
--                                                                           --
--                       O R E G A N O   S Y S T E M S                       --
--                                                                           --
--                            Design & Consulting                            --
--                                                                           --
-------------------------------------------------------------------------------
--                                                                           --
--         Web:           http://www.oregano.at/                             --
--                                                                           --
--         Contact:       mc8051@oregano.at                                  --
--                                                                           --
-------------------------------------------------------------------------------
--                                                                           --
--  MC8051 - VHDL 8051 Microcontroller IP Core                               --
--  Copyright (C) 2001 OREGANO SYSTEMS                                       --
--                                                                           --
--  This library is free software; you can redistribute it and/or            --
--  modify it under the terms of the GNU Lesser General Public               --
--  License as published by the Free Software Foundation; either             --
--  version 2.1 of the License, or (at your option) any later version.       --
--                                                                           --
--  This library is distributed in the hope that it will be useful,          --
--  but WITHOUT ANY WARRANTY; without even the implied warranty of           --
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU        --
--  Lesser General Public License for more details.                          --
--                                                                           --
--  Full details of the license can be found in the file LGPL.TXT.           --
--                                                                           --
--  You should have received a copy of the GNU Lesser General Public         --
--  License along with this library; if not, write to the Free Software      --
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA  --
--                                                                           --
-------------------------------------------------------------------------------
--
--
--         Author:                 Helmut Mayrhofer
--
--         Filename:               mc8051_top_struc.vhd
--
--         Date of Creation:       Mon Aug  9 12:14:48 1999
--
--         Version:                $Revision: 1.7 $
--
--         Date of Latest Version: $Date: 2002-01-07 12:17:45 $
--
--
--         Description: Connect the mc8051 core to its instruction and data
--                      memories.
--
--
--
--
-------------------------------------------------------------------------------
architecture struc of mc8051_top is
    
  signal s_rom_adr:      std_logic_vector(15 downto 0);  -- Programmcounter =
                                                         -- ROM-adress
  signal s_rom_data:     std_logic_vector(7 downto 0);   -- data input from ROM
  signal s_ram_data_out: std_logic_vector(7 downto 0);   -- data output to
                                                         -- internal RAM
  signal s_ram_data_in:  std_logic_vector(7 downto 0);   -- data input from
                                                         -- internal RAM
  signal s_ram_adr:      std_logic_vector(6 downto 0);   -- internal RAM-adress
  signal s_ram_wr:       std_logic;                      -- read (0)/write (1)
                                                         -- internal RAM
  signal s_ram_en:       std_logic;                      -- RAM-block enable


  signal s_ramx_data_out: std_logic_vector(7 downto 0);  -- data output to                                                         -- ext. RAM
  signal s_ramx_data_in:  std_logic_vector(7 downto 0);  -- data input from
                                                         -- ext. RAM
  signal s_ramx_adr:      std_logic_vector(15 downto 0); -- ext. RAM-adress
  signal s_ramx_wr:       std_logic;                     -- read (0)/write (1)
        
                                                -- ext. RAM



	
COMPONENT ROM IS
  PORT (
    clk : IN STD_LOGIC;
    reset : IN STD_LOGIC;
    addr : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;

COMPONENT SRAMX IS
  PORT (
    clk : IN STD_LOGIC;
    reset : IN STD_LOGIC;
    ram_wr_i : IN STD_LOGIC;
    ram_adr_i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    ram_data_i : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    ram_data_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;


COMPONENT RAM IS
  port (clk        : in  std_logic;  			-- clock signal
        reset      : in  std_logic;  			-- reset signal
        ram_data_i : in  std_logic_vector(7 downto 0);  -- data input
        ram_data_o : out std_logic_vector(7 downto 0);  -- data output
        ram_adr_i  : in  std_logic_vector(6 downto 0);  -- adresses
        ram_wr_i   : in  std_logic;  			-- read=0, write=1 
        ram_en_i   : in  std_logic);  
END COMPONENT;







begin               
  



  i_mc8051_core : mc8051_core
    port map(clk         => clk,
             reset       => reset,
             rom_data_i  => s_rom_data,
             ram_data_i  => s_ram_data_out,
             int0_i      => int0_i,
             int1_i      => int1_i,
             all_t0_i    => all_t0_i,
             all_t1_i    => all_t1_i,
             all_rxd_i   => all_rxd_i,
             p0_i        => p0_i,
             p1_i        => p1_i,
             p2_i        => p2_i,
             p3_i        => p3_i,
             p0_o        => p0_o,
             p1_o        => p1_o,
             p2_o        => p2_o,
             p3_o        => p3_o, 
             all_rxd_o   => all_rxd_o,
             all_txd_o   => all_txd_o,
             all_rxdwr_o => all_rxdwr_o,
             rom_adr_o   => s_rom_adr,
             ram_data_o  => s_ram_data_in,
             ram_adr_o   => s_ram_adr,
             ram_wr_o    => s_ram_wr,
             ram_en_o    => s_ram_en,
             datax_i     => s_ramx_data_in,
             datax_o     => s_ramx_data_out,
             adrx_o      => s_ramx_adr,
             wrx_o       => s_ramx_wr
				 );
 
 


  i_mc8051_rom : ROM
    port map (
        clk      => clk,
	    reset    => reset,
	    addr     => s_rom_adr,
        dout     => s_rom_data);

  
  


  i_mc8051_ram : RAM
    port map (
        clk         => clk,
	    reset       => reset,
	    ram_adr_i   => s_ram_adr,
        ram_data_i  => s_ram_data_in,
        ram_wr_i    => s_ram_wr,
        ram_en_i    => s_ram_en,
        ram_data_o  => s_ram_data_out);




    
  i_mc8051_ramx : SRAMX
    port map (
        clk         => clk,
	    reset       => reset,
	    ram_adr_i   => s_ramx_adr,
        ram_data_i  => s_ramx_data_out,
        ram_wr_i    => s_ramx_wr,
        ram_data_o  => s_ramx_data_in);
  
end struc;
