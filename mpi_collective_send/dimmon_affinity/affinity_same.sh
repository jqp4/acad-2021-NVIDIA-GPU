#!/bin/sh

PATH=/bin:/sbin:/usr/bin:/usr/sbin
export PATH

# DIMMON USER - home dir name
DIMMON_USER=
DIMMON_USER_HOME=`eval echo \~${DIMMON_USER}`
# DIR - path to dimmon
DIR=${DIMMON_USER_HOME}/_scratch/dimmon_dir
DIMMON_CMD=${DIR}/bin/dimmon
DIMMON_ARGS="-c ${DIR}/test_jd.conf"

eval `cd ${DIR}; LD_LIBRARY_PATH=${DIR}/lib taskset --cpu-list 1 ${DIMMON_CMD} ${DIMMON_ARGS}`

exit 0
