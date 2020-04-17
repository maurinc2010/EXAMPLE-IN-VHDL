-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;


entity compuerta_xor is
	generic (
    	numero_bit : integer :=16
        );
	port (
   		entrada : in std_logic_vector(numero_bit-1 downto 0);
        salida	: out std_logic
        );
end entity;

architecture rtl of compuerta_xor is
component compuerta is 
	port (
    	a, b	:	in	std_logic;
        c		:	out	std_logic
        );
end component;
signal aux : std_logic_vector(numero_bit-2 downto 0);
begin
	c0:compuerta port map(
    	a =>entrada(0),
        b =>entrada(1),
        c =>aux(0)
        );
	for_generate: for i in 1 to numero_bit-2 generate
    	ci:compuerta port map (
        				a => aux(i-1),
                        b => entrada(i+1),
                        c => aux(i));
     end generate;
	
    salida <= aux(numero_bit-2);

end architecture;