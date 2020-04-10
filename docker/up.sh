#!/usr/bin/env bash
SH=`cd $(dirname $BASH_SOURCE) && pwd`  # get SH=executed script's path, containing folder, cd & pwd to get container path

if [[ ! -f "$SH/.env" ]]; then echo "File not found .env at $SH - please clone one from *.env in `$SH/../config_vault` "; exit 1; fi
source "$SH/.env"

# run the container
cd $SH  # must run at this script home folder to load .env
    docker-compose  -f "$SH/docker-compose.yml"      up   -d                         --force-recreate              --remove-orphans
    #               #custom docker-compose location       #daemon run as background  #recreate if previously run   #no warning for the previous if any
    #                                                                                                              #TODO what are orphans?

    # print summary if success
    if [[ $? == 0 ]]; then source "$SH/summary.sh"; fi

cd - 1>/dev/null
