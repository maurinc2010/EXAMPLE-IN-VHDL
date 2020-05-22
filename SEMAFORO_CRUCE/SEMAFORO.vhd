library ieee;
use ieee.std_logic_1164.all;

entity SEMAFORO is
	port (
			sensor			  : in  std_logic;
			clk_1s			  : in  std_logic;
			reset            : in  std_logic;
			rural, carretera : out std_logic_vector(2 downto 0)
	);
end entity;
	
architecture moore of SEMAFORO is

type lista_estado is ( inicial, carramarillo,camiverde, camiamarillo, espera);
signal estado_presente, estado_futuro : lista_estado;
signal reset_cuenta,fin_corto,fin_largo : std_logic;
begin

 process (clk_1s,reset,estado_futuro)
	begin	
		if reset='1' then	
			estado_presente<=inicial;
		elsif rising_edge(clk_1s) then	
			estado_presente <= estado_futuro;
		end if;
 end process;
 
 cuenta_tiempo: process (clk_1s)
 variable cuenta : integer range 0 to 30; --se usa para contar el tiempo 
 begin
	if rising_edge (clk_1s) then
		if reset_cuenta = '1' then
			cuenta :=0;
		else
			cuenta :=cuenta +1;
		end if;
		if cuenta = 9 then	
			fin_corto <='1';
			fin_largo <='0';
		elsif cuenta =29 then	
			fin_corto<='0';
			fin_largo <='1';
		else 
			fin_corto <='0';
			fin_largo <='0';
		end if;
	end if;
end process;
 
 
 process (estado_presente,sensor)
   
	begin	
		case estado_presente is
			
			when inicial => 
					if sensor ='1' then
						estado_futuro<= carramarillo;
					else  --sensor es igual a cero
						reset_cuenta<='1';
						carretera <= "001"; --rojo off, amararillo off, verde on
					   rural <= "100";
						estado_futuro<= estado_presente;
					end if;
					
			when carramarillo =>
					reset_cuenta<='1';
					estado_futuro <=camiverde;
					rural <="010";
					carretera <="010";
					
			when camiverde => 
					if fin_corto ='1' then	
						estado_futuro<=camiamarillo;
					else
						reset_cuenta<='0';
						estado_futuro <= estado_presente;
						carretera <="100";
						rural <= "001";
					end if;
					
			when camiamarillo =>
					estado_futuro <=espera;
					reset_cuenta <='1';
					carretera <="100";
					rural <="010";
					
			when espera =>
					if fin_largo = '1' then
						estado_futuro <= inicial;
						carretera <="010";
					else	
						estado_futuro <= estado_presente;
						reset_cuenta <='0';
						carretera <="100";
						rural<="100";
					end if;
			when others => null;
					
		  end case;
		  
end process;
 
 


end architecture;


