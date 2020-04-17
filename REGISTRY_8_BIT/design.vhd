-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;


entity registro is
	port (
    		entrada : in std_logic_vector(7 downto 0);
            salida	: out std_logic_vector(7 downto 0);
            guarda  : in std_logic
            
            );
end entity;

architecture rtl of registro is

begin
	reg:process(guarda)
    	begin
        	if rising_edge(guarda) then 
            	salida<=entrada;
            end if;
     end process;
            
end architecture;
        	
    

