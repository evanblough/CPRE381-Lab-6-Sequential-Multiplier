-------------------------------------------------------------------------
-- Evan Blough
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- Multiplicand.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: Multiplicand block of a sequential binary adder.
--
--
-- NOTES:
-- 10/3/18 by EBB::Design created.
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Multiplicand is 
port(	
		i_A : in std_logic_vector(31 downto 0);
		i_CLKM : in std_logic;
		i_Reset : in std_logic;
		i_Write : in std_logic;
		o_F : out std_logic_vector(63 downto 0));
end Multiplicand;

architecture Structure of Multiplicand is
	signal s_D    : std_logic_vector(63 downto 0);    -- Multiplexed input to the FF
  	signal s_Q    : std_logic_vector(63 downto 0):= (others => '0');    -- Output of the FF

begin

o_F <= s_Q;

with i_Write select
    s_D <= (63 downto i_A'length => '0') & i_A when '0',
           s_Q when others;

process(i_CLKM, i_Reset, i_Write)
begin
if(i_Reset = '1') then
s_Q <= (63 downto 0 => '0');
elsif(rising_edge(i_CLKM)) then
s_Q <= s_Q(62 downto 0) & '0';

else
s_Q <= s_D;
end if;

end process;

end structure;


			
