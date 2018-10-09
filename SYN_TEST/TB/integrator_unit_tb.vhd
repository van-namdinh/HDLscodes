library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.conf.all;

entity tb_integrator_unit is
end tb_integrator_unit;

architecture tb of tb_integrator_unit is

    component integrator_unit
        port (i_clk         : in std_logic;
              i_rst         : in std_logic;
              i_V           : in std_logic_vector (bitwidth-1 downto 0);
              i_syn_weight  : in std_logic_vector (bitwidth-1 downto 0);
              i_leak_weight : in std_logic_vector (bitwidth-1 downto 0);
              i_spike_en     : in  std_logic;
              i_leak_en     : in std_logic;
              o_V           : out std_logic_vector (bitwidth-1 downto 0);
              o_V_valid : out std_logic
              );

    end component;

    signal i_clk         : std_logic;
    signal i_rst         : std_logic;
    signal i_V           : std_logic_vector (bitwidth-1 downto 0);
    signal i_syn_weight  : std_logic_vector (bitwidth-1 downto 0);
    signal i_leak_weight : std_logic_vector (bitwidth-1 downto 0);
    signal i_spike_en    : std_logic;
    signal i_leak_en     : std_logic;
    signal o_V           : std_logic_vector (bitwidth-1 downto 0);
    signal o_V_valid     : std_logic;
    constant TbPeriod : time := 2000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : integrator_unit
    port map (i_clk         => i_clk,
              i_rst         => i_rst,
              i_V           => i_V,
              i_syn_weight  => i_syn_weight,
              i_leak_weight => i_leak_weight,
              i_spike_en    => i_spike_en,
              i_leak_en     => i_leak_en,
              o_V           => o_V,
              o_V_valid     => o_V_valid);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that i_clk is really your main clock signal
    i_clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        i_V <= (others => '0');
        i_syn_weight <= (others => '0');
        i_leak_weight <= (others => '0');
        i_spike_en <= '0';
        i_leak_en <= '0';
        -- Reset generation
        -- EDIT: Check that i_rst is really your reset signal
        i_rst <= '1';
        wait for 6000 ns;
        i_rst <= '0';
        wait for 2000 ns;
        i_V  <=  conv_std_logic_vector(10,bitwidth);
        i_spike_en <= '0';
        --i_V  <=  conv_std_logic_vector(10,bitwidth);
        i_syn_weight <= conv_std_logic_vector(2, bitwidth);
        i_leak_weight <= conv_std_logic_vector(1,bitwidth);
        wait until falling_edge (i_clk);

        i_spike_en <= '1';
        wait for 9*TbPeriod;
        wait until falling_edge (i_clk);
        i_spike_en <= '0';
        i_leak_en <= '1';
        wait until falling_edge (i_clk);
        i_leak_en <= '0';
        wait for 10*TbPeriod;
        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_integrator_unit of tb_integrator_unit is
    for tb
    end for;
end cfg_tb_integrator_unit;
