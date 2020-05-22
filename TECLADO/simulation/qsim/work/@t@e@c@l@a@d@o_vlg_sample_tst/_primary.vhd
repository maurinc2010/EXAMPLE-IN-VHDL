library verilog;
use verilog.vl_types.all;
entity TECLADO_vlg_sample_tst is
    port(
        clk_250m        : in     vl_logic;
        inp             : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end TECLADO_vlg_sample_tst;
