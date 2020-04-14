#!/usr/bin/env bash

docker stop -f ccc 1>/dev/null 2>&1
docker rm   -f ccc 1>/dev/null 2>&1


docker run  -e POSTGRES_PASSWORD=some-pass \
            -e POSTGRES_USER='uuu' \
            -e   POSTGRES_DB='ddd' \
            --name ccc  -d  postgres:11

echo "Booting ..."; sleep 2  # give some time for the container to finish booting


#                 #os user                   #psql user
echo; docker exec          ccc bash -c "psql -U uuu     ddd -c \" select 1 \" "
echo; docker exec -u uuu   ccc bash -c "psql            ddd -c \" select 1 \" "  #NOTE will fail with error > unable to find user uuu: no matching entries in passwd file
#                 #os user                   #psql user

note="
we create os user :uuu so that to get the psql to pass
"
docker exec ccc useradd uuu
echo; docker exec -u uuu   ccc bash -c "psql ddd            -c \" select 1 \" "
#                 #os user                   #db name only
