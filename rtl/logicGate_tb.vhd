library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity logicGate_tb is
end;

architecture bench of logicGate_tb is

  component logicGate
      port(
          in1, in2    : in std_logic_vector(3 downto 0);
          and2, or2, xor2     : out std_logic_vector(3 downto 0)
      );
  end component;

  signal in1, in2: std_logic_vector(3 downto 0);
  signal and2, or2, xor2: std_logic_vector(3 downto 0);

begin

  uut: logicGate port map ( in1  => in1,
                            in2  => in2,
                            and2 => and2,
                            or2  => or2,
                            xor2 => xor2 );

  stimulus: process
  begin
  
    -- Put initialisation code here
    in1 <= "0000";
    in2 <= "0000";
    wait for 100 ns;

    in1 <= "0000";
    in2 <= "1111";
    wait for 100 ns;
    in1 <= "1111";
    in2 <= "0000";
    wait for 100 ns;
    in1 <= "1111";
    in2 <= "1111";
    wait for 100 ns;

    in1 <= "0101";
    in2 <= "1010";
    wait for 100 ns;

    in1 <= "1001";
    in2 <= "1111";
    wait for 100 ns;
    in1 <= "1011";
    in2 <= "0110";
    wait for 100 ns;
    in1 <= "1101";
    in2 <= "1001";
    wait for 100 ns;
    in1 <= "0110";
    in2 <= "0001";
    wait for 100 ns;

    in1 <= "1000";
    in2 <= "1111";
    wait for 100 ns;
    in1 <= "0110";
    in2 <= "0101";
    wait for 100 ns;
    in1 <= "1100";
    in2 <= "1010";
    wait for 100 ns;
    -- Put test bench stimulus code here

    wait;
  end process;


end;
