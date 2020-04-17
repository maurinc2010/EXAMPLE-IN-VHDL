-- Testbench automatically generated online
-- at http://vhdl.lapinoo.net
-- Generation date : 3.4.2020 02:15:03 GMT

library ieee;
use ieee.std_logic_1164.all;

entity tb_divisor is
end tb_divisor;

architecture tb of tb_divisor is

    component divisor
        port (clk_50M : in std_logic;
              clk_1K  : out std_logic);
    end component;

    signal clk_50M : std_logic;
    signal clk_1K  : std_logic;

    constant TbPeriod : time := 20 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : divisor
    port map (clk_50M => clk_50M,
              clk_1K  => clk_1K);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk_50M is really your main clock signal
    clk_50M <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed

        -- EDIT Add stimuli here
        wait for 1000 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_divisor of tb_divisor is
    for tb
    end for;
end cfg_tb_divisor;