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


# wire up another_machine :am, to prove that can psql connect as long as having same user with :ddd
docker stop -f 'another_machine' 1>/dev/null 2>&1
docker rm   -f 'another_machine' 1>/dev/null 2>&1
    echo; docker run --net host                                   --name 'another_machine'  -e POSTGRES_PASSWORD='am-pass'  -d postgres
    #                #note we use :host network here on purpose
    #                #so that the new machine can see :ddd as localhost:20414
        sleep 2
        docker exec 'another_machine' useradd $USER
        echo; docker exec -u $USER  'another_machine'  bash -c "psql -h localhost                   -p 20414                ddd -c \" select 1 \" "
        #                                                            #note must use localhost here  #note this is ccc port

