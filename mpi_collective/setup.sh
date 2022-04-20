# модули подключаются отдельно
# module load slurm
# module load openmpi

# Компиляция программ сделана отдельно
# mpicxx cycle.cpp -o cycle
# mpicxx barrier.cpp -o barrier
# mpicxx alltoall.cpp -o alltoall

chmod +x cycle
chmod +x barrier
chmod +x alltoall

chmod +x launch_script_barrier.sh
chmod +x launch_script_barrier_x1.sh
chmod +x launch_script_alltoall.sh
chmod +x launch_script_alltoall_x1.sh

chmod +x ./dimmon_affinity/affinity_same.sh
chmod +x ./noise_affinity/simple_noise_x1_affinity_same_core.sh
chmod +x ./task_affinity/affinity_task.sh

