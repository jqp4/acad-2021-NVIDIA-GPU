nohup ./launch_script_alltoall.sh 1 14 1 1s 256 100000 10000 &

nohup ./launch_script_alltoall_x1.sh 1 14 1 1s 256 100000 10000 &

nohup ./launch_script_barrier.sh 1 14 1 1s 100000 10000 &

nohup ./launch_script_barrier_x1.sh 1 14 1 1s 100000 10000 &

squeue --user skryabinglebedu_2138
