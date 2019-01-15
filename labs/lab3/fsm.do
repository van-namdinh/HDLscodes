vlib work

vcom mealy_110_detector.vhd
vcom moore_110_detector.vhd
vcom fsm_110_detector_tb.vhd

vsim -novopt fsm_110_detector_tb
#add wave /*

## view all waves
add wave -r /*

run 100 ns
