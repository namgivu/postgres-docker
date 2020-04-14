#!/usr/bin/env bash

docker stop -f ccc 1>/dev/null 2>&1
docker rm   -f ccc 1>/dev/null 2>&1


docker run  -e POSTGRES_PASSWORD=some-pass \
            -e POSTGRES_USER=uuu \
            --name ccc  -d  postgres:11

echo "Booting ..."; sleep 2  # give some time for the container to finish booting

echo; docker exec -u postgres  ccc  bash -c "psql -U uuu            -c \" select '00' \" "
echo; docker exec -u postgres  ccc  bash -c "psql -U uuu  postgres  -c \" select '01' \" "
#                 #os user                        #user   #db
