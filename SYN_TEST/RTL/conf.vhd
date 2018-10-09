library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;

package conf is
    constant BITWIDTH     : integer                      := 8;
    --constant IN_SPIKE_NUM : integer                      := 8;
    --constant V_REST           : std_logic_vector(7 downto 0) := "00000010";
    type syn_weight_array is array (0 to 3) of std_logic_vector (BITWIDTH-1 downto 0);

    component LFSR is
        generic (
            g_Num_Bits : integer := BITWIDTH
            );
        port (
            i_Clk       : in  std_logic;
            i_Enable    : in  std_logic;
            i_Seed_DV   : in  std_logic;
            i_Seed_Data : in  std_logic_vector(g_Num_Bits-1 downto 0);
            o_LFSR_Data : out std_logic_vector(g_Num_Bits-1 downto 0);
            o_LFSR_Done : out std_logic
        );
    end component;
        --function binary_comparison(signal s,p : std_logic_vector) return std_logic_vector;
        --function signum (signal s             : std_logic_vector) return std_logic_vector;
        --function delta_function(signal s      : std_logic_vector) return std_logic_vector;

end package conf;

        --package body conf is
        --    function binary_comparison (signal s,p : std_logic_vector) return std_logic_vector is
        --    begin
        --        if (ABS(s)>=p) then
        --            return conv_std_logic_vector(1,BITWIDTH);
        --        else
        --            return conv_std_logic_vector(0,BITWIDTH);
        --        end if;
        --    end binary_comparison;

        --    function signum (signal s : std_logic_vector) return std_logic_vector is
        --    begin
        --        if (s=0) then
        --            return conv_std_logic_vector(1,BITWIDTH);
        --        else
        --            if (s(BITWIDTH-1) = '1') then
        --                return conv_std_logic_vector(-1,BITWIDTH);
        --            else
        --                return conv_std_logic_vector(1,BITWIDTH);
        --            end if;

        --        end if;
        --    end signum;

        --    function delta_function(signal s : std_logic_vector) return std_logic_vector is
        --    begin
        --        if (s=0) then
        --            return conv_std_logic_vector(1, BITWIDTH);
        --        else
        --            return conv_std_logic_vector(0, BITWIDTH);
        --        end if;
        --    end delta_function;

        --end conf;