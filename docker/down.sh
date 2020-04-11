#!/usr/bin/env bash
SH=`cd $(dirname $BASH_SOURCE) && pwd`  # get SH=executed script's path, containing folder, cd & pwd to get container path

source "$SH/.config.sh"

cd $SH  # must run at this script home folder to load .env
    echo 'Dropping container...'
        docker stop $CONTAINER_NAME
        docker rm   $CONTAINER_NAME
    echo 'Dropping container... DONE'; echo
cd - 1>/dev/null
