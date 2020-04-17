-- Testbench automatically generated online
-- at http://vhdl.lapinoo.net
-- Generation date : 3.4.2020 23:44:35 GMT

library ieee;
use ieee.std_logic_1164.all;

entity tb_shl is
end tb_shl;

architecture tb of tb_shl is

    component shl
        port (data_in  : in std_logic_vector (3 downto 0);
              data_out : out std_logic_vector (3 downto 0);
              Count    : out std_logic_vector (6 downto 0);
              reset    : in std_logic;
              load     : in std_logic);
    end component;

    signal data_in  : std_logic_vector (3 downto 0);
    signal data_out : std_logic_vector (3 downto 0);
    signal Count    : std_logic_vector (6 downto 0);
    signal reset    : std_logic;
    signal load     : std_logic;

begin

    dut : shl
    port map (data_in  => data_in,
              data_out => data_out,
              Count    => Count,
              reset    => reset,
              load     => load);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        data_in <= (others => '0');
        reset <= '0';
        load <= '0';
        wait for 10 ms;
        -- EDIT Add stimuli here
        
        data_in <= "0001";
        reset <= '0';
        load <= '1';
		wait for 10 ms;
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_shl of tb_shl is
    for tb
    end for;
end cfg_tb_shl;