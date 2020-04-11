#!/usr/bin/env bash
SH=`cd $(dirname $BASH_SOURCE) && pwd`  # get SH=executed script's path, containing folder, cd & pwd to get container path

source "$SH/.config.sh"

# run the container
cd $SH  # must run at this script home folder to load STACK_ID=namgivu_postgres10_auth
    docker-compose  -f "$SH/docker-compose.yml"    -p $STACK_ID                          up  -d                  --force-recreate             --remove-orphans
    #               #custom docker-compose         #project-name aka docker stack name       #run as background  #recreate if previously run  #no warning for orphans if any
    #               #ref. http://bit.ly/2sKfLDz    #this allow multiple stacks created
    #                                              #we need -p param to define docker stack name - we use separate stack to run each atlas instance for each gc staff

    # print summary if success
    if [[ $? == 0 ]]; then source "$SH/summary.sh"; fi

cd - 1>/dev/null
