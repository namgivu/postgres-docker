#!/usr/bin/env bash

docker stop -f ccc 1>/dev/null 2>&1
docker rm   -f ccc 1>/dev/null 2>&1


docker run  -e POSTGRES_PASSWORD=some-pass  --name ccc       -d                     postgres:11
#           #set password                   #container name  #daemon ie background  #image name

echo "Booting ..."; sleep 2  # give some time for the container to finish booting

echo; docker exec              ccc  bash -c "psql             -c \" select '00_0' \"  "
echo; docker exec -u root      ccc  bash -c "psql             -c \" select '00_1' \"  "
echo; docker exec -u root      ccc  bash -c "psql -U postgres -c \" select '00_2' \"  "
echo; docker exec -u postgres  ccc  bash -c "psql             -c \" select '00_3' \"  "

echo; docker exec -u postgres  ccc  bash -c "psql             -c \" select '00_4 psql with no user+pass' _ \"  -t "
#                 #set os user when bash with docker exec
#                 #ref. https://docs.docker.com/engine/reference/commandline/exec/
