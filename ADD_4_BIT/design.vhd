-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
 
entity sumador_4_bit is
	port (
    		A, B : in std_logic_vector(3 downto 0);
            Cin	 : in std_logic;
            F	 : out std_logic_vector(3 downto 0);
            Cout : out std_logic
            );
end entity;

architecture rtl of sumador_4_bit is

component FA is
	port
		( 
        X, Y, Ci : in std_logic;
		F, Co : out std_logic 
        );
end component;

signal c_interno : std_logic_vector(3 downto 0);

	begin
    FA0: FA port map (
    		X => A(0),
            Y => B(0),
            F => F(0),
            Ci=> Cin,
            Co=> c_interno(0)
            );
            
     FA1: FA port map (
    		X => A(1),
            Y => B(1),
            F => F(1),
            Ci=> c_interno(0),
            Co=> c_interno(1)
            );
            
      FA2: FA port map (
    		X => A(2),
            Y => B(2),
            F => F(2),
            Ci=> c_interno(1),
            Co=> c_interno(2)
            );
            
      FA3: FA port map (
    		X => A(3),
            Y => B(3),
            F => F(3),
            Ci=> c_interno(2),
            Co=> c_interno(3)
            );
            
       Cout<= c_interno(3);
    
end architecture;