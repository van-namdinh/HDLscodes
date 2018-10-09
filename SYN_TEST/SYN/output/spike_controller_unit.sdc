###################################################################

# Created by write_sdc on Fri Aug 31 14:25:47 2018

###################################################################
set sdc_version 2.0

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current mA
set_wire_load_model -name 5K_hvratio_1_1 -library NangateOpenCellLibrary
create_clock -name i_clk  -period 4  -waveform {0 2}
set_clock_uncertainty 0.004  [get_clocks i_clk]
set_input_delay -clock i_clk  0  [get_ports i_spike_en]
set_input_delay -clock i_clk  0  [get_ports {i_spike_num[7]}]
set_input_delay -clock i_clk  0  [get_ports {i_spike_num[6]}]
set_input_delay -clock i_clk  0  [get_ports {i_spike_num[5]}]
set_input_delay -clock i_clk  0  [get_ports {i_spike_num[4]}]
set_input_delay -clock i_clk  0  [get_ports {i_spike_num[3]}]
set_input_delay -clock i_clk  0  [get_ports {i_spike_num[2]}]
set_input_delay -clock i_clk  0  [get_ports {i_spike_num[1]}]
set_input_delay -clock i_clk  0  [get_ports {i_spike_num[0]}]
set_output_delay -clock i_clk  0  [get_ports o_spike_en]
set_output_delay -clock i_clk  0  [get_ports o_leak_en]
