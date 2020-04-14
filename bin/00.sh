#!/usr/bin/env bash

docker stop -f ccc 1>/dev/null 2>&1
docker rm   -f ccc 1>/dev/null 2>&1


docker run  -e POSTGRES_PASSWORD=some-pass  --name ccc       -d                     postgres:11
#           #set password                   #container name  #daemon ie background  #image name

echo "Booting ..."; sleep 2  # give some time for the container to finish booting
echo
docker exec ccc  bash -c "psql -Upostgres -c 'select 1' "
