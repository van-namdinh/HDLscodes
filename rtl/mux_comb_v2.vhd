---------------------------------------------------------------------------------
--
-- Copyright (c) 2017 by SISLAB Team, LSI Design Contest 2018.
-- The University of Engineering and Technology, Vietnam National University.
-- All right resevered.
--
-- Copyright notification
-- No part may be reproduced except as authorized by written permission.
-- 
-- @File            : mux_comb_v2.vhd
-- @Author          : Van-Nam DINH @Modifier      : Van-Nam DINH
-- @Created Date    : Th01 11 2019       @Modified Date : Th01 11 2019 15:45
-- @Project         : Artificial Neural Network
-- @Module          : mux_comb_v2
-- @Description     :
-- @Version         :
-- @ID              :
--
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- Library declaration
---------------------------------------------------------------------------------
LIBRARY ieee;
USE     ieee.std_logic_1164.all;

---------------------------------------------------------------------------------
-- Entity declaration
--------------------------------------------------------------------------------- 
entity mux_comb_v2 is
    port(
    sel     : in    std_logic;
    a,b     : in    std_logic_vector(3 downto 0);
    y       : out   std_logic_vector(3 downto 0)
    );
end entity; 

---------------------------------------------------------------------------------
-- Architecture description
---------------------------------------------------------------------------------
architecture behavior of mux_comb_v2 is
  
begin
    process (sel, a,b)
    begin
        if sel = '1' then
            y <= a;
        else
            y <= b;
        end if;
    end process;
end behavior;

