library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.conf.all;

entity tb_leak_reversal_unit is
end tb_leak_reversal_unit;

architecture tb of tb_leak_reversal_unit is

    component leak_reversal_unit
        port (i_leak_weight : in std_logic_vector (bitwidth-1 downto 0);
              i_V           : in std_logic_vector (bitwidth-1 downto 0);
              i_mode_sel    : in std_logic;
              o_leak_weight : out std_logic_vector (bitwidth-1 downto 0));
    end component;

    signal i_leak_weight : std_logic_vector (bitwidth-1 downto 0);
    signal i_V           : std_logic_vector (bitwidth-1 downto 0);
    signal i_mode_sel    : std_logic;
    signal o_leak_weight : std_logic_vector (bitwidth-1 downto 0);

begin

    dut : leak_reversal_unit
    port map (i_leak_weight => i_leak_weight,
              i_V           => i_V,
              i_mode_sel    => i_mode_sel,
              o_leak_weight => o_leak_weight);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        i_leak_weight <= (others => '0');
        i_V <= (others => '0');
        i_mode_sel <= '0';

        -- EDIT Add stimuli here
        wait for 100 ns;
        i_V  <= "00001111";
        i_mode_sel  <= '0';
        i_leak_weight <= "11110001";
        wait for 100 ns;
        i_V <= "11110000";
        i_mode_sel <= '1';
        i_leak_weight <= "01110001";
        wait for 100 ns;
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_leak_reversal_unit of tb_leak_reversal_unit is
    for tb
    end for;
end cfg_tb_leak_reversal_unit;