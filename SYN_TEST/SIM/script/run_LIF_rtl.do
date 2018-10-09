vlib work

vcom -2008 -work work ../../RTL/conf.vhd
vcom -2008 -work work ../../RTL/synapse_unit.vhd
vcom -2008 -work work ../../RTL/leak_unit.vhd
vcom -2008 -work work ../../RTL/leak_reversal.vhd
vcom -2008 -work work ../../RTL/integrator_unit.vhd
#vcom -2008 -work work ../../RTL/lfsr.vhd
#vcom -2008 -work work ../../RTL/LIF_CORE.vhd
#vcom -2008 -work work ../../TB/synapse_unit_tb.vhd
vcom -2008 -work work ../../RTL/threshold_reset_unit.vhd
vcom -2008 -work work ../../TB/threshold_reset_unit_tb.vhd
#vcom -2008 -work work ../../TB/integrator_unit_tb.vhd
#vcom -2008 -work work ../../TB/leak_reversal_unit_tb.vhd
#vcom -2008 -work work ../../TB/LIF_CORE_TB.vhd
#vcom -2008 -work work ../../TB/lfsr_tb.vhd

#vsim -novopt -t 1ps work.tb_lif_core
#vsim -novopt -t 1ps work.LFSR_TB
#vsim -novopt -t 1ps work.test_dut_tb
#vsim -novopt -t 1ps work.tb_synapse_unit
#vsim -novopt -t 1ps work.tb_leak_reversal_unit
#vsim -novopt -t 1ps work.tb_integrator_unit
vsim -novopt -t 1ps work.tb_threshold_reset_unit
#add wave -group X sim:/LFSR_TB/LFSR1/*
#add wave -group X sim:/tb_synapse_unit/dut/*
#add wave -group X sim:/tb_leak_reversal_unit/dut/*
#add wave -group X sim:/tb_integrator_unit/dut/*
add wave -group X sim:/tb_threshold_reset_unit/dut/*
add wave *

run -all


