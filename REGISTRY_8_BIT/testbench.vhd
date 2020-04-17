-- Testbench automatically generated online
-- at http://vhdl.lapinoo.net
-- Generation date : 27.3.2020 23:55:08 GMT

library ieee;
use ieee.std_logic_1164.all;

entity tb_registro is
end tb_registro;

architecture tb of tb_registro is

    component registro
        port (entrada : in std_logic_vector (7 downto 0);
              salida  : out std_logic_vector (7 downto 0);
              guarda  : in std_logic);
    end component;

    signal entrada : std_logic_vector (7 downto 0);
    signal salida  : std_logic_vector (7 downto 0);
    signal guarda  : std_logic;

begin

    dut : registro
    port map (entrada => entrada,
              salida  => salida,
              guarda  => guarda);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        entrada <= "10101010";
        guarda <= '0';
		wait for 10 ms;
        
        guarda <= '1';
		wait for 10 ms;
        
        entrada <= "11101110";
        wait for 10 ms;
        
        guarda <= '0';
		wait for 10 ms;
        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_registro of tb_registro is
    for tb
    end for;
end cfg_tb_registro;