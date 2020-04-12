# docker images for postgres
postgres     ref. https://hub.docker.com/r/_/postgres
with postgis ref. https://hub.docker.com/r/mdillon/postgis
```bash
docker pull postgres:10;
docker pull postgres:11;
docker pull postgres:12;

docker pull  mdillon/postgis:10;
docker pull  mdillon/postgis:11;
```


# postgres available at multiple versions
```bash
: /path/to/this/project
export STACK_ID='postgis_10'; ./docker/down.sh && ./docker/up.sh;
export STACK_ID='postgis_11'; ./docker/down.sh && ./docker/up.sh;    

export STACK_ID='postgres_10'; ./docker/down.sh && ./docker/up.sh;
export STACK_ID='postgres_11'; ./docker/down.sh && ./docker/up.sh;
export STACK_ID='postgres_12'; ./docker/down.sh && ./docker/up.sh;
```


# postgres from docker image with custom network name
```bash
: /path/to/this/project
export NETWORK_NAME='docker_network__shared_10vs11'; 
    export STACK_ID='postgres_11'; ./docker/down.sh && ./docker/up.sh; 
    export STACK_ID='postgres_10'; ./docker/down.sh && ./docker/up.sh;
```


# postgres from docker image with custom auth user+pass
Wire it up 
```bash
: /path/to/this/project
export POSTGRES_USER='my_pg_user'; export POSTGRES_PASSWORD='my_pg_pass';  
    export STACK_ID='postgres_10'; ./docker/down.sh && ./docker/up.sh;
```

Try to connect with the custom user+pass
```bash
PGPASSWORD=my_pg_pass psql -U my_pg_user -p 20410 -c 'select 1' -t
#          #pass              #user
```
