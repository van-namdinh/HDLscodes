library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.conf.all;

entity integrator_unit is
    port (
        i_clk        : in  std_logic;
        i_rst        : in  std_logic;
        i_V          : in  std_logic_vector(BITWIDTH-1 downto 0);
        i_syn_weight : in  std_logic_vector(BITWIDTH-1 downto 0);
        i_leak_weight: in  std_logic_vector(BITWIDTH-1 downto 0);
        i_spike_en   : in  std_logic;
        i_leak_en    : in std_logic;
        o_V          : buffer std_logic_vector(BITWIDTH-1 downto 0);
        o_V_valid    : out std_logic
    );
end integrator_unit;
architecture integrator_unit_arc of integrator_unit is

    signal o_V_net : std_logic_vector(BITWIDTH-1 downto 0);
    signal sum : std_logic_vector(BITWIDTH-1 downto 0);


begin

    sum <= conv_std_logic_vector(SIGNED(i_syn_weight)+SIGNED(i_leak_weight), BITWIDTH);
    synaptic_integration : process(all)
    begin
        if (i_spike_en='1') then
            o_V_net <= conv_std_logic_vector(SIGNED(i_syn_weight), BITWIDTH) + o_V;
        elsif (i_leak_en='1') then
            o_V_net <= conv_std_logic_vector(SIGNED(i_leak_weight), BITWIDTH) + o_V;
        else
            o_V_net <= i_V;
        end if;
    end process ; -- synaptic_integration

    reg : process (i_rst, i_clk)
    begin
        if (i_rst = '1') then
            --    o_V_net <= (others => '0');
            o_V <= (others => '0');
            o_V_valid <= '0';
        elsif (rising_edge(i_clk)) then
            o_V <= o_V_net;
            o_V_valid <= i_leak_en;
        end if;
    end process reg;

end integrator_unit_arc;
