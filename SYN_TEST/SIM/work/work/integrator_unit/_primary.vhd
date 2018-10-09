library verilog;
use verilog.vl_types.all;
entity integrator_unit is
    port(
        i_clk           : in     vl_logic;
        i_rst           : in     vl_logic;
        i_V             : in     vl_logic_vector(7 downto 0);
        i_syn_weight    : in     vl_logic_vector(7 downto 0);
        i_leak_weight   : in     vl_logic_vector(7 downto 0);
        i_spike_en      : in     vl_logic;
        i_leak_en       : in     vl_logic;
        o_V             : out    vl_logic_vector(7 downto 0);
        o_V_valid_BAR   : out    vl_logic
    );
end integrator_unit;
