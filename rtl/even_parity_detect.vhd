---------------------------------------------------------------------------------
--
-- Copyright (c) 2017 by SISLAB Team, LSI Design Contest 2018.
-- The University of Engineering and Technology, Vietnam National University.
-- All right resevered.
--
-- Copyright notification
-- No part may be reproduced except as authorized by written permission.
-- 
-- @File            : even_parity_detect.vhd
-- @Author          : Van-Nam DINH       @Modifier      : Van-Nam DINH
-- @Created Date    : Th10 09 2018       @Modified Date : Th10 09 2018 15:38
-- @Project         : HDL practice
-- @Module          : even_parity_detect
-- @Description     :
-- @Version         :
-- @ID              :
--
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- Library declaration
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

---------------------------------------------------------------------------------
-- Entity declaration
--------------------------------------------------------------------------------- 
entity even_parity_detect is
    port(
        clk     : in std_logic;
        rst     : in std_logic;
        a       : in std_logic_vector(2 downto 0);
        even    : out std_logic
    );
end entity; 

---------------------------------------------------------------------------------
-- Architecture description
---------------------------------------------------------------------------------
architecture behavior of even_parity_detect is
        signal p1, p2, p3, p4   :   std_logic;  
begin
        even    <= (p1 or p2) or (p3 or p4) after 20 ns;
        p1      <= (not a(2)) and (not a(1)) and (not a(0)) after 15 ns;
        p2      <= (not a(2)) and a(1) and a(0) after 12 ns;
        p3      <= a(2) and (not a(1)) and a(0) after 12 ns
        ; p4      <= a(2) and a(1) and a(0) after 12 ns;
end behavior;

