vlib work
vcom -2008 -work work ../../RTL/conf.vhd
vcom -2008 -work work ../../RTL/synapse_unit.vhd
vcom -2008 -work work ../../RTL/leak_unit.vhd
vcom -2008 -work work ../../RTL/leak_reversal.vhd
vcom -2008 -work work ../../RTL/integrator_unit.vhd
vcom -2008 -work work ../../RTL/lfsr.vhd
vcom -2008 -work work ../../RTL/threshold_reset_unit.vhd
vcom -2008 -work work ../../RTL/top_unit.vhd
vcom -2008 -work work ../../TB/top_unit_tb.vhd

vsim -novopt -t 1ps work.tb_top_unit
add wave -group X sim:/tb_top_unit/dut/*
add wave *
run -all