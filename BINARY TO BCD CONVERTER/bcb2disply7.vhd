library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity bcd2display is
    PORT(
        bcd: in  STD_LOGIC_VECTOR(3 downto 0);
        count: out STD_LOGIC_VECTOR(6 downto 0)
    );
end entity;

architecture rtl of bcd2display is
begin

        with (bcd) select
        Count <= "1000000" when "0000",
				 "1111001" when "0001",
				 "0100100" when "0010",
				 "0110000" when "0011",
				 "0011001" when "0100",
	             "0011001" when "0101",
	             "0000010" when "0110",
				 "1011000" when "0111",
				 "0000000" when "1000",
	    		 "0010000" when "1001",
	  	  		 "0111111" when others;
                 
end architecture;