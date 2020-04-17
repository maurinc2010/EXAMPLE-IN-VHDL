-- Testbench automatically generated online
-- at http://vhdl.lapinoo.net
-- Generation date : 27.3.2020 23:20:15 GMT

library ieee;
use ieee.std_logic_1164.all;

entity tb_mux is
end tb_mux;

architecture tb of tb_mux is

    component mux
        port (a : in std_logic_vector (7 downto 0);
              b : in std_logic_vector (7 downto 0);
              s : in std_logic;
              y : out std_logic_vector (7 downto 0));
    end component;

    signal a : std_logic_vector (7 downto 0);
    signal b : std_logic_vector (7 downto 0);
    signal s : std_logic;
    signal y : std_logic_vector (7 downto 0);

begin

    dut : mux
    port map (a => a,
              b => b,
              s => s,
              y => y);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        a <= "10101010";
        b <= "11001100";
        s <= '0';
        wait for 10 ms;
        
        a <= "10101010";
        b <= "11001100";
        s <= '1';
        wait for 10 ms;
        
        a <= "10101010";
        b <= "11011101";
        s <= '1';
        wait for 10 ms;

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_mux of tb_mux is
    for tb
    end for;
end cfg_tb_mux;