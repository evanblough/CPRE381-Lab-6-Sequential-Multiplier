-- full adder (1-bit)

library IEEE;
use IEEE.std_logic_1164.all;
use work.all;

entity full_adder is
	port (	i_A : in std_logic;
		i_B : in std_logic;
		i_Carry_in : in std_logic;
		o_Sum : out std_logic;
		o_Carry_out : out std_logic);	
end full_adder;

architecture dataflow of full_adder is

begin

	o_Sum <= (i_A xor i_B) xor i_Carry_in;
	o_Carry_out <= (i_A and i_B) or (i_A and i_Carry_in) or (i_B and i_Carry_in);

end dataflow;







	
	
