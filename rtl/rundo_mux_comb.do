# The library creating
vlib work
# compile the source files
vcom mux41_v1.vhd 
vcom mux41_v1_tb.vhd
# loading design
vsim work.mux41_v1_tb
#adding wave
add wave -r /*
#runnig simulation
run -all
