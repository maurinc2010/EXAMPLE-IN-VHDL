-- Testbench automatically generated online
-- at http://vhdl.lapinoo.net
-- Generation date : 28.3.2020 12:29:22 GMT

library ieee;
use ieee.std_logic_1164.all;

entity tb_contador is
end tb_contador;

architecture tb of tb_contador is

    component contador
        port (clk    : in std_logic;
              reset  : in std_logic;
              cuenta : out std_logic_vector (7 downto 0));
    end component;

    signal clk    : std_logic;
    signal reset  : std_logic;
    signal cuenta : std_logic_vector (7 downto 0);

begin

    dut : contador
    port map (clk    => clk,
              reset  => reset,
              cuenta => cuenta);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        clk <= '0';
        reset <= '0';

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_contador of tb_contador is
    for tb
    end for;
end cfg_tb_contador;
