library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.conf.all;

entity tb_spike_controller_unit is
end tb_spike_controller_unit;

architecture tb of tb_spike_controller_unit is

    component spike_controller_unit
        port (i_clk       : in std_logic;
              i_rst       : in std_logic;
              i_spike_en        : in std_logic;
              i_spike_num : in std_logic_vector (bitwidth-1 downto 0);
              o_spike_en  : out std_logic;
              o_leak_en   : out std_logic);
    end component;

    signal i_clk       : std_logic;
    signal i_rst       : std_logic;
    signal i_spike_en        : std_logic;
    signal i_spike_num : std_logic_vector (bitwidth-1 downto 0);
    signal o_spike_en  : std_logic;
    signal o_leak_en   : std_logic;

    constant TbPeriod : time := 100 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : spike_controller_unit
    port map (i_clk       => i_clk,
              i_rst       => i_rst,
              i_spike_en  => i_spike_en,
              i_spike_num => i_spike_num,
              o_spike_en  => o_spike_en,
              o_leak_en   => o_leak_en);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that i_clk is really your main clock signal
    i_clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        i_spike_en <= '0';
        i_spike_num <= (others => '0');


        -- Reset generation
        -- EDIT: Check that i_rst is really your reset signal
        i_rst <= '1';
        wait until (rising_edge(i_clk));
        i_rst <= '0';
        wait until (rising_edge(i_clk));

        -- EDIT Add stimuli here
        i_spike_en<='1';
        i_spike_num <= "00001010";
        wait until (rising_edge(i_clk));
        i_spike_en <= '0';
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_spike_controller_unit of tb_spike_controller_unit is
    for tb
    end for;
end cfg_tb_spike_controller_unit;