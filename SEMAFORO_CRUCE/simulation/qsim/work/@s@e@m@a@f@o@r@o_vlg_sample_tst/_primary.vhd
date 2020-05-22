library verilog;
use verilog.vl_types.all;
entity SEMAFORO_vlg_sample_tst is
    port(
        clk_1s          : in     vl_logic;
        reset           : in     vl_logic;
        sensor          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end SEMAFORO_vlg_sample_tst;
