# -----------------------------------------------------------------------------
# Project name   :
# File name      : gem5garnet20.sh
# Created date   : Th01 18 2018
# Author         : Van-Nam DINH
# Last modified  : Th01 18 2018 09:12
# Guide          :
# -----------------------------------------------------------------------------
#!/bin/bash

for synth in uniform_random tornado
do
	for injectionrate in 0.01 0.05 0.1 0.2 0.3 0.35 0.4 0.45 0.5 0.55
do
./build/Garnet_standalone/gem5.debug configs/example/garnet_synth_traffic.py  \
	--num-cpus=64 \
	--num-dirs=64 \
	--network=garnet2.0 \
	--topology=Mesh_XY \
	--mesh-rows=8  \
	--sim-cycles=100000 \
	--synthetic=$synth \
	--injectionrate=$injectionrate
mv m5out/ m5out$injectionrate$synth/
done
done

