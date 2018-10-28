-------------------------------------------------------------------------
-- Evan Blough
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------
-- Multiplicaiton_Sys.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: Generic N-bit Register. Write enable and Reset


--
--
-- NOTES:
-- 10/14/18 by EBB::Design created.
-------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity Multiplicaiton_Sys is

port(
		Clock1 : in std_logic;
		Load : in std_logic;
		Reset1 : in std_logic;
		Multiplicand1 : in std_logic_vector(31 downto 0);
		multiplier1 : in std_logic_vector(31 downto 0);
		Product1 : out std_logic_vector(63 downto 0)
		




);

end Multiplicaiton_Sys;



architecture dataflow of Multiplicaiton_Sys is

component N_Bit_Register is
generic (N : integer := 64);
port(	iA : in  std_logic_vector(N-1 downto 0);
		Clock : in std_logic;
		iWE : in std_logic;
		i_Reset : in std_logic;
		o_F : out std_logic_vector(N-1 downto 0));
end component;

component b64_2to1_mux is
port(
	i_A : in  std_logic_vector(63 downto 0);
	i_B : in  std_logic_vector(63 downto 0);
	Selct : in  std_logic;
	o_C : out  std_logic_vector(63 downto 0));
	
end component;

component Multiplier is
port(	
		i_A : in std_logic_vector(31 downto 0); 
		i_CLKM : in std_logic;
		i_Reset : in std_logic;
		i_Write : in std_logic;
		o_F : out std_logic_vector(31 downto 0));
		
end component;

component Multiplicand is
port(	
		i_A : in std_logic_vector(31 downto 0);
		i_CLKM : in std_logic;
		i_Reset : in std_logic;
		i_Write : in std_logic;
		o_F : out std_logic_vector(63 downto 0));
		
end component;

component N_bit_Adder is 
 generic(N : integer := 64);-- 64 is the default value
  port (iA : in  std_logic_vector(N-1 downto 0);
		iB : in  std_logic_vector(N-1 downto 0);
		iC_in : in std_logic;
		oC_out : out std_logic;
        o_F : out std_logic_vector(N-1 downto 0));
	end component;
	
signal ALU2Product : std_logic_vector(63 downto 0);
signal select1 : std_logic_vector(31 downto 0);
signal Mux2ALU : std_logic_vector(63 downto 0);
signal Product2ALU : std_logic_vector(63 downto 0);
signal Cand2Mux : std_logic_vector(63 downto 0);
constant zero : std_logic_vector(63 downto 0) := (63 downto 0 => '0');
	
begin

Product : N_Bit_Register
generic map ( N => 64)
port map ( 

iA => ALU2Product,
Clock => Clock1,
i_Reset => Reset1,
iWE => Clock1, --Used to be 0
o_F => Product2ALU);

Mux : b64_2to1_mux
port map(
i_B => Cand2Mux,
i_A => zero,
selct => select1(0),
o_C => Mux2ALU);

U0 : Multiplier
port map(
i_A => multiplier1,
i_CLKM => Clock1,
i_Write => Load,
i_Reset => Reset1,
o_F => select1);


U1 : Multiplicand
port map(
i_A => Multiplicand1,
i_CLKM => Clock1,
i_Reset => Reset1,
i_Write => Load,
o_F => Cand2Mux

);


ALU : N_bit_Adder
generic map (N => 64)
port map(
iA => Mux2ALU,
iB => Product2ALU,
iC_in => '0',
o_F => ALU2Product,
oC_out => open
);

Product1 <= product2ALU  ;

end dataflow;
	