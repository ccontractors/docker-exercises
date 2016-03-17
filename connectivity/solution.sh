#!/bin/bash

function  cleanup
{
 docker rm -f my-postgres
}
trap cleanup EXIT
cleanup  

docker run -d --name my-postgres -e POSTGRES_USER=myuser -e POSTGRES_PASSWORD=mypassword -e POSTGRES_DB=mydb postgres

# This is the exposed volume
docker run --volumes-from my-postgres postgres ls /var/lib/postgresql/data

docker run --volumes-from my-postgres -v $PWD/backup:/host postgres cp -r /var/lib/postgresql/data /host

