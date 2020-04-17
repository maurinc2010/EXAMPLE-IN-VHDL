-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;


entity shl	is
	port (
    	data_in  : in std_logic_vector(3 downto 0);
        data_out : out std_logic_vector(3 downto 0);
        Count     : out std_logic_vector(6 downto 0);
        reset 	 : in std_logic;
        load	 : in std_logic
        );
end entity;

architecture rtl of shl is 
signal S1 : std_logic_vector(3 downto 0);
	begin
    	shl_registro: process (reset,load)
        begin
        	if reset='1' then
            	S1<=(others=>'0');--"0000";
             elsif rising_edge (load) then
             	S1<=data_in(2 downto 0) & '0';
             end if;
        end process;
        data_out<=S1;
        with (S1) select
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