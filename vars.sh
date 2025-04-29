#!/bin/bash

RED="\e[91m"
GREEN="\e[92m"
YELLOW="\e[93m"
CYAN="\e[96m"
ENDCOLOR="\e[0m"

prefix () {
    local prefix_output="$(date +'%Y-%m-%d %H:%M:%S')"
    echo "$prefix_output $GREEN[EKSSample]$ENDCOLOR"
}