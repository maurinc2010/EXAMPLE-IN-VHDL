-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity contador is port
		( clk, reset: in std_logic;
	       	cuenta : out std_logic_vector(7 downto 0)
        );
end entity;

 architecture rtl of contador is 
 begin
 cuenta_1: process(clk,reset)
 --variables--
 variable cnt : unsigned (7 downto 0):="00000000";
 begin
 	if(reset ='1')then 
      cnt:="00000000";--(others=>'0');
   elsif rising_edge(clk)then
      cnt:=cnt+1;
      if (cnt = "1100100")then
      cnt:= (others => '0');
      end if;
    end if;	
    cuenta<=std_logic_vector(cnt);
 end process;
 end architecture;
