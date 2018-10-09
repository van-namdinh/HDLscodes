library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use ieee.std_logic_signed.all;
use work.conf.all;
entity LIF_CORE is

    port (
        i_clk             : in  std_logic;
        i_rst             : in  std_logic;
        i_spike           : in  std_logic_vector(LIF_IN_SPIKE_NUM-1 downto 0);
        i_synaptic_weight : in  std_logic_vector(LIF_IN_SPIKE_NUM*LIF_BITWIDTH-1 downto 0);
        i_lambda          : in  std_logic_vector(LIF_BITWIDTH-1 downto 0);
        i_alpha           : in  std_logic_vector(LIF_BITWIDTH-1 downto 0);
        o_prn             : out std_logic_vector(LIF_BITWIDTH-1 downto 0);
        o_spike           : out std_logic;
        o_vout            : out std_logic_vector(LIF_BITWIDTH-1 downto 0)
    );
end entity LIF_CORE;

architecture behavioral of LIF_CORE is
    signal post_synp_int : std_logic_vector(LIF_IN_SPIKE_NUM*LIF_BITWIDTH-1 downto 0);
    signal si_to_add     : std_logic_vector(LIF_BITWIDTH-1 downto 0);
    signal trigger_spike : std_logic;
    type array1 is array (0 to LIF_BITWIDTH/2-1) of std_logic_vector (LIF_BITWIDTH-1 downto 0);
    type array2 is array (0 to LIF_BITWIDTH/4-1) of std_logic_vector (LIF_BITWIDTH-1 downto 0);
    signal si_to_add_level_0 : array1;
    signal si_to_add_level_1 : array2;
    signal sub_to_com        : std_logic_vector (LIF_BITWIDTH-1 downto 0);
    signal i_lfsr_en         : std_logic                                 := '1';
    signal i_lfsr_seed_dv    : std_logic                                 := '0';
    signal i_lfsr_seed_data  : std_logic_vector(LIF_BITWIDTH-1 downto 0) := (others => '0');
    signal o_lfsr_done       : std_logic;
begin
    G1 : for i in 0 to LIF_IN_SPIKE_NUM-1 generate
        with i_spike(i) select
        post_synp_int((i+1) * LIF_BITWIDTH -1 downto LIF_BITWIDTH*i) <=
            i_synaptic_weight((i+1)*LIF_BITWIDTH-1 downto LIF_BITWIDTH*i) when '1',
            (others => '0')                                               when others;
    end generate;

    si_to_add_level_0(0) <= post_synp_int(15 downto 8)+ post_synp_int(7 downto 0);
    si_to_add_level_0(1) <= post_synp_int(31 downto 24)+ post_synp_int(23 downto 16);
    si_to_add_level_0(2) <= post_synp_int(47 downto 40)+ post_synp_int(39 downto 32);
    si_to_add_level_0(3) <= post_synp_int(63 downto 56)+ post_synp_int(55 downto 48);

    si_to_add_level_1(0) <= si_to_add_level_0(1)+si_to_add_level_0(0);
    si_to_add_level_1(1) <= si_to_add_level_0(3)+si_to_add_level_0(2);

    si_to_add <= si_to_add_level_1(1)+si_to_add_level_1(0);
    synaptic_integration_and_leak : process(all)
        variable add_to_sub : std_logic_vector (LIF_BITWIDTH-1 downto 0) := (others => '0');
        variable temp       : std_logic_vector (LIF_BITWIDTH-1 downto 0) := (others => '0');
    begin
        add_to_sub := o_vout + si_to_add;
        temp       := add_to_sub - i_lambda;
        sub_to_com <= temp;
    end process;

    trigger_spike <= '1' when (sub_to_com>=i_alpha) else
        '0';
    spike_process : process(i_clk,i_rst)
    begin
        if (i_rst) then
            o_spike <= '0';
            o_vout  <= V_REST;
        elsif (i_clk'event and i_clk='1') then

            if (trigger_spike) then
                o_spike <= '1';
                o_vout  <= V_REST;
            elsif (sub_to_com>=V_REST) then
                o_spike <= '0';
                o_vout  <= sub_to_com;
            end if;
        end if;

    end process;

    LFSR1 : LFSR
        port map (i_Clk => i_clk,
            i_Enable    => i_lfsr_en,
            i_Seed_DV   => i_lfsr_seed_dv,
            i_Seed_Data => i_lfsr_seed_data,
            o_LFSR_Data => o_prn,
            o_LFSR_Done => o_lfsr_done);

end architecture behavioral;