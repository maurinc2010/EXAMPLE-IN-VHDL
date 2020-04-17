-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity divisor is
	port (
    		clk_50M : in std_logic;
            clk_1K  : out std_logic
            );
end entity;

architecture rtl of divisor is
signal clk_aux : std_logic:='0';
begin
	clk_divisor: process (clk_50M)
    variable cnt: integer range 0 to 25_000;
    	begin
        if rising_edge(clk_50M) then
        	cnt:=cnt+1;
            if cnt=250 then --se debe escalar por 100 
            	clk_aux<= not(clk_aux);
                cnt:=0;
            end if;
         end if;
         clk_1k<=clk_aux;
     end process;
     
end architecture;