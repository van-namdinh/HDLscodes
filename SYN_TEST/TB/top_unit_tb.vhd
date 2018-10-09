-- Testbench automatically generated online
-- at http://vhdl.lapinoo.net
-- Generation date : 31.7.2018 07:07:24 GMT

library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.conf.all;

entity tb_top_unit is
end tb_top_unit;

architecture tb of tb_top_unit is

  component top_unit
    port ( i_clk : in std_logic;
      i_rst                : in  std_logic;
      i_lfsr_en            : in  std_logic;
      i_Seed_DV            : in  std_logic;
      i_Seed_Data          : in  std_logic_vector(BITWIDTH-1 downto 0);
      i_leak_weight        : in  std_logic_vector(BITWIDTH-1 downto 0);
      i_leak_mode_sel      : in  std_logic;
      i_syn_weight         : in  std_logic_vector(4*BITWIDTH-1 downto 0);
      i_G                  : in  std_logic_vector(1 downto 0);
      i_syn_mode_sel       : in  std_logic;
      i_leak_reversal_mode : in  std_logic;
      i_spike_num          : in  std_logic_vector(BITWIDTH-1 downto 0);
      i_tick_start         : in  std_logic;
      i_V                  : in  std_logic_vector(BITWIDTH-1 downto 0);
      i_M                  : in  std_logic_vector(BITWIDTH-1 downto 0);
      i_alpha              : in  std_logic_vector(BITWIDTH-1 downto 0);
      i_beta               : in  std_logic_vector(BITWIDTH-1 downto 0);
      i_V_reset            : in  std_logic_vector(BITWIDTH-1 downto 0);
      i_kappa              : in  std_logic;
      i_gamma              : in  std_logic_vector (1 downto 0);
      o_V                  : out std_logic_vector(BITWIDTH-1 downto 0);
      o_spike              : out std_logic);
  end component;

  signal i_clk                : std_logic;
  signal i_rst                : std_logic;
  signal i_lfsr_en            : std_logic;
  signal i_Seed_DV            : std_logic;
  signal i_Seed_Data          : std_logic_vector (bitwidth-1 downto 0);
  signal i_leak_weight        : std_logic_vector (bitwidth-1 downto 0);
  signal i_leak_mode_sel      : std_logic;
  signal i_syn_weight         : std_logic_vector(4*BITWIDTH-1 downto 0);
  signal i_G                  : std_logic_vector (1 downto 0);
  signal i_syn_mode_sel       : std_logic;
  signal i_leak_reversal_mode : std_logic;
  signal i_spike_num          : std_logic_vector(BITWIDTH-1 downto 0);
  signal i_tick_start         : std_logic;
  signal i_V                  : std_logic_vector (bitwidth-1 downto 0);
  signal i_M                  : std_logic_vector (bitwidth-1 downto 0);
  signal i_alpha              : std_logic_vector (bitwidth-1 downto 0);
  signal i_beta               : std_logic_vector (bitwidth-1 downto 0);
  signal i_V_reset            : std_logic_vector (bitwidth-1 downto 0);
  signal i_kappa              : std_logic;
  signal i_gamma              : std_logic_vector (1 downto 0);
  signal o_V                  : std_logic_vector (bitwidth-1 downto 0);
  signal o_spike              : std_logic;

  constant TbPeriod : time      := 10 ns; -- EDIT Put right period here
  signal TbClock    : std_logic := '0';
  signal TbSimEnded : std_logic := '0';


begin


  dut : top_unit
    port map (i_clk => i_clk,
      i_rst                => i_rst,
      i_lfsr_en            => i_lfsr_en,
      i_Seed_DV            => i_Seed_DV,
      i_Seed_Data          => i_Seed_Data,
      i_leak_weight        => i_leak_weight,
      i_leak_mode_sel      => i_leak_mode_sel,
      i_syn_weight         => i_syn_weight,
      i_G                  => i_G,
      i_syn_mode_sel       => i_syn_mode_sel,
      i_leak_reversal_mode => i_leak_reversal_mode,
      i_spike_num          => i_spike_num,
      i_tick_start         => i_tick_start,
      i_V                  => i_V,
      i_M                  => i_M,
      i_alpha              => i_alpha,
      i_beta               => i_beta,
      i_V_reset            => i_V_reset,
      i_kappa              => i_kappa,
      i_gamma              => i_gamma,
      o_V                  => o_V,
      o_spike              => o_spike);

  -- Clock generation
  TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

  -- EDIT: Check that i_clk is really your main clock signal
  i_clk <= TbClock;

  stimuli : process
  begin
    -- EDIT Adapt initialization as needed
    i_lfsr_en            <= '0';
    i_Seed_DV            <= '0';
    i_Seed_Data          <= (others => '0');
    i_leak_weight        <= (others => '0');
    i_leak_mode_sel      <= '0';
    i_syn_weight         <= ("00000100000101000000000000000000");
    i_G                  <= (others => '0');
    i_syn_mode_sel       <= '0';
    i_leak_reversal_mode <= '0';
    i_spike_num          <= (others => '0');
    i_tick_start         <= '0';
    i_V                  <= (others => '0');
    i_M                  <= (others => '0');
    i_alpha              <= (others => '0');
    i_beta               <= (others => '0');
    i_V_reset            <= (others => '0');
    i_kappa              <= '0';
    i_gamma              <= (others => '0');

    -- Reset generation
    -- EDIT: Check that i_rst is really your reset signal
    i_rst <= '1';
    wait for 2*TbPeriod;
    wait until falling_edge(i_clk);

    i_rst <= '0';

    ---------------------------------------------------------------------------------
    i_lfsr_en            <= '1';
    i_leak_weight        <= "00000010";
    i_leak_mode_sel      <= '0';
    i_syn_mode_sel       <= '0';
    i_leak_reversal_mode <= '1';
    i_spike_num          <= "00001010";
    i_V                  <= "00001011";--10
    i_M                  <= "00000000";
    i_alpha              <= "00000010";
    i_beta               <= "00001010";
    i_V_reset            <= "11110001";
    i_kappa              <= '1';
    i_gamma              <= "00";
    wait until rising_edge(i_clk);
    i_tick_start <= '1';
    wait until rising_edge(i_clk);
    i_tick_start <= '0';


    -- EDIT Add stimuli here
    wait for 100* TbPeriod;

    -- Stop the clock and hence terminate the simulation
    TbSimEnded <= '1';
    wait;
  end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_top_unit of tb_top_unit is
  for tb
end for;
end cfg_tb_top_unit;
