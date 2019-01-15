-------------------------------------------------------------------------------
-- Title      : Testbench for design "moore_110_detector"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : 110_detector_tb.vhd
-- Author     : Hieu D. Bui  <Hieu D. Bui@>
-- Company    : SISLAB, VNU-UET
-- Created    : 2017-11-30
-- Last update: 2017-11-30
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2017 SISLAB, VNU-UET
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2017-11-30  1.0      Hieu D. Bui     Created
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-------------------------------------------------------------------------------

ENTITY fsm_110_detector_tb IS

END ENTITY fsm_110_detector_tb;

-------------------------------------------------------------------------------

ARCHITECTURE test OF fsm_110_detector_tb IS

  -- component ports
  SIGNAL clk                  : STD_LOGIC := '1';
  SIGNAL rst_n                : STD_LOGIC := '0';
  SIGNAL data_in              : STD_LOGIC := '0';
  SIGNAL moore_detect_110_out : STD_LOGIC;
  SIGNAL mealy_detect_110_out : STD_LOGIC;

  CONSTANT PERIOD : TIME := 10 ns;
BEGIN  -- ARCHITECTURE test

  -- component instantiation
  MOORE_DUT : ENTITY work.moore_110_detector
    PORT MAP (
      clk            => clk,
      rst_n          => rst_n,
      data_in        => data_in,
      detect_110_out => moore_detect_110_out);

  MEALY_DUT : ENTITY work.mealy_110_detector
    PORT MAP (
      clk            => clk,
      rst_n          => rst_n,
      data_in        => data_in,
      detect_110_out => mealy_detect_110_out);

  -- clock & reset generation
  Clk <= NOT Clk AFTER PERIOD / 2;
  rst_n <= '1' AFTER 2*PERIOD + PERIOD / 4;

  -- waveform generation
  WaveGen_Proc : PROCESS
  BEGIN
    -- wait until finishing reset
    WAIT UNTIL rst_n = '1'; 
    
    -- input data for one clock cycle
    data_in <= '0';
    WAIT UNTIL rising_edge(clk);
    WAIT FOR PERIOD / 4;
    -- end input data for one clock cycle
    
  END PROCESS WaveGen_Proc;



END ARCHITECTURE test;

-------------------------------------------------------------------------------

CONFIGURATION fsm_110_detector_tb_test_cfg OF fsm_110_detector_tb IS
  FOR test
  END FOR;
END fsm_110_detector_tb_test_cfg;

-------------------------------------------------------------------------------
