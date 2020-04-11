#!/usr/bin/env bash
SH=`cd $(dirname $BASH_SOURCE) && pwd`  # get SH=executed script's path, containing folder, cd & pwd to get container path

source "$SH/.config.sh"

echo "
** sample usage **
docker exec -it $CONTAINER_NAME psql -U $POSTGRES_USER -c 'select version()' -t
"
