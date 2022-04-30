# info

nohup ./launch_script_alltoall.sh    1 14 1 1s 256 100000 10000 &
nohup ./launch_script_alltoall_x1.sh 1 14 1 1s 256 100000 10000 &

nohup ./launch_script_barrier.sh    1 14 1 1s 100000 10000 &
nohup ./launch_script_barrier_x1.sh 1 14 1 1s 100000 10000 &

squeue --user skryabinglebedu_2138



# 22 apr -------------------------------------------------------

nohup ./launch_script_barrier.sh    2 14 2 30s 75500 7550 &
nohup ./launch_script_barrier_x1.sh 2 14 2 30s 75500 7550 &

nohup ./launch_script_alltoall.sh    2 14 2 30s 256 75500 7550 &
nohup ./launch_script_alltoall_x1.sh 2 14 2 30s 256 75500 7550 &

# 27 apr -------------------------------------------------------

# 21:50 - не хватило времни
nohup ./launch_script_barrier.sh    1 28 1 5s 75500 7550 &
nohup ./launch_script_barrier_x1.sh 1 28 1 5s 75500 7550 &

# 22:30 - не хватило времни
nohup ./launch_script_barrier.sh    1 28 1 5s 20000 2000 & # n48632
nohup ./launch_script_barrier_x1.sh 1 28 1 5s 20000 2000 &

# 23:01:37, 23:07:44
nohup ./launch_script_barrier.sh    1 28 1 5s 8000 800 &
nohup ./launch_script_barrier_x1.sh 1 28 1 5s 8000 800 &

# 23:25:54, 23:26:52
nohup ./launch_script_barrier.sh    14 2 1 5s 8000 800 &
nohup ./launch_script_barrier_x1.sh 14 2 1 5s 8000 800 & # n[50002-50004,50006-50015]

# 23:31:34, 23:32:10
nohup ./launch_script_barrier.sh    14 2 1 5s 75500 7550 &
nohup ./launch_script_barrier_x1.sh 14 2 1 5s 75500 7550 &

# 23:35 - не хватило времени
nohup ./launch_script_barrier.sh    14 14 1 5s 100000 10000 & # n[48616-48619,50006-50015]
nohup ./launch_script_barrier_x1.sh 14 14 1 5s 100000 10000 & # n[48620,48622-48630,48632,50002-50004]

# 23:52:41, 23:53:18
nohup ./launch_script_barrier.sh    14 2 1 5s 200000 10000 & # n[48616-48619,50006-50015]
nohup ./launch_script_barrier_x1.sh 14 2 1 5s 200000 10000 &

# 00:02 (то же самое что и прошлое)
nohup ./launch_script_barrier.sh    14 2 1 5s 200000 10000 &
nohup ./launch_script_barrier_x1.sh 14 2 1 5s 200000 10000 & # n[48616-48619,50006-50015]

# 00:20 (то же самое что и прошлое только добавил --nodelist)
nohup ./launch_script_barrier.sh    14 2 1 5s 200000 10000 & # n[50001-50004,50006-50015]
nohup ./launch_script_barrier_x1.sh 14 2 1 5s 200000 10000 & # n[50001-50004,50006-50015]

# 00:32:00, 00:32:50
nohup ./launch_script_barrier.sh    14 4 1 5s 100000 10000 & 
nohup ./launch_script_barrier_x1.sh 14 4 1 5s 100000 10000 &

# перебор --------------

# 29 apr 01:14:30 - 01:16:10
nohup ./launch_script_barrier.sh    1 1 1 5s 100000 10000 &
nohup ./launch_script_barrier_x1.sh 1 1 1 5s 100000 10000 &
nohup ./launch_script_barrier.sh    1 2 1 5s 100000 10000 &

# 30 apr 00:05:48
nohup ./launch_script_barrier.sh    1 1 1 5s 100000 10000 "n50012" &

# 30 apr 
nohup ./launch_script_barrier.sh    1 1 1 5s 100000 10000 "n50012" &
nohup ./launch_script_barrier.sh    1 3 1 5s 100000 10000 "n50012" &
nohup ./launch_script_barrier.sh    1 7 1 5s 100000 10000 "n50012" &

squeue --user skryabinglebedu_2138






