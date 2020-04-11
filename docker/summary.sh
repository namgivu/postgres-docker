#!/usr/bin/env bash
SH=`cd $(dirname $BASH_SOURCE) && pwd`  # get SH=executed script's path, containing folder, cd & pwd to get container path

source "$SH/.config.sh"

echo "--> AFTERMATH"
echo
docker ps | grep -E "$CONTAINER_NAME|$EXPOSED_PORT" --color=always

echo
echo $STACK_ID
docker exec -it $CONTAINER_NAME psql -U $POSTGRES_USER -c 'select version()' -t  | grep -iE "PostgreSQL [^(]+" --color=always
#                               #print postgres version of the container           #print postgres version

echo "
--> SAMPLE USAGE
docker exec -it $CONTAINER_NAME psql -U $POSTGRES_USER -c 'select version()' -t
"
