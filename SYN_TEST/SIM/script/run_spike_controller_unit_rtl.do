vlib work
vcom -2008 -work work ../../RTL/conf.vhd
vcom -2008 -work work ../../RTL/spike_controller_unit.vhd
vcom -2008 -work work ../../TB/spike_controller_unit_tb.vhd
vsim -novopt -t 1ps work.tb_spike_controller_unit
add wave -group X sim:/tb_spike_controller_unit/dut/*
add wave *
run -all