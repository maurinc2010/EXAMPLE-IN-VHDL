-- Testbench automatically generated online
-- at http://vhdl.lapinoo.net
-- Generation date : 27.3.2020 01:30:37 GMT

library ieee;
use ieee.std_logic_1164.all;

entity tb_sumador_4_bit is
end tb_sumador_4_bit;

architecture tb of tb_sumador_4_bit is

    component sumador_4_bit
        port (A    : in std_logic_vector (3 downto 0);
              B    : in std_logic_vector (3 downto 0);
              Cin  : in std_logic;
              F    : out std_logic_vector (3 downto 0);
              Cout : out std_logic);
    end component;

    signal A    : std_logic_vector (3 downto 0);
    signal B    : std_logic_vector (3 downto 0);
    signal Cin  : std_logic;
    signal F    : std_logic_vector (3 downto 0);
    signal Cout : std_logic;

begin

    dut : sumador_4_bit
    port map (A    => A,
              B    => B,
              Cin  => Cin,
              F    => F,
              Cout => Cout);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        A <="0101";
        B <="0010";
        Cin <= '0';
        
        wait for 10 ms;

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_sumador_4_bit of tb_sumador_4_bit is
    for tb
    end for;
end cfg_tb_sumador_4_bit;