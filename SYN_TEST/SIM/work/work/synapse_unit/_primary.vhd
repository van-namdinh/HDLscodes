library verilog;
use verilog.vl_types.all;
entity synapse_unit is
    port(
        i_syn_weight    : in     vl_logic_vector(31 downto 0);
        i_G             : in     vl_logic_vector(1 downto 0);
        i_syn_prn       : in     vl_logic_vector(7 downto 0);
        i_mode_sel      : in     vl_logic;
        o_syn_weight    : out    vl_logic_vector(7 downto 0)
    );
end synapse_unit;
