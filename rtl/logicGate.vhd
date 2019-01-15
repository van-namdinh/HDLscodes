---------------------------------------------------------------------------------
--
-- Copyright (c) 2017 by SISLAB Team, LSI Design Contest 2018.
-- The University of Engineering and Technology, Vietnam National University.
-- All right resevered.
--
-- Copyright notification
-- No part may be reproduced except as authorized by written permission.
-- 
-- @File            : logicGate.vhd
-- @Author          : Van-Nam DINH @Modifier      : Van-Nam DINH
-- @Created Date    : Th01 11 2019       @Modified Date : Th01 11 2019 14:47
-- @Project         : Artificial Neural Network
-- @Module          : logicGate
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
entity logicGate is
    port(
--        clk     : in std_logic;
--        rst     : in std_logic;
        in1, in2    : in std_logic_vector(3 downto 0);
        and2, or2, xor2     : out std_logic_vector(3 downto 0)
    );
end entity; 

---------------------------------------------------------------------------------
-- Architecture description
---------------------------------------------------------------------------------
architecture behavior of logicGate is
    
begin
    and2 <= in1 and in2;
    or2 <= in1 or in2;
    xor2 <= in1 xor in2;  
end behavior;

