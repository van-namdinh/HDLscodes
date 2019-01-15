library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mux41_v1_tb is
end;

architecture bench of mux41_v1_tb is

  component mux41_v1
      port(
      i_d0, i_d1, i_d2, i_d3  : in    std_logic_vector(7 downto 0);
      i_sel                   : in    std_logic_vector(1 downto 0);
      o_data                  : out   std_logic_vector(7 downto 0)
      );
  end component;

  signal i_d0, i_d1, i_d2, i_d3: std_logic_vector(7 downto 0);
  signal i_sel: std_logic_vector(1 downto 0);
  signal o_data: std_logic_vector(7 downto 0) ;

begin

  uut: mux41_v1 port map ( i_d0   => i_d0,
                           i_d1   => i_d1,
                           i_d2   => i_d2,
                           i_d3   => i_d3,
                           i_sel  => i_sel,
                           o_data => o_data );

  stimulus: process
  begin
  
    -- Put initialisation code here
    i_d0 <= "01010101";
    i_d1 <= "10101010";
    i_d2 <= "11001100";
    i_d3 <= "00110011";
    wait for 100 ns;
    i_sel <= "00";
    wait for 100 ns;
    i_sel <= "01";
    wait for 100 ns;
    i_sel <= "10";
    wait for 100 ns;
    i_sel <= "11";
    wait for 100 ns;

    wait for 100 ns;
    i_sel <= "11";
    wait for 100 ns;
    i_sel <= "10";
    wait for 100 ns;
    i_sel <= "01";
    wait for 100 ns;
    i_sel <= "00";
    -- Put test bench stimulus code here

    wait;
  end process;


end;
