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


# postgres from docker image with default login mode
```bash
: /path/to/this/project
export STACK_ID='postgis_10'; ./docker/down.sh && ./docker/up.sh
export STACK_ID='postgis_11'; ./docker/down.sh && ./docker/up.sh

export STACK_ID='postgres_10'; ./docker/down.sh && ./docker/up.sh
export STACK_ID='postgres_11'; ./docker/down.sh && ./docker/up.sh
export STACK_ID='postgres_12'; ./docker/down.sh && ./docker/up.sh
