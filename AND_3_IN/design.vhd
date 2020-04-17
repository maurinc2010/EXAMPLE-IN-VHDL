-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity and_3_in is 
	port (
    	a,b,c : in std_logic;
        d 	  : out std_logic
    );
end entity;

architecture compuerta of and_3_in is 
	begin
    	d<= a and b and c;
        
end architecture;