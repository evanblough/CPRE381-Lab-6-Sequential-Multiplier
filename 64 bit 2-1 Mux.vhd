library ieee;
use ieee.std_logic_1164.all;

entity b64_2to1_mux is
port(
	i_A : in  std_logic_vector(63 downto 0);
	i_B : in  std_logic_vector(63 downto 0);
	Selct : in  std_logic;
	o_C : out  std_logic_vector(63 downto 0));
end b64_2to1_mux;



architecture dataflow of b64_2to1_mux is

begin
 o_C <= i_A when selct = '0' else
		i_B when selct = '1';
		
end dataflow;		