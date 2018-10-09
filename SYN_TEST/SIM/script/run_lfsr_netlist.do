vlib work

vcom -2008 -work work ../../RTL/conf.vhd
vlog -work work ../../SYN/output/lfsr.v
vcom -2008 -work work ../../TB/lfsr_tb.vhd
vsim -novopt -t 1ps work.lfsr_tb
add wave -group X sim:/LFSR_TB/LFSR1/*
add wave *

run -all