-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;


entity pusador is
	port (
    		boton, reset, clk :	 in std_logic; -- clk 250ms
            ld0	  	 :	 out std_logic
            );
end entity;

architecture rtl of pusador is 

	type lista_estados is (ONN, OFF,Q1);
   signal estado_actual,estado_futuro : lista_estados;
begin

	cambio: process(clk,reset,estado_futuro)
	begin	
		if reset ='1' then 	--se pregunta si reset
			estado_actual<= OFF;
		elsif rising_edge (clk) then --si hay flanco acendente 
			estado_actual <=estado_futuro;
		end if;
	end process;
	
    ejecucion: process (estado_actual)
    	begin
			case estado_actual is  -- verificar estado actual
					when ONN => if boton ='1' then
										estado_futuro <=OFF;  -- si estado actual es on pasa a off
										ld0 <= '0';
									else 
										estado_futuro <= ONN;
										ld0 <= '1';
									end if;
					when OFF => if boton='1' then  --si se precciono boton
										estado_futuro <= ONN;  --estado actual es off pasa a on
										ld0 <= '1';
									else 
										estado_futuro<= OFF;
										ld0 <= '0';
									end if;
					when others => estado_futuro<=OFF;  --si no se cumple los casos anteriores
										ld0 <='0';
					end case;
             
     end process;
     
end architecture;