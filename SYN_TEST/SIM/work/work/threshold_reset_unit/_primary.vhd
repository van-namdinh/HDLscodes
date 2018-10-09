library verilog;
use verilog.vl_types.all;
entity threshold_reset_unit is
    port(
        i_V             : in     vl_logic_vector(7 downto 0);
        i_thresh_prn    : in     vl_logic_vector(7 downto 0);
        i_M             : in     vl_logic_vector(7 downto 0);
        i_alpha         : in     vl_logic_vector(7 downto 0);
        i_beta          : in     vl_logic_vector(7 downto 0);
        i_V_reset       : in     vl_logic_vector(7 downto 0);
        i_kappa         : in     vl_logic;
        i_gamma         : in     vl_logic_vector(1 downto 0);
        o_V             : out    vl_logic_vector(7 downto 0);
        o_spike         : out    vl_logic;
        i_V_valid_BAR   : in     vl_logic
    );
end threshold_reset_unit;
