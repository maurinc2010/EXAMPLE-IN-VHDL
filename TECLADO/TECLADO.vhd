library ieee;
use ieee.std_logic_1164.all;

entity TECLADO	is
	port (
		clk_250m : in std_logic;
		inp  : in 	std_logic_vector(3 downto 0);
		outp : out  std_logic_vector(2 downto 0);
		data : out  std_logic_vector(6 downto 0);
		new_data : out std_logic_vector(3 downto 0)
		);
end entity;


architecture rtl of TECLADO is
type lista_estado is (COLUMNA1,COLUMNA2,COLUMNA3);
signal estado_presente,estado_futuro : lista_estado;
	begin
	
	process (estado_futuro,clk_250m)
		begin
			if rising_edge(clk_250m)then
				estado_presente<=estado_futuro;
			end if;
	end process;
	
	process (estado_presente)
		begin
		case estado_presente is
		
			when COLUMNA1 => outp<="011";
							estado_futuro<=COLUMNA2;
							
			when COLUMNA2	=> outp <="101";
								estado_futuro<= COLUMNA3;
								
			when COLUMNA3 => outp <="110";
								estado_futuro <= COLUMNA1;
								
			when others =>estado_futuro<=COLUMNA1;
			
		end case;
	end process;
	
	new_data <= "0001" when (estado_presente =COLUMNA1 AND inp="0111") else --1
					"0100" when (estado_presente =COLUMNA1 AND inp="1011") else --4
					"0111" when (estado_presente =COLUMNA1 AND inp="1101") else --7
					"110" when (estado_presente =COLUMNA1 AND inp="1110") else  --*
				
					"0010" when (estado_presente =COLUMNA2 AND inp="0111") else --2
					"0101" when (estado_presente =COLUMNA2 AND inp="1011") else --5
					"1000" when (estado_presente =COLUMNA2 AND inp="1101") else --8
					"0000" when (estado_presente =COLUMNA2 AND inp="1110") else  --0
					
					"0101" when (estado_presente =COLUMNA3 AND inp="0111") else --3
					"0110" when (estado_presente =COLUMNA3 AND inp="1011") else --6
					"1001" when (estado_presente =COLUMNA3 AND inp="1101") else --9
					"1101" when (estado_presente =COLUMNA3 AND inp="1110") else --#
					"0000";  --vacio 

end architecture;