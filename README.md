# docker images for postgres
postgres     ref. https://hub.docker.com/r/_/postgres
with postgis ref. https://hub.docker.com/r/mdillon/postgis
```bash
docker pull          postgis:10;
docker pull          postgis:11;
docker pull  mdillon/postgis:10;
docker pull  mdillon/postgis:11;
```


# postgres from docker image with default login mode
```bash
: /path/to/this/project
export ENV='postgis_10'; ./docker/down.sh && ./docker/up.sh
export ENV='postgis_11'; ./docker/down.sh && ./docker/up.sh
