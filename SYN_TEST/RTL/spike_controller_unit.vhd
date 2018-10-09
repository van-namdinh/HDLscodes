library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.conf.all;

entity spike_controller_unit is
    port (
        i_clk       : in  std_logic;
        i_rst       : in  std_logic;
        i_spike_en  : in  std_logic;
        i_spike_num : in  std_logic_vector(BITWIDTH-1 downto 0);
        o_spike_en  : out std_logic;
        o_leak_en   : out std_logic
    );
end spike_controller_unit;

architecture spike_controller_unit_arch of spike_controller_unit is
    signal count_net : std_logic_vector(BITWIDTH-1 downto 0);


begin
    process(i_clk,i_rst)
    begin
        if (i_rst='1') then
            count_net <= (others => '1');
        elsif (rising_edge(i_clk)) then
            if (i_spike_en='1') then count_net <= i_spike_num;
            else
                count_net <= count_net-1;
            end if;
        end if;
    end process ; --
    compare_mag : process(i_spike_num, count_net )
    begin
        if (count_net <= i_spike_num) and (count_net>(BITWIDTH-1 downto 0 => '0')) then
            o_spike_en <= '1';
            o_leak_en  <= '0';
        elsif (count_net=0) then
            o_spike_en <= '0';
            o_leak_en  <= '1';
        else
            o_spike_en <= '0';
            o_leak_en  <= '0';
        end if;
    end process ; -- comparator


end architecture spike_controller_unit_arch;