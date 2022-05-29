get_squeue_size() {
  sleep 8
  command_data=$(squeue --user skryabinglebedu_2138)
  size=${#command_data} 
  echo "squeue strlen: $size"
}

sleep_until_queue_is_free() {
  get_squeue_size
  while [ $size -gt 90 ]
    do
      get_squeue_size
    done
  echo "[$(date)] >>> squeue is free"
}

# длина строки очереди
# без задач - 84
# 1 задача - 159
# 2 задачи - 247
# 3 задачи - 335

sh ./setup.sh


sleep_until_queue_is_free
echo ">>> nohup ./launch_script_alltoall_x1.sh 4 14 1 3s 256 30600 1800 \"n50012,n50013,n50014,n50015\" &"
echo ">>> [iteration 0]"
nohup ./launch_script_alltoall_x1.sh 4 14 1 3s 256 30600 1800 "n50012,n50013,n50014,n50015" &
sleep_until_queue_is_free
echo ">>> nohup ./launch_script_alltoall_x1.sh 4 14 1 3s 256 30600 1800 \"n50012,n50013,n50014,n50015\" &"
echo ">>> [iteration 1]"
nohup ./launch_script_alltoall_x1.sh 4 14 1 3s 256 30600 1800 "n50012,n50013,n50014,n50015" &
sleep_until_queue_is_free
echo ">>> nohup ./launch_script_alltoall_x1.sh 8 14 1 3s 256 30600 1800 \"n50012,n50013,n50014,n50015,n50008,n50009,n50010,n50011\" &"
echo ">>> [iteration 0]"
nohup ./launch_script_alltoall_x1.sh 8 14 1 3s 256 30600 1800 "n50012,n50013,n50014,n50015,n50008,n50009,n50010,n50011" &
sleep_until_queue_is_free
echo ">>> nohup ./launch_script_alltoall_x1.sh 8 14 1 3s 256 30600 1800 \"n50012,n50013,n50014,n50015,n50008,n50009,n50010,n50011\" &"
echo ">>> [iteration 1]"
nohup ./launch_script_alltoall_x1.sh 8 14 1 3s 256 30600 1800 "n50012,n50013,n50014,n50015,n50008,n50009,n50010,n50011" &

sleep_until_queue_is_free
echo ">>> !!! DONE !!!"