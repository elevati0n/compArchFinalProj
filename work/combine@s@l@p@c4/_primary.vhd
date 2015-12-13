library verilog;
use verilog.vl_types.all;
entity combineSLPC4 is
    port(
        in0             : in     vl_logic_vector(31 downto 0);
        in1             : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end combineSLPC4;
