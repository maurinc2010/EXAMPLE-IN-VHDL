-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity compuerta is 
	port (
    	a, b	:	in	std_logic;
        c		:	out	std_logic
        );
end entity;


architecture rtl of compuerta is
begin
	c <= a xor b;
end architecture;