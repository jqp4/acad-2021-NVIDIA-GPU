nohup ./launch_script_alltoall.sh    1 14 1 1s 256 100000 10000 &
nohup ./launch_script_alltoall_x1.sh 1 14 1 1s 256 100000 10000 &

nohup ./launch_script_barrier.sh    1 14 1 1s 100000 10000 &
nohup ./launch_script_barrier_x1.sh 1 14 1 1s 100000 10000 &

squeue --user skryabinglebedu_2138







nohup ./launch_script_barrier.sh    2 14 2 1m 75500 7550 &
nohup ./launch_script_barrier_x1.sh 2 14 2 1m 75500 7550 &
