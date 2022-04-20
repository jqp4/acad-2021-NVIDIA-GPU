#!/bin/sh

eval "taskset --cpu-list 0-13 $@"

exit 0
