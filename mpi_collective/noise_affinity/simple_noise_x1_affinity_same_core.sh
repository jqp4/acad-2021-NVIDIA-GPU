#!/bin/sh

eval "taskset --cpu-list 1 ./cycle noise_info.txt"

exit 0