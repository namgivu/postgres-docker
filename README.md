# postgres-auth-start
Log in postgres using user+pass or using peer login with host/ip+OS-user
ref. https://hub.docker.com/_/postgres

`00`  simplest docker run that work - default postgres user and database to be postgres
`00b` dropping -e POSTGRES_PASSWORD will make it fail
`00c` try all kind of os user
      we aim at running with no user and no password
      
`01`  custom user+pass for psql
