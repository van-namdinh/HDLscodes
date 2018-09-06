vlib work
vlog ff_pos_clk.v
vlog dff_tb.v
vsim work.tb_DFF
add wave -position insertpoint  \
sim:/tb_DFF/D \
sim:/tb_DFF/clk \
sim:/tb_DFF/reset \
sim:/tb_DFF/Q
run 1.2 ns
