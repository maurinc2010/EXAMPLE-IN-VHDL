-- Testbench automatically generated online
-- at http://vhdl.lapinoo.net
-- Generation date : 4.4.2020 13:22:19 GMT

library ieee;
use ieee.std_logic_1164.all;

entity tb_compuerta_xor is
end tb_compuerta_xor;

architecture tb of tb_compuerta_xor is

    component compuerta_xor
        port (entrada : in std_logic_vector (numero_bit-1 downto 0);
              salida  : out std_logic);
    end component;

    signal entrada : std_logic_vector (numero_bit-1 downto 0);
    signal salida  : std_logic;

begin

    dut : compuerta_xor
    port map (entrada => entrada,
              salida  => salida);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        entrada <= (others => '0');

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_compuerta_xor of tb_compuerta_xor is
    for tb
    end for;
end cfg_tb_compuerta_xor;