---------------------------------------------------------------------------------
--
-- Copyright (c) 2017 by SISLAB Team, LSI Design Contest 2018.
-- The University of Engineering and Technology, Vietnam National University.
-- All right resevered.
--
-- Copyright notification
-- No part may be reproduced except as authorized by written permission.
-- 
-- @File            : mux_comb.vhd
-- @Author          : Van-Nam DINH @Modifier      : Van-Nam DINH
-- @Created Date    : Th01 11 2019       @Modified Date : Th01 11 2019 15:21
-- @Project         : Artificial Neural Network
-- @Module          : mux_comb
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
entity mux_comb is
    port(
--        clk     : in std_logic;
--        rst     : in std_logic;
        d0      : in std_logic;
        d1      : in std_logic;
        s       : in std_logic;
        y       : out std_logic
    );
end entity; 

---------------------------------------------------------------------------------
-- Architecture description
---------------------------------------------------------------------------------
architecture behavior of mux_comb is
  
begin
    y <= (not(s) and not(d1) and d0) or (not(s) and d1 and d0) or (s and d1 and not(d0)) or (s and d1 and d0);
end behavior;

