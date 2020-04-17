-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity punto1 is port
		( clk, reset: in std_logic;
	      unidades, decenas, centenas : out std_logic_vector(6 downto 0)
        );
end entity;

architecture rtl of punto1 is

component bin2bcd9 is
    PORT(
        num_bin: in  STD_LOGIC_VECTOR(8 downto 0);
        num_bcd: out STD_LOGIC_VECTOR(10 downto 0)
    );
end component;

component bcd2display is
    PORT(
        bcd: in  STD_LOGIC_VECTOR(3 downto 0);
        count: out STD_LOGIC_VECTOR(6 downto 0)
    );
end component;

component contador is port
		( clk, reset: in std_logic;
	       	cuenta : out std_logic_vector(7 downto 0)
        );
end component;

signal cuenta : std_logic_vector(7 downto 0);
signal uni,dec,cen : std_logic_vector(3 downto 0);

begin
	contador_1: contador port map (
    			clk => clk,
                reset => reset,
                cuenta => cuenta
                );
                
    conversor_1: bin2bcd9 port map (
    			num_bin => '0' & cuenta,
                num_bcd(3 downto 0) => uni,
                num_bcd(7 downto 4) => dec,
                num_bcd(10 downto 8) =>  cen(2 downto 0) 
                );
     display_unidades: bcd2display PORT map(
       			bcd => uni,
        		count => unidades 
    			);
                
     
     display_decenas: bcd2display PORT map(
       			bcd => dec,
        		count => decenas 
    			);
                
     display_centenas: bcd2display PORT map(
       			bcd => cen,
        		count => centenas 
    			);
end architecture;