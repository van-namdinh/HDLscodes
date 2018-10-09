library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.conf.all;

entity leak_reversal_unit is
    port (
        i_leak_weight : in std_logic_vector(BITWIDTH-1 downto 0);
        i_V           : in std_logic_vector(BITWIDTH-1 downto 0);
        i_mode_sel   : in std_logic;
        o_leak_weight : out std_logic_vector(BITWIDTH-1 downto 0)
    );

end entity leak_reversal_unit;

architecture leak_reversal_arc of leak_reversal_unit is

begin
    leak_reversal : process(all )
    begin
        if (i_mode_sel='0') then
            o_leak_weight <= i_leak_weight;
        else
            if (i_V(BITWIDTH-1)='0') then
                o_leak_weight <= i_leak_weight;
            else
                o_leak_weight <= conv_std_logic_vector(
                                    0-signed(i_leak_weight),BITWIDTH);
            end if;
        end if;
    end process ; -- leak_reversal
end leak_reversal_arc;
