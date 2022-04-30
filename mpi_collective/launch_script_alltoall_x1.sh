#!/bin/sh


#1 - N
#2 - tasks-per-node
#3 - number of times to repeat job sumbit
#4 - sleep time

#5 - message size
#6 - number of iterations
#7 - segmentation of iterations or batch size

#8 - USE_NODES



PATH_TO_DIR="${HOME}/_scratch/research/mpi_collective"
PATH_TO_EXEC="${PATH_TO_DIR}"
PATH_TO_TXT="${PATH_TO_DIR}/txt_alltoall"
EXEC_FILE="alltoall"
OUTPUT1="${PATH_TO_TXT}/${EXEC_FILE}.txt"
OUTPUT2="${PATH_TO_TXT}/${EXEC_FILE}.csv"


EXCL_NODES=""
USE_NODES="n50012,n50013,n50014,n50015"

function LAUNCH_STREAM() {
	# --nodelist="${USE_NODES}"
	sbatch -p "test" -O --nodelist="$8" --output="${OUTPUT1}" --open-mode=append -C "nomonitoring" -N "$1" --ntasks-per-node="$2" ${PATH_TO_DIR}/sbatch_files/my_sbatch_x1 ${PATH_TO_EXEC}/${EXEC_FILE} ${OUTPUT1} ${5} ${6} ${OUTPUT2} ${7} 
}

#COMPILE_STREAM "$@";
for var in `seq 1 ${3}`
do
	echo "launch $var";
	printf "$1,$2\n" >> ${OUTPUT1};
	LAUNCH_STREAM "$@";
	sleep "${4}";
done
