#
# Your design
#
set base_name spike_controller_unit
set clock_name i_clk
set reset_name i_rst
set clock_period 4
#1.86
set src_folder "../../RTL"

#
# Libraries
#


set DKIT_LINK   "/home/dkit/FreePDK45/NangateOpenCellLibrary_PDKv1_3_v2010_12/Front_End/db/CCS"
set target_library "${DKIT_LINK}/NangateOpenCellLibrary_typical_ccs.db"
set synthetic_library "dw_foundation.sldb"
set link_library [concat "*" $target_library $synthetic_library]
set symbol_library "generic.sdb"



#
# Read RTL file(s)
#
analyze -format vhdl $src_folder/conf.vhd
analyze -format vhdl $src_folder/top_unit.vhd
analyze -format vhdl $src_folder/integrator_unit.vhd
analyze -format vhdl $src_folder/leak_reversal.vhd
analyze -format vhdl $src_folder/leak_unit.vhd
analyze -format vhdl $src_folder/lfsr.vhd
analyze -format vhdl $src_folder/synapse_unit.vhd
analyze -format vhdl $src_folder/threshold_reset_unit.vhd
analyze -format vhdl $src_folder/spike_controller_unit.vhd


elaborate $base_name

current_design $base_name

link
uniquify

#
# Timing
#
create_clock -name $clock_name -period $clock_period; [find port $clock_name]
set_clock_uncertainty 0.004 [get_clocks $clock_name]
set_input_delay 0.00 -clock $clock_name [remove_from_collection [all_inputs] {i_clk i_rst}]
set_output_delay 0.00 -clock $clock_name [all_outputs]

#
# Clock gating
#
# set_clock_gating_style -sequential latch
# insert_clock_gating

#
# Set wire load model
#
set_wire_load_model -name 5K_hvratio_1_1 -library NangateOpenCellLibrary
check_design

#
# Design synthesis
#
#ungroup -all -flatten
#compile -map_effort high
#compile -incremental_mapping -map_effort high
optimize_netlist -area
compile_ultra

#
# Design report
#
report_qor > ../report/summary_report_${base_name}.txt
report_area -hierarchy > ../report/report_area_${base_name}.txt
report_timing > ../report/report_timing_${base_name}.txt
report_power -verbose > ../report/report_power_${base_name}.txt

#
# Output
#
write -format verilog -hierarchy -output ../output/${base_name}.v
write_sdf ../output/${base_name}.sdf
write_sdc ../output/${base_name}.sdc
write_file -format ddc -hierarchy -output ../DB/${base_name}.ddc
exit
