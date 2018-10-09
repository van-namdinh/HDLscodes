library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.conf.all;

entity synapse_unit is
    port (
        i_syn_weight : in  std_logic_vector(4*BITWIDTH-1 downto 0);
        i_G          : in  std_logic_vector(1 downto 0);
        i_syn_prn    : in  std_logic_vector(BITWIDTH-1 downto 0);
        i_mode_sel   : in  std_logic;
        o_syn_weight : out std_logic_vector(BITWIDTH-1 downto 0)
    );
end entity synapse_unit;

architecture synapse_unit_arch of synapse_unit is
signal selected_syn_weight : std_logic_vector(BITWIDTH-1 downto 0);
begin

    synapse : process (all)
    begin

            case (i_G) is
                when "00"   => selected_syn_weight <= i_syn_weight(4*BITWIDTH-1 downto 3*BITWIDTH);
                when "01"   => selected_syn_weight <= i_syn_weight(3*BITWIDTH-1 downto 2*BITWIDTH);
                when "10"   => selected_syn_weight <= i_syn_weight(2*BITWIDTH-1 downto BITWIDTH);
                when others => selected_syn_weight <= i_syn_weight(BITWIDTH-1 downto 0);
            end case;

            if (i_mode_sel='0') then
                 o_syn_weight <= selected_syn_weight;
            else
                 if (ABS(SIGNED(selected_syn_weight))>=UNSIGNED(i_syn_prn)) then
                    if (selected_syn_weight(BITWIDTH-1)='1') then
                        o_syn_weight <= (others => '1');
                    else
                        o_syn_weight <= (0=>'1',others => '0');
                    end if;
                 else
                    o_syn_weight <= (others => '0');
                 end if;
            end if;
    end process;

end architecture synapse_unit_arch;