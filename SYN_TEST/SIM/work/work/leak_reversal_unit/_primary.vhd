library verilog;
use verilog.vl_types.all;
entity leak_reversal_unit is
    port(
        i_leak_weight   : in     vl_logic_vector(7 downto 0);
        i_V             : in     vl_logic_vector(7 downto 0);
        i_mode_sel      : in     vl_logic;
        o_leak_weight   : out    vl_logic_vector(7 downto 0)
    );
end leak_reversal_unit;
