library verilog;
use verilog.vl_types.all;
entity top_unit is
    port(
        i_clk           : in     vl_logic;
        i_rst           : in     vl_logic;
        i_lfsr_en       : in     vl_logic;
        i_Seed_DV       : in     vl_logic;
        i_Seed_Data     : in     vl_logic_vector(7 downto 0);
        i_leak_weight   : in     vl_logic_vector(7 downto 0);
        i_leak_mode_sel : in     vl_logic;
        i_syn_weight    : in     vl_logic_vector(31 downto 0);
        i_G             : in     vl_logic_vector(1 downto 0);
        i_syn_mode_sel  : in     vl_logic;
        i_leak_reversal_mode: in     vl_logic;
        i_spike_en      : in     vl_logic;
        i_leak_en       : in     vl_logic;
        i_V             : in     vl_logic_vector(7 downto 0);
        i_M             : in     vl_logic_vector(7 downto 0);
        i_alpha         : in     vl_logic_vector(7 downto 0);
        i_beta          : in     vl_logic_vector(7 downto 0);
        i_V_reset       : in     vl_logic_vector(7 downto 0);
        i_kappa         : in     vl_logic;
        i_gamma         : in     vl_logic_vector(1 downto 0);
        o_V             : out    vl_logic_vector(7 downto 0);
        o_spike         : out    vl_logic
    );
end top_unit;
