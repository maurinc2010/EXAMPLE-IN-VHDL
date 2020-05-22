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

type lista_estado is ( inicial, carramarillo,camiverde,camiamarillo, espera);
signal estado_presente, estado_futuro : lista_estado;
signal reset_cuenta,tiempo_largo, tiempo_corto : std_logic:='0';
signal cuenta : integer range 0 to 30; --se usa para contar el tiempo 
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
 
 begin
	if rising_edge (clk_1s) then
		if reset_cuenta = '1' then
			cuenta <=0;
		else
			cuenta <=cuenta +1;
			if cuenta = 29 then
				tiempo_largo <='1';
				tiempo_corto<='0';
			elsif cuenta = 9 then	
				tiempo_corto <='1';
				tiempo_largo <='0';
			else	
				tiempo_corto <='0';
				tiempo_largo <='0';
			end if;
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
					if tiempo_corto ='1' then
						estado_futuro <= camiamarillo;
						reset_cuenta <='1';
					else
						estado_futuro<= estado_presente;
						rural<= "001";
						carretera <= "100";
						reset_cuenta<='0';
					end if;
					
			when camiamarillo =>
					reset_cuenta<='1';
					estado_futuro <=espera;
					rural <="010";
					carretera <="010";
			when espera =>
					if tiempo_largo ='1' then
						estado_futuro <= inicial;
						reset_cuenta <='1';
					else
						estado_futuro<= estado_presente;
						rural<= "100";
						carretera <= "001";
						reset_cuenta<='0';
					end if;
					
					
			when others => null;
					
		  end case;
		  
end process;
 
 


end architecture;