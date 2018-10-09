


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use work.conf.all;
entity tb_LIF_CORE is
end tb_LIF_CORE;

architecture tb of tb_LIF_CORE is

    component LIF_CORE
        port (i_clk             : in std_logic;
              i_rst             : in std_logic;
              i_spike           : in std_logic_vector (LIF_IN_SPIKE_NUM-1 downto 0);
              i_synaptic_weight : in std_logic_vector (LIF_IN_SPIKE_NUM*LIF_BITWIDTH-1 downto 0);
              i_lambda          : in std_logic_vector (LIF_BITWIDTH-1 downto 0);
              i_alpha           : in std_logic_vector (LIF_BITWIDTH-1 downto 0);
              o_prn             : out std_logic_vector (LIF_BITWIDTH-1 downto 0);
              o_spike           : out std_logic;
              o_vout            : out std_logic_vector (LIF_BITWIDTH-1 downto 0));
    end component;

    signal i_clk             : std_logic;
    signal i_rst             : std_logic;
    signal i_spike           : std_logic_vector (LIF_IN_SPIKE_NUM-1 downto 0);
    signal i_synaptic_weight : std_logic_vector (LIF_IN_SPIKE_NUM*LIF_BITWIDTH-1 downto 0);
    signal i_lambda          : std_logic_vector (LIF_BITWIDTH-1 downto 0);
    signal i_alpha           : std_logic_vector (LIF_BITWIDTH-1 downto 0);
    signal o_prn             : std_logic_vector (LIF_BITWIDTH-1 downto 0);
    signal o_spike           : std_logic;
    signal o_vout            : std_logic_vector (LIF_BITWIDTH-1 downto 0);

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : LIF_CORE
    port map (i_clk             => i_clk,
              i_rst             => i_rst,
              i_spike           => i_spike,
              i_synaptic_weight => i_synaptic_weight,
              i_lambda          => i_lambda,
              i_alpha           => i_alpha,
              o_prn             => o_prn,
              o_spike           => o_spike,
              o_vout            => o_vout);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that i_clk is really your main clock signal
    i_clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        i_spike <= (others => '0');
        i_synaptic_weight <= (0 => '1',8 => '1',16 => '1',24 => '1',32 => '1',40 => '1',48 => '1',56 => '1',others => '0');
        i_lambda <= (0=>'1',others => '0');
        i_alpha <= "00001000";

        -- Reset generation
        -- EDIT: Check that i_rst is really your reset signal
        i_rst <= '1';
        wait for 3*TbPeriod/2;
        i_rst <= '0';
        wait for TbPeriod/2;
        test_loop : for i in 0 to 20 loop


        -- EDIT Add stimuli here
        i_spike(0) <= '1';
        wait for TbPeriod;
        i_spike(0) <= '0';
        i_spike(1) <= '1';
        wait for TbPeriod ;
        i_spike(1) <= '0';
        i_spike(2) <= '1';
        wait for TbPeriod ;
        i_spike(2) <= '0';
        i_spike(3) <= '1';
        i_spike(4) <= '1';
        wait for TbPeriod ;
        i_spike(3) <= '0';
        i_spike(5) <= '1';
        wait for TbPeriod ;
        i_spike(4) <= '0';
        i_spike(6) <= '1';
        wait for TbPeriod ;
        i_spike(5) <= '0';
        i_spike(7) <= '1';
        wait for TbPeriod ;
        i_spike(6) <= '0';
        i_spike(7) <= '1';
        wait for TbPeriod ;
        i_spike(7) <= '0';
        end loop ; -- test_loop
        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_LIF_CORE of tb_LIF_CORE is
    for tb
    end for;
end cfg_tb_LIF_CORE;