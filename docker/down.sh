#!/usr/bin/env bash
SH=`cd $(dirname $BASH_SOURCE) && pwd`  # get SH=executed script's path, containing folder, cd & pwd to get container path
source "$SH/.env"

cd $SH  # must run at this script home folder to load .env
    docker stop $CONTAINER_NAME
    docker rm   $CONTAINER_NAME
cd - 1>/dev/null
