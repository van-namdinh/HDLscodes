-- Testbench automatically generated online
-- at http://vhdl.lapinoo.net
-- Generation date : 13.4.2018 07:11:39 GMT

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use work.conf.all;

entity LFSR_TB is
end LFSR_TB;

architecture tb of LFSR_TB is

    component LFSR
        generic (
               g_Num_Bits : integer := 5
                );
        port (i_Clk       : in std_logic;
              i_Enable    : in std_logic;
              i_Seed_DV   : in std_logic;
              i_Seed_Data : in std_logic_vector (g_num_bits-1 downto 0);
              o_LFSR_Data : out std_logic_vector (g_num_bits-1 downto 0);
              o_LFSR_Done : out std_logic);
    end component;

    constant c_NUM_BITS : integer := 8;
    constant c_CLK_PERIOD : time := 40 ns;  -- 25 MHz
    signal i_Clk       : std_logic;
    signal i_Enable    : std_logic;
    signal i_Seed_DV   : std_logic;
    signal i_Seed_Data : std_logic_vector (c_num_bits-1 downto 0);
    signal o_LFSR_Data : std_logic_vector (c_num_bits-1 downto 0);
    --signal o_LFSR_Done : std_logic;
    constant TbPeriod : time := 40 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    LFSR1 : LFSR
    generic map (
      g_Num_Bits => c_NUM_BITS)
    port map (i_Clk       => i_Clk,
              i_Enable    => i_Enable,
              i_Seed_DV   => i_Seed_DV,
              i_Seed_Data => i_Seed_Data,
              o_LFSR_Data => o_LFSR_Data);
              --o_LFSR_Done => o_LFSR_Done);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that i_Clk is really your main clock signal
    i_Clk <= TbClock;

    stimuli : process

    begin
        -- EDIT Adapt initialization as needed
        i_Enable <= '1';
        i_Seed_DV <= '0';
        i_Seed_Data <= (others => '0');


        -- EDIT Add stimuli here
        wait for 500 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;