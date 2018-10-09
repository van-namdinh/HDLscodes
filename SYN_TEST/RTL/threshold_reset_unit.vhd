library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.conf.all;

entity threshold_reset_unit is
    port (
        i_V_valid    : in std_logic;
        i_V          : in std_logic_vector(BITWIDTH-1 downto 0);
        i_thresh_prn : in std_logic_vector(BITWIDTH-1 downto 0);
        i_M          : in std_logic_vector(BITWIDTH-1 downto 0);
        i_alpha      : in std_logic_vector(BITWIDTH-1 downto 0);
        i_beta       : in std_logic_vector(BITWIDTH-1 downto 0);
        i_V_reset    : in std_logic_vector(BITWIDTH-1 downto 0);
        i_kappa      : in std_logic;
        i_gamma      : in std_logic_vector(1 downto 0);
        o_V          : out std_logic_vector(BITWIDTH-1 downto 0);
        o_spike      : out std_logic
    );

end entity threshold_reset_unit;
architecture threshold_reset_unit_arc of threshold_reset_unit is
    signal eta           :  std_logic_vector(BITWIDTH-1 downto 0);
    signal pos_threshold :  std_logic_vector(BITWIDTH-1 downto 0);
    signal neg_threshold :  std_logic_vector(BITWIDTH-1 downto 0);
    signal o_V_net       :  std_logic_vector(BITWIDTH-1 downto 0);
    signal o_spike_net   :  std_logic;
begin
    eta <= i_thresh_prn and i_M;

    calculate_threshold : process( all )
    begin
        pos_threshold <= conv_std_logic_vector(SIGNED(eta)+SIGNED(i_alpha),BITWIDTH);
        if (i_kappa='1') then
            neg_threshold <= conv_std_logic_vector(0-SIGNED(i_beta),BITWIDTH);
        else
            neg_threshold <= conv_std_logic_vector(0-SIGNED(i_beta)-SIGNED(eta),BITWIDTH);
        end if;
    end process ; -- identifier

    reset : process( all )
    begin
        if (SIGNED(i_V)>=SIGNED(pos_threshold)) then
            o_spike_net <= '1';
            case (i_gamma) is
                when "00" => o_V_net <= i_V_reset;
                when "01" => o_V_net <= conv_std_logic_vector(SIGNED(i_V)-SIGNED(pos_threshold),BITWIDTH);
                when others => o_V_net <= i_V;
            end case;
        elsif (SIGNED(i_V) <= SIGNED(neg_threshold)) then
            o_spike_net <= '0';
            if (i_kappa='0') then
                case (i_gamma) is
                    when "00" => o_V_net <= conv_std_logic_vector(0-SIGNED(i_V_reset),BITWIDTH);
                    when "01" => o_V_net <= conv_std_logic_vector(SIGNED(i_V)+SIGNED(i_beta)+SIGNED(eta),BITWIDTH);
                    when others => o_V_net <= i_V;
                end case;
            else
                o_V_net <= conv_std_logic_vector(0-SIGNED(i_beta), BITWIDTH);
            end if;
        else
            o_spike_net <= '0';
            o_V_net <= i_V;
        end if;
    end process ; -- identifier

    o_V <= (BITWIDTH-1 downto 0 => i_V_valid) and o_V_net;
    o_spike <= o_spike_net and i_V_valid;
    end threshold_reset_unit_arc;
