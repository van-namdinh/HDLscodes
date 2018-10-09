###################################################################

# Created by write_sdc on Mon Aug 27 10:45:00 2018

###################################################################
set sdc_version 2.0

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current mA
set_wire_load_model -name 5K_hvratio_1_1 -library NangateOpenCellLibrary
create_clock -name i_Clk  -period 4  -waveform {0 2}
set_clock_uncertainty 0.004  [get_clocks i_Clk]
set_input_delay -clock i_Clk  0  [get_ports i_Enable]
set_input_delay -clock i_Clk  0  [get_ports i_Seed_DV]
set_input_delay -clock i_Clk  0  [get_ports {i_Seed_Data[7]}]
set_input_delay -clock i_Clk  0  [get_ports {i_Seed_Data[6]}]
set_input_delay -clock i_Clk  0  [get_ports {i_Seed_Data[5]}]
set_input_delay -clock i_Clk  0  [get_ports {i_Seed_Data[4]}]
set_input_delay -clock i_Clk  0  [get_ports {i_Seed_Data[3]}]
set_input_delay -clock i_Clk  0  [get_ports {i_Seed_Data[2]}]
set_input_delay -clock i_Clk  0  [get_ports {i_Seed_Data[1]}]
set_input_delay -clock i_Clk  0  [get_ports {i_Seed_Data[0]}]
set_output_delay -clock i_Clk  0  [get_ports {o_LFSR_Data[7]}]
set_output_delay -clock i_Clk  0  [get_ports {o_LFSR_Data[6]}]
set_output_delay -clock i_Clk  0  [get_ports {o_LFSR_Data[5]}]
set_output_delay -clock i_Clk  0  [get_ports {o_LFSR_Data[4]}]
set_output_delay -clock i_Clk  0  [get_ports {o_LFSR_Data[3]}]
set_output_delay -clock i_Clk  0  [get_ports {o_LFSR_Data[2]}]
set_output_delay -clock i_Clk  0  [get_ports {o_LFSR_Data[1]}]
set_output_delay -clock i_Clk  0  [get_ports {o_LFSR_Data[0]}]
