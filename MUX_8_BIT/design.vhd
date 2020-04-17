-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity mux is
	port (
    	a,b : in std_logic_vector(7 downto 0);
        s   : in std_logic;
        y	  : out std_logic_vector(7 downto 0)
        );
end entity;

architecture comportametal of mux is
-----no hay senales------
begin

	definirmux: process(s,a,b)
    --en esta parte se colocan las variables
    	begin
        	if (s='1') then
            	y<=b;
            else
            	y<=a;
            end if;
     end process;
     
end architecture;