#!/usr/bin/env bash

docker stop -f ccc 1>/dev/null 2>&1
docker rm   -f ccc 1>/dev/null 2>&1


docker run  -e POSTGRES_PASSWORD=some-pass \
            -e POSTGRES_USER='uuu' \
            -e   POSTGRES_DB='ddd' \
            --name ccc  -d  postgres:11

echo "Booting ..."; sleep 2  # give some time for the container to finish booting

echo; docker exec -u postgres  ccc  bash -c "psql                   -c \" select '00' _, current_user, current_database() \" "
echo; docker exec -u postgres  ccc  bash -c "psql -U uuu            -c \" select '00' _, current_user, current_database() \" "
echo; docker exec -u postgres  ccc  bash -c "psql -U uuu  postgres  -c \" select '01' _, current_user, current_database() \" "
echo; docker exec -u postgres  ccc  bash -c "psql -U uuu  ddd       -c \" select '02' _, current_user, current_database() \" "
#                 #os user                        #user   #db                                          #current db ref. https://dba.stackexchange.com/a/58332/52550
#                                                                                        #current user ref. https://stackoverflow.com/a/39735233/248616

echo; docker exec ccc bash -c "psql -U uuu  ddd -c \" select 1 \" "
