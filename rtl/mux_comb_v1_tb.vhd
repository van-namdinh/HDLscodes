library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mux_comb_tb is
end;

architecture bench of mux_comb_tb is

  component mux_comb
      port(
          d0      : in std_logic;
          d1      : in std_logic;
          s       : in std_logic;
          y       : out std_logic
      );
  end component;

  signal d0: std_logic;
  signal d1: std_logic;
  signal s: std_logic;
  signal y: std_logic ;

begin

  uut: mux_comb port map ( d0 => d0,
                           d1 => d1,
                           s  => s,
                           y  => y );

  stimulus: process
  begin
  
    -- Put initialisation code here
    d0 <= '0';
    d1 <= '0';
    s <= '0';
    wait for 100 ns;

    d0 <= '0';
    d1 <= '0';
    s <= '1';
    wait for 100 ns;
    d0 <= '0';
    d1 <= '1';
    s <= '0';
    wait for 100 ns;
    d0 <= '0';
    d1 <= '1';
    s <= '1';
    wait for 100 ns;
    d0 <= '1';
    d1 <= '0';
    s <= '0';
    wait for 100 ns;
    d0 <= '1';
    d1 <= '0';
    s <= '1';
    wait for 100 ns;
    d0 <= '1';
    d1 <= '1';
    s <= '0';
    wait for 100 ns;
    d0 <= '1';
    d1 <= '1';
    s <= '1';
    wait for 100 ns;
    -- Put test bench stimulus code here

    wait;
  end process;


end;
