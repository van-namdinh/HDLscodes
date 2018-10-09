library verilog;
use verilog.vl_types.all;
entity LFSR_g_Num_Bits8_0 is
    port(
        i_Clk           : in     vl_logic;
        i_Enable        : in     vl_logic;
        i_rst           : in     vl_logic;
        i_Seed_DV       : in     vl_logic;
        i_Seed_Data     : in     vl_logic_vector(7 downto 0);
        o_LFSR_Data     : out    vl_logic_vector(7 downto 0)
    );
end LFSR_g_Num_Bits8_0;
