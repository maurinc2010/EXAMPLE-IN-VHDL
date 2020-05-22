-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;


entity pulsador is
	port (
    		boton :	 in std_logic;
            ld0	  :	 out std_logic
            );
end entity;

architecture rtl of pulsador is 

	type lista_estados is (ONN, OFF);
    signal estado : lista_estados;
    
begin
	
    ejecucion: process (boton)
    	begin
        	if boton='1' then
            	case estado is
                	when ONN => estado <=OFF;
                    			ld0 <= '0';
                     when OFF => estado <= ONN;
                     				ld0 <= '1';
                     when others => estado<=OFF;
                     				ld0 <='0';
					 end case;
             end if;
             
     end process;
     
end architecture;
                	

