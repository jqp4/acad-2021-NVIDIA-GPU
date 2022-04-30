get_squeue_size() {
  sleep 10
  command_data=$(squeue --user skryabinglebedu_2138)
  size=${#command_data} 
  echo $size
}

sleep_until_queue_is_free() {
  get_squeue_size
  while [ $size -gt 85 ]
    do
      get_squeue_size
    done
}

# без задач - 84
# 1 задача - 159
# 2 задачи - 247
# 3 задачи - 335


sleep_until_queue_is_free
nohup ./launch_script_barrier.sh    1 1 2 3s 77000 7000 "n50012" &
sleep_until_queue_is_free
nohup ./launch_script_barrier_x1.sh 1 1 2 3s 77000 7000 "n50012" &
sleep_until_queue_is_free
nohup ./launch_script_barrier.sh    1 3 2 3s 77000 7000 "n50012" &
sleep_until_queue_is_free
nohup ./launch_script_barrier_x1.sh 1 3 2 3s 77000 7000 "n50012" &
sleep_until_queue_is_free
nohup ./launch_script_barrier.sh    1 7 2 3s 77000 7000 "n50012" &
sleep_until_queue_is_free
nohup ./launch_script_barrier_x1.sh 1 7 2 3s 77000 7000 "n50012" &
sleep_until_queue_is_free
nohup ./launch_script_barrier.sh    1 14 2 3s 77000 7000 "n50012" &
sleep_until_queue_is_free
nohup ./launch_script_barrier_x1.sh 1 14 2 3s 77000 7000 "n50012" &
sleep_until_queue_is_free
nohup ./launch_script_barrier.sh    2 1 2 3s 77000 7000 "n50012,n50013" &
sleep_until_queue_is_free
nohup ./launch_script_barrier_x1.sh 2 1 2 3s 77000 7000 "n50012,n50013" &
sleep_until_queue_is_free
nohup ./launch_script_barrier.sh    2 3 2 3s 77000 7000 "n50012,n50013" &
sleep_until_queue_is_free
nohup ./launch_script_barrier_x1.sh 2 3 2 3s 77000 7000 "n50012,n50013" &
sleep_until_queue_is_free
nohup ./launch_script_barrier.sh    2 7 2 3s 77000 7000 "n50012,n50013" &
sleep_until_queue_is_free
nohup ./launch_script_barrier_x1.sh 2 7 2 3s 77000 7000 "n50012,n50013" &
sleep_until_queue_is_free
nohup ./launch_script_barrier.sh    2 14 2 3s 77000 7000 "n50012,n50013" &
sleep_until_queue_is_free
nohup ./launch_script_barrier_x1.sh 2 14 2 3s 77000 7000 "n50012,n50013" &
sleep_until_queue_is_free
nohup ./launch_script_barrier.sh    4 1 2 3s 77000 7000 "n50012,n50013,n50014,n50015" &
sleep_until_queue_is_free
nohup ./launch_script_barrier_x1.sh 4 1 2 3s 77000 7000 "n50012,n50013,n50014,n50015" &
sleep_until_queue_is_free
nohup ./launch_script_barrier.sh    4 3 2 3s 77000 7000 "n50012,n50013,n50014,n50015" &
sleep_until_queue_is_free
nohup ./launch_script_barrier_x1.sh 4 3 2 3s 77000 7000 "n50012,n50013,n50014,n50015" &
sleep_until_queue_is_free
nohup ./launch_script_barrier.sh    4 7 2 3s 77000 7000 "n50012,n50013,n50014,n50015" &
sleep_until_queue_is_free
nohup ./launch_script_barrier_x1.sh 4 7 2 3s 77000 7000 "n50012,n50013,n50014,n50015" &
sleep_until_queue_is_free
nohup ./launch_script_barrier.sh    4 14 2 3s 77000 7000 "n50012,n50013,n50014,n50015" &
sleep_until_queue_is_free
nohup ./launch_script_barrier_x1.sh 4 14 2 3s 77000 7000 "n50012,n50013,n50014,n50015" &


sleep 10
echo "!!! DONE !!!"
