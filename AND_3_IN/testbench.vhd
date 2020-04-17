-- Testbench automatically generated online
-- at http://vhdl.lapinoo.net
-- Generation date : 20.3.2020 22:44:35 GMT

library ieee;
use ieee.std_logic_1164.all;

entity tb_and_3_in is
end tb_and_3_in;

architecture tb of tb_and_3_in is

    component and_3_in
        port (a : in std_logic;
              b : in std_logic;
              c : in std_logic;
              d : out std_logic);
    end component;

    signal a_tb : std_logic;
    signal b_tb : std_logic;
    signal c_tb : std_logic;
    signal d_tb : std_logic;

begin

    dut : and_3_in
    port map (a => a_tb,
              b => b_tb,
              c => c_tb,
              d => d_tb);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        a_tb <= '0';
        b_tb <= '0';
        c_tb <= '0';
        wait for 10 ms;
        ASSERT d_tb = '1' REPORT "Funcionamiento correcto";
        ASSERT d_tb = '0' REPORT "Funcionamiento erroneo";
        a_tb <= '1';
        b_tb <= '0';
        c_tb <= '0';
        
        wait for 10 ms;
        ASSERT d_tb = '1' REPORT "Funcionamiento correcto";
        ASSERT d_tb = '0' REPORT "Funcionamiento erroneo";
        a_tb <= '1';
        b_tb <= '0';
        c_tb <= '1';
		wait for 10 ms;
        ASSERT d_tb = '1' REPORT "Funcionamiento correcto";
        ASSERT d_tb = '0' REPORT "Funcionamiento erroneo";
        b_tb <= '1';
        wait for 10 ms;
        ASSERT d_tb = '0' REPORT "Funcionamiento correcto, todas entras en uno";
        ASSERT d_tb = '1' REPORT "Funcionamiento correcto, todas entras en uno";
        a_tb <= '0';
        wait for 10 ms;
        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_and_3_in of tb_and_3_in is
    for tb
    end for;
end cfg_tb_and_3_in;
