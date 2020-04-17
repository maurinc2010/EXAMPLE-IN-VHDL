-- Testbench automatically generated online
-- at http://vhdl.lapinoo.net
-- Generation date : 6.4.2020 20:28:49 GMT

library ieee;
use ieee.std_logic_1164.all;

entity tb_punto1 is
end tb_punto1;

architecture tb of tb_punto1 is

    component punto1
        port (clk      : in std_logic;
              reset    : in std_logic;
              unidades : out std_logic_vector (6 downto 0);
              decenas  : out std_logic_vector (6 downto 0);
              centenas : out std_logic_vector (6 downto 0));
    end component;

    signal clk      : std_logic;
    signal reset    : std_logic;
    signal unidades : std_logic_vector (6 downto 0);
    signal decenas  : std_logic_vector (6 downto 0);
    signal centenas : std_logic_vector (6 downto 0);

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : punto1
    port map (clk      => clk,
              reset    => reset,
              unidades => unidades,
              decenas  => decenas,
              centenas => centenas);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        reset <= '0';

        -- EDIT Add stimuli here
        wait for 110 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_punto1 of tb_punto1 is
    for tb
    end for;
end cfg_tb_punto1;