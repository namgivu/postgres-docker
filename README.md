# postgres-auth-start
Try all kind of postgres authorization
ref. https://hub.docker.com/_/postgres

`00`  simplest docker run that work - default postgres user and database to be postgres
`00b` dropping -e POSTGRES_PASSWORD will make it fail
`00c` try all kind of os user
      we aim at running with no user and no password
      
`01`  custom user    for psql as uuu
`01b` custom user+db for psql as uuu/ddd
      note db         :postgres always created beside our custom db
           os user db :postgres always created beside our custom user
