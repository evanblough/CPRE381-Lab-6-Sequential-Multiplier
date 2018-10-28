-------------------------------------------------------------------------
-- Evan Blough
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------
-- N-Bit Adder.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: Generic N-bit Adder. Used as the 64 bit ALU

--
--
-- NOTES:
-- 10/12/18 by EBB::Design created.
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity N_bit_Adder is
  generic(N : integer := 64);-- 64 is the default value
  port (iA : in  std_logic_vector(N-1 downto 0);
		iB : in  std_logic_vector(N-1 downto 0);
		iC_in : in std_logic;
		oC_out : out std_logic;
        o_F : out std_logic_vector(N-1 downto 0));
end N_bit_Adder;




architecture dataflow of N_bit_Adder is


component full_adder is
	
	port( 
			i_A : in std_logic;
			i_B : in std_logic;
			i_Carry_in : in std_logic;
			o_Sum : out std_logic;
			o_Carry_out : out std_logic);	
end component;






signal Carrybits : std_logic_vector(N-1 downto 0);





begin 

	U0 : full_adder port map (
		i_A => iA(0),
		i_B => iB(0),
		i_Carry_in => iC_in,
		o_Sum => o_F(0),
		o_Carry_out => Carrybits(1));
	
	
	

genLoop : for i in N-2 downto 1 generate
    
	inst_i: full_adder 
	
	port map(
		i_A => iA(i),
		i_B => iB(i),
		i_Carry_in => Carrybits(i),
		o_Sum => o_F(i),
		o_Carry_out => Carrybits(i+1));
		
		
  end generate genLoop;

	UF : full_adder
	port map (
		i_A => iA(N-1),
		i_B => iB(N-1),
		i_Carry_in => Carrybits(N-1),
		o_Sum => o_F(N-1),
		o_Carry_out => oC_out);
		






end dataflow;
