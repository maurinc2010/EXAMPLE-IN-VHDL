library ieee;
use ieee.std_logic_1164.all;
entity FA is
	port
		( 
        X, Y, Ci : in std_logic;
		F, Co : out std_logic 
        );
end entity;
architecture rtl of FA is
begin
	F <= X xor Y xor Ci;
	Co <= (X and Y) or ((X or Y) and Ci);
end rtl;