# -----------------------------------------------------------------------------
# Project name   :
# File name      : data_extract.sh
# Created date   : Th01 20 2018
# Author         : Van-Nam DINH
# Last modified  : Th01 20 2018 15:14
# Guide          :
# -----------------------------------------------------------------------------
#!/bin/bash

for synth in uniform_random tornado
do
	for injectionrate in 0.01 0.05 0.1 0.2 0.3 0.35 0.4 0.45 0.5 0.55
do
	cat m5out$injectionrate$synth/stats.txt | grep average_flit_latency
done
echo "Done with the interesting things of m5out$synth"
done
