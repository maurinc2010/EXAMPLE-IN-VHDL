library verilog;
use verilog.vl_types.all;
entity SEMAFORO_vlg_check_tst is
    port(
        carretera       : in     vl_logic_vector(2 downto 0);
        rural           : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end SEMAFORO_vlg_check_tst;
