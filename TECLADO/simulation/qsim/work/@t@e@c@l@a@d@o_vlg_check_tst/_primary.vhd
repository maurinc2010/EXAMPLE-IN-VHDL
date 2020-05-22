library verilog;
use verilog.vl_types.all;
entity TECLADO_vlg_check_tst is
    port(
        data            : in     vl_logic_vector(6 downto 0);
        new_data        : in     vl_logic_vector(3 downto 0);
        outp            : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end TECLADO_vlg_check_tst;
