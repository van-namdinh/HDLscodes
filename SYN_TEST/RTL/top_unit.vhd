library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.conf.all;

entity top_unit is
  port (
    i_clk                : in  std_logic;
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
    o_spike              : out std_logic
  );
end entity top_unit;

architecture top_unit_arc of top_unit is

  component LFSR is
    generic (
      g_Num_Bits : integer := 8
    );
    port (
      i_Clk    : in std_logic;
      i_rst    : in std_logic;
      i_Enable : in std_logic;

      -- Optional Seed Value
      i_Seed_DV   : in std_logic;
      i_Seed_Data : in std_logic_vector(g_Num_Bits-1 downto 0);

      o_LFSR_Data : out std_logic_vector(g_Num_Bits-1 downto 0)
      --o_LFSR_Done : out std_logic
    );
  end component LFSR;

  component leak_unit is
    port (
      i_leak_weight : in  std_logic_vector(BITWIDTH-1 downto 0);
      i_leak_prn    : in  std_logic_vector(BITWIDTH-1 downto 0);
      i_mode_sel    : in  std_logic;
      o_leak_weight : out std_logic_vector(BITWIDTH-1 downto 0)
    );
  end component leak_unit;

  component leak_reversal_unit is
    port (
      i_leak_weight : in  std_logic_vector(BITWIDTH-1 downto 0);
      i_V           : in  std_logic_vector(BITWIDTH-1 downto 0);
      i_mode_sel    : in  std_logic;
      o_leak_weight : out std_logic_vector(BITWIDTH-1 downto 0)
    );
  end component leak_reversal_unit;
  component synapse_unit is
    port (
      i_syn_weight : in  std_logic_vector(4*BITWIDTH-1 downto 0);
      i_G          : in  std_logic_vector(1 downto 0);
      i_syn_prn    : in  std_logic_vector(BITWIDTH-1 downto 0);
      i_mode_sel   : in  std_logic;
      o_syn_weight : out std_logic_vector(BITWIDTH-1 downto 0)
    );
  end component synapse_unit;

  component integrator_unit is
    port (
      i_clk         : in  std_logic;
      i_rst         : in  std_logic;
      i_V           : in  std_logic_vector(BITWIDTH-1 downto 0);
      i_syn_weight  : in  std_logic_vector(BITWIDTH-1 downto 0);
      i_leak_weight : in  std_logic_vector(BITWIDTH-1 downto 0);
      i_spike_en    : in  std_logic;
      i_leak_en     : in  std_logic;
      o_V           : out std_logic_vector(BITWIDTH-1 downto 0);
      o_V_valid     : out std_logic
    );
  end component integrator_unit;

  component threshold_reset_unit is
    port (
      i_V_valid    : in  std_logic;
      i_V          : in  std_logic_vector(BITWIDTH-1 downto 0);
      i_thresh_prn : in  std_logic_vector(BITWIDTH-1 downto 0);
      i_M          : in  std_logic_vector(BITWIDTH-1 downto 0);
      i_alpha      : in  std_logic_vector(BITWIDTH-1 downto 0);
      i_beta       : in  std_logic_vector(BITWIDTH-1 downto 0);
      i_V_reset    : in  std_logic_vector(BITWIDTH-1 downto 0);
      i_kappa      : in  std_logic;
      i_gamma      : in  std_logic_vector(1 downto 0);
      o_V          : out std_logic_vector(BITWIDTH-1 downto 0);
      o_spike      : out std_logic
    );
  end component threshold_reset_unit;

  component spike_controller_unit is
    port (
      i_clk       : in  std_logic;
      i_rst       : in  std_logic;
      i_spike_en  : in  std_logic;
      i_spike_num : in  std_logic_vector (BITWIDTH-1 downto 0);
      o_spike_en  : out std_logic;
      o_leak_en   : out std_logic
    );
      end component spike_controller_unit;
      signal leak_prn      : std_logic_vector(BITWIDTH-1 downto 0);
      signal syn_prn       : std_logic_vector(BITWIDTH-1 downto 0);
      signal reset_prn     : std_logic_vector(BITWIDTH-1 downto 0);
      signal spike_en      : std_logic;
      signal leak_en       : std_logic;
      signal leak_weight   : std_logic_vector(BITWIDTH-1 downto 0);
      signal syn_weight    : std_logic_vector(BITWIDTH-1 downto 0);
      signal leak_weight_r : std_logic_vector(BITWIDTH-1 downto 0);
      signal V_valid       : std_logic;
      signal V_net         : std_logic_vector(BITWIDTH-1 downto 0);

      constant c_NUM_BITS : integer := 8;

    begin

      LFSR1 : LFSR
        generic map (
      g_Num_Bits => c_NUM_BITS)
        port map (i_Clk => i_clk,
      i_rst       => i_rst,
      i_Enable    => i_lfsr_en,
      i_Seed_DV   => i_Seed_DV,
      i_Seed_Data => i_Seed_Data,
      o_LFSR_Data => leak_prn
      );

      LFSR2 : LFSR
        generic map (
      g_Num_Bits => c_NUM_BITS)
        port map (i_Clk => i_clk,
      i_rst       => i_rst,
      i_Enable    => i_lfsr_en,
      i_Seed_DV   => i_Seed_DV,
      i_Seed_Data => i_Seed_Data,
      o_LFSR_Data => syn_prn
      );

      LFSR3 : LFSR
        generic map (
      g_Num_Bits => c_NUM_BITS)
        port map (i_Clk => i_clk,
      i_rst       => i_rst,
      i_Enable    => i_lfsr_en,
      i_Seed_DV   => i_Seed_DV,
      i_Seed_Data => i_Seed_Data,
      o_LFSR_Data => reset_prn
      );

      LEAK : leak_unit
        port map (
      i_leak_weight => i_leak_weight,
      i_leak_prn    => leak_prn,
      i_mode_sel    => i_leak_mode_sel,
      o_leak_weight => leak_weight
      );

      LEAK_REVERSAL : leak_reversal_unit
        port map (
      i_leak_weight => leak_weight,
      i_V           => i_V,
      i_mode_sel    => i_leak_reversal_mode,
      o_leak_weight => leak_weight_r
      );

      SYNAPSE : synapse_unit
        port map (
      i_syn_weight => i_syn_weight,
      i_G          => i_G,
      i_syn_prn    => syn_prn,
      i_mode_sel   => i_syn_mode_sel,
      o_syn_weight => syn_weight
      );

      INTEGRATOR : integrator_unit
        port map (
      i_clk         => i_clk,
      i_rst         => i_rst,
      i_V           => i_V,
      i_syn_weight  => syn_weight,
      i_leak_weight => leak_weight_r,
      i_spike_en    => spike_en,
      i_leak_en     => leak_en,
      o_V           => V_net,
      o_V_valid     => V_valid
      );

      RESET : threshold_reset_unit
        port map (
      i_V_valid    => V_valid,
      i_V          => V_net,
      i_thresh_prn => reset_prn,
      i_M          => i_M,
      i_alpha      => i_alpha,
      i_beta       => i_beta,
      i_V_reset    => i_V_reset,
      i_kappa      => i_kappa,
      i_gamma      => i_gamma,
      o_V          => o_V,
      o_spike      => o_spike
      );
      SPIKE_CONTROLLER : spike_controller_unit
        port map (
      i_clk       => i_clk,
      i_rst       => i_rst,
      i_spike_num => i_spike_num,
      i_spike_en  => i_tick_start,
      o_spike_en  => spike_en,
      o_leak_en   => leak_en
      );
      end architecture top_unit_arc;