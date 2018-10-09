###################################################################

# Created by write_sdc on Fri Aug 24 16:04:52 2018

###################################################################
set sdc_version 2.0

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current mA
set_wire_load_model -name 5K_hvratio_1_1 -library NangateOpenCellLibrary
create_clock [get_ports i_clk]  -period 4  -waveform {0 2}
set_clock_uncertainty 0.004  [get_clocks i_clk]
set_input_delay -clock i_clk  0  [get_ports {i_V[7]}]
set_input_delay -clock i_clk  0  [get_ports {i_V[6]}]
set_input_delay -clock i_clk  0  [get_ports {i_V[5]}]
set_input_delay -clock i_clk  0  [get_ports {i_V[4]}]
set_input_delay -clock i_clk  0  [get_ports {i_V[3]}]
set_input_delay -clock i_clk  0  [get_ports {i_V[2]}]
set_input_delay -clock i_clk  0  [get_ports {i_V[1]}]
set_input_delay -clock i_clk  0  [get_ports {i_V[0]}]
set_input_delay -clock i_clk  0  [get_ports {i_syn_weight[7]}]
set_input_delay -clock i_clk  0  [get_ports {i_syn_weight[6]}]
set_input_delay -clock i_clk  0  [get_ports {i_syn_weight[5]}]
set_input_delay -clock i_clk  0  [get_ports {i_syn_weight[4]}]
set_input_delay -clock i_clk  0  [get_ports {i_syn_weight[3]}]
set_input_delay -clock i_clk  0  [get_ports {i_syn_weight[2]}]
set_input_delay -clock i_clk  0  [get_ports {i_syn_weight[1]}]
set_input_delay -clock i_clk  0  [get_ports {i_syn_weight[0]}]
set_input_delay -clock i_clk  0  [get_ports {i_leak_weight[7]}]
set_input_delay -clock i_clk  0  [get_ports {i_leak_weight[6]}]
set_input_delay -clock i_clk  0  [get_ports {i_leak_weight[5]}]
set_input_delay -clock i_clk  0  [get_ports {i_leak_weight[4]}]
set_input_delay -clock i_clk  0  [get_ports {i_leak_weight[3]}]
set_input_delay -clock i_clk  0  [get_ports {i_leak_weight[2]}]
set_input_delay -clock i_clk  0  [get_ports {i_leak_weight[1]}]
set_input_delay -clock i_clk  0  [get_ports {i_leak_weight[0]}]
set_input_delay -clock i_clk  0  [get_ports i_spike_en]
set_input_delay -clock i_clk  0  [get_ports i_leak_en]
set_output_delay -clock i_clk  0  [get_ports {o_V[7]}]
set_output_delay -clock i_clk  0  [get_ports {o_V[6]}]
set_output_delay -clock i_clk  0  [get_ports {o_V[5]}]
set_output_delay -clock i_clk  0  [get_ports {o_V[4]}]
set_output_delay -clock i_clk  0  [get_ports {o_V[3]}]
set_output_delay -clock i_clk  0  [get_ports {o_V[2]}]
set_output_delay -clock i_clk  0  [get_ports {o_V[1]}]
set_output_delay -clock i_clk  0  [get_ports {o_V[0]}]
set_output_delay -clock i_clk  0  [get_ports o_V_valid]
