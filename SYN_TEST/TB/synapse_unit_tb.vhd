library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.conf.all;

entity tb_synapse_unit is
end tb_synapse_unit;

architecture tb of tb_synapse_unit is

    component synapse_unit
        port (
              i_syn_weight : in std_logic_vector(4*BITWIDTH-1 downto 0);
              i_G          : in std_logic_vector (1 downto 0);
              i_syn_prn    : in std_logic_vector (bitwidth-1 downto 0);
              i_mode_sel   : in std_logic;
              o_syn_weight : out std_logic_vector (bitwidth-1 downto 0));
    end component;


    signal i_syn_weight : std_logic_vector(4*BITWIDTH-1 downto 0);
    signal i_G          : std_logic_vector (1 downto 0);
    signal i_syn_prn    : std_logic_vector (bitwidth-1 downto 0);
    signal i_mode_sel   : std_logic;
    signal o_syn_weight : std_logic_vector (bitwidth-1 downto 0);

begin

    dut : synapse_unit
    port map (
              i_syn_weight => i_syn_weight,
              i_G          => i_G,
              i_syn_prn    => i_syn_prn,
              i_mode_sel   => i_mode_sel,
              o_syn_weight => o_syn_weight);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed

        i_syn_weight <= ("10010001000011110000100100000111");
        i_G <= (others => '0');
        i_syn_prn <= (others => '0');
        i_mode_sel <= '0';

        -- EDIT Add stimuli here
        wait for 100 ns;
        i_G <= "00";
        wait for 100 ns;
        i_G <= "01";
        i_mode_sel <= '1';
        i_syn_prn <= "11110001";
        wait for 100 ns;
        i_syn_prn <= conv_std_logic_vector(14,bitwidth);
        wait for 100 ns;
        i_G <= "00";
        wait for 100 ns;
        i_G <= "11";
        i_mode_sel <= '0';
        wait for 100 ns;
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_synapse_unit of tb_synapse_unit is
    for tb
    end for;
end cfg_tb_synapse_unit;
