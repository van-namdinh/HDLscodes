library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mux_comb_v2_tb is
end;

architecture bench of mux_comb_v2_tb is

  component mux_comb_v2
      port(
      sel     : in    std_logic;
      a,b     : in    std_logic_vector(3 downto 0);
      y       : out   std_logic_vector(3 downto 0)
      );
  end component;

  signal sel: std_logic;
  signal a,b: std_logic_vector(3 downto 0);
  signal y: std_logic_vector(3 downto 0) ;

begin

  uut: mux_comb_v2 port map ( sel => sel,
                              a   => a,
                              b   => b,
                              y   => y );

  stimulus: process
  begin
  
    -- Put initialisation code here
    wait for 100 ns;
    sel <= '0';
    a <= "0001";
    b <= "0010";
    wait for 100 ns;

    sel <= '1';
    a <= "0001";
    b <= "0010";
    wait for 100 ns;

    sel <= '0';
    a <= "0101";
    b <= "0110";
    wait for 100 ns;

    sel <= '1';
    a <= "0101";
    b <= "0110";
    wait for 100 ns;

    sel <= '0';
    a <= "0111";
    b <= "0010";
    wait for 100 ns;

    -- Put test bench stimulus code here

    wait;
  end process;


end;
