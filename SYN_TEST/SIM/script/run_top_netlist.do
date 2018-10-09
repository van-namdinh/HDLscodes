#vlib work
#vlog -work work /home/dkit/FreePDK45/NangateOpenCellLibrary_PDKv1_3_v2010_12/Front_End/Verilog/NangateOpenCellLibrary.v
vlog -work work ../../SYN/output/top_unit.v

vcom -2008 -work work ../../RTL/conf.vhd
vcom -2008 -work work ../../TB/top_unit_tb.vhd
vsim -novopt -t 1ps -sdfmax  sim:/tb_top_unit/dut=../../SYN/output/top_unit.sdf work.tb_top_unit
#vsim -novopt -t 1ps work.tb_top_unit
add wave -group X sim:/tb_top_unit/dut/*
add wave -group top *
#add wave -group LFSR1 sim:/tb_top_unit/dut/LFSR1/*
#add wave -group LFSR2 sim:/tb_top_unit/dut/LFSR2/*
#add wave -group LFSR3 sim:/tb_top_unit/dut/LFSR3/*
run -all
