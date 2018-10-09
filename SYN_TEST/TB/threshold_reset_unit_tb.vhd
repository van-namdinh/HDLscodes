library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.conf.all;

entity tb_threshold_reset_unit is
end tb_threshold_reset_unit;

architecture tb of tb_threshold_reset_unit is

    component threshold_reset_unit
        port (
              i_V_valid    : in std_logic;
              i_V          : in std_logic_vector (BITWIDTH-1 downto 0);
              i_thresh_prn : in std_logic_vector (BITWIDTH-1 downto 0);
              i_M          : in std_logic_vector (BITWIDTH-1 downto 0);
              i_alpha      : in std_logic_vector (BITWIDTH-1 downto 0);
              i_beta       : in std_logic_vector (BITWIDTH-1 downto 0);
              i_V_reset    : in std_logic_vector (BITWIDTH-1 downto 0);
              i_kappa      : in std_logic;
              i_gamma      : in std_logic_vector (1 downto 0);
              o_V          : out std_logic_vector (BITWIDTH-1 downto 0);
              o_spike      : out std_logic);
    end component;
    signal i_V_valid    : std_logic;
    signal i_V          : std_logic_vector (BITWIDTH-1 downto 0);
    signal i_thresh_prn : std_logic_vector (BITWIDTH-1 downto 0);
    signal i_M          : std_logic_vector (BITWIDTH-1 downto 0);
    signal i_alpha      : std_logic_vector (BITWIDTH-1 downto 0);
    signal i_beta       : std_logic_vector (BITWIDTH-1 downto 0);
    signal i_V_reset    : std_logic_vector (BITWIDTH-1 downto 0);
    signal i_kappa      : std_logic;
    signal i_gamma      : std_logic_vector (1 downto 0);
    signal o_V          : std_logic_vector (BITWIDTH-1 downto 0);
    signal o_spike      : std_logic;

begin

    dut : threshold_reset_unit
    port map (i_V_valid    => i_V_valid,
              i_V          => i_V,
              i_thresh_prn => i_thresh_prn,
              i_M          => i_M,
              i_alpha      => i_alpha,
              i_beta       => i_beta,
              i_V_reset    => i_V_reset,
              i_kappa      => i_kappa,
              i_gamma      => i_gamma,
              o_V          => o_V,
              o_spike      => o_spike);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        i_V <= (others => '0');
        i_thresh_prn <= (others => '0');
        i_M <= (others => '0');
        i_alpha <= (others => '0');
        i_beta <= (others => '0');
        i_V_reset <= (others => '0');
        i_kappa <= '0';
        i_gamma <= (others => '0');
        i_V_valid <= '0';
        wait for 200 ns;
        -- EDIT Add stimuli here
        wait for 100 ns;
        i_thresh_prn <= "01111111";
        i_M <= "00010100";--Mask of 20
        i_alpha <= "01011010";--90
        i_beta <= "00101000";--40
        i_V_reset <= "00010100";--20
        i_kappa <= '1';
        i_gamma <= "01";
        i_V_valid <= '1';
        wait for 100 ns;
        i_V <= "01100100";--100
        wait for 100 ns;
        i_V <= "10100110";--(-90)
        wait for 100 ns;
        i_V <= "01111111";--127
        wait for 100 ns;
        i_V <= "11111011";
        i_V_valid <= '0';
        wait for 100 ns;
        i_V <= "01100100";--100
        wait for 100 ns;
        i_V <= "10100110";--(-90)
        wait for 100 ns;
        i_V <= "01111111";--127
        wait for 100 ns;
        i_V <= "11111011";
        wait for 100 ns;
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_threshold_reset_unit of tb_threshold_reset_unit is
    for tb
    end for;
end cfg_tb_threshold_reset_unit;