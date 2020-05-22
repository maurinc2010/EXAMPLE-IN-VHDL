library verilog;
use verilog.vl_types.all;
entity TECLADO is
    port(
        clk_250m        : in     vl_logic;
        inp             : in     vl_logic_vector(3 downto 0);
        outp            : out    vl_logic_vector(2 downto 0);
        data            : out    vl_logic_vector(6 downto 0);
        new_data        : out    vl_logic_vector(3 downto 0)
    );
end TECLADO;
