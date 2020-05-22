library verilog;
use verilog.vl_types.all;
entity SEMAFORO is
    port(
        sensor          : in     vl_logic;
        clk_1s          : in     vl_logic;
        reset           : in     vl_logic;
        rural           : out    vl_logic_vector(2 downto 0);
        carretera       : out    vl_logic_vector(2 downto 0)
    );
end SEMAFORO;
