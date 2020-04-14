#!/usr/bin/env bash

docker stop -f ccc 1>/dev/null 2>&1
docker rm   -f ccc 1>/dev/null 2>&1

echo "We make outer user $USER available in the postgres container"

docker run  -e POSTGRES_PASSWORD='some-pass' \
            -e POSTGRES_USER=$USER \
            -e POSTGRES_DB='ddd' \
            -e POSTGRES_HOST_AUTH_METHOD='trust' \
            --name ccc  -p 20414:5432  -d  postgres:11

echo "Booting ..."; sleep 2  # give some time for the container to finish booting


docker exec ccc useradd $USER
echo; docker exec -u $USER   ccc bash -c "psql ddd -c \" select 1 \" "
#                 #os user                     #db

echo; psql -p 20414 ddd -c 'select 1'
