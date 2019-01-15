---------------------------------------------------------------------------------
--
-- Copyright (c) 2017 by SISLAB Team, LSI Design Contest 2018.
-- The University of Engineering and Technology, Vietnam National University.
-- All right resevered.
--
-- Copyright notification
-- No part may be reproduced except as authorized by written permission.
-- 
-- @File            : mux41_v1.vhd
-- @Author          : Van-Nam DINH @Modifier      : Van-Nam DINH
-- @Created Date    : Th01 11 2019       @Modified Date : Th01 11 2019 16:25
-- @Project         : Artificial Neural Network
-- @Module          : mux41_v1
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
entity mux41_v1 is
    port(
    i_d0, i_d1, i_d2, i_d3  : in    std_logic_vector(7 downto 0);
    i_sel                   : in    std_logic_vector(1 downto 0);
    o_data                  : out   std_logic_vector(7 downto 0)
    );
end entity; 

---------------------------------------------------------------------------------
-- Architecture description
---------------------------------------------------------------------------------
architecture behavior of mux41_v1 is
  
begin
    process(i_sel,i_d1,i_d2,i_d0,i_d3)
    begin
        if i_sel = "01" then
            o_data <= i_d1;
        elsif i_sel = "10" then
            o_data <= i_d2;
        elsif i_sel = "11" then
            o_data <= i_d3;
        else o_data <= i_d0;            
        end if;
    end process;
end behavior;

