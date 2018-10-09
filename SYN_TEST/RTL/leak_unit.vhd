library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.conf.all;
entity leak_unit is
    port (
        i_leak_weight : in  std_logic_vector(BITWIDTH-1 downto 0);
        i_leak_prn    : in  std_logic_vector(BITWIDTH-1 downto 0);
        i_mode_sel    : in  std_logic;
        o_leak_weight : out std_logic_vector(BITWIDTH-1 downto 0)
    );
end entity leak_unit;

architecture leak_unit_arc of leak_unit is

begin
    leak : process( all )
    begin
        if (i_mode_sel='0') then
            o_leak_weight <= i_leak_weight;
        else
            if (ABS(SIGNED(i_leak_weight))>=UNSIGNED(i_leak_prn)) then
                if (i_leak_weight(BITWIDTH-1)='1') then
                    o_leak_weight <= (others => '1');
                else
                    o_leak_weight <= (0 => '1',others => '0');
                end if;
            else
                o_leak_weight <= (others => '0');
            end if;
        end if;
    end process ; -- leak
end leak_unit_arc;