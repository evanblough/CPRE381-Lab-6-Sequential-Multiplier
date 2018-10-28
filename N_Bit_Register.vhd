-------------------------------------------------------------------------
-- Evan Blough
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------
-- N_Bit_Register.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: Generic N-bit Register. Write enable and Reset


--
--
-- NOTES:
-- 10/14/18 by EBB::Design created.
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use work.all;

entity N_Bit_Register is 
generic(N : integer := 64); --- 64 default value
port(	iA : in  std_logic_vector(N-1 downto 0);
		Clock : in std_logic;
		iWE : in std_logic;
		i_Reset : in std_logic;
		o_F : out std_logic_vector(N-1 downto 0));
		
end N_Bit_Register;


architecture dataflow of N_Bit_Register is 

component dff is
	port (	i_CLK        : in std_logic;     -- Clock input
			i_RST        : in std_logic;     -- Reset input
			i_WE         : in std_logic;     -- Write enable input
			i_D          : in std_logic;     -- Data value input
			o_Q          : out std_logic);   -- Data value output
end component;

begin

dffgenerate : for i in N-1 downto 0 generate

	inst_i : dff
	
	port map( 
			i_D => iA(i),
			o_Q => o_F(i),
			i_CLK => Clock,
			i_RST => i_Reset,
			i_WE => iWE);
			
	end generate dffgenerate;
	
	end dataflow;
			
	