vlib work

vcom -2008 -work work ../../RTL/conf.vhd
#vlog -work work ../../SYN/output/synapse_unit.v
vcom -2008 -work work ../../RTL/synapse_unit.vhd
vcom -2008 -work work ../../TB/synapse_unit_tb.vhd
vsim -novopt -t 1ps work.tb_synapse_unit
add wave -group X sim:/tb_synapse_unit/dut/*
add wave *

run -all