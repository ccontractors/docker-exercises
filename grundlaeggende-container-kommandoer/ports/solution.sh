#!/usr/bin/env bash

function cleanup
{
    echo Removing any previous containers
    docker rm -f ports1
    docker rm -f ports2
    docker rm -f ports3
    docker rm -f ports4
}

cleanup

# Start en jenkins ved navn ports1 i baggrunden og guestport 8080 eksponeret på hostport 8080
echo Start ports1
docker run -d --name ports1 -p 8080:8080 jenkins
# Kontroller at du kan tilgå containeren med Tilgå jenkins i en browser fra hosten (http://HOST:8080)

# Start en jenkins ved navn ports2 baggrunden på containerens (guest) port 8080 eksponeres på hostens port 9090
echo Start ports2
docker run --name ports2 -d -p 9090:8080 jenkins

# Start en jenkins ved navn ports3 i baggrunden og eksponér alle porte dynamis3
echo Start ports3
docker run --name ports3 -d -P jenkins

# Start en jenkins ved navn ports4 i baggrunden og port 8080 dynamisk
echo Start ports4
docker run --name ports4 -d -p 8080 jenkins


docker inspect --format='{{(index (index .NetworkSettings.Ports "8080/tcp") 0).HostPort}}' ports1
docker inspect --format='{{(index (index .NetworkSettings.Ports "8080/tcp") 0).HostPort}}' ports2
docker inspect --format='{{(index (index .NetworkSettings.Ports "8080/tcp") 0).HostPort}}' ports3
docker inspect --format='{{(index (index .NetworkSettings.Ports "8080/tcp") 0).HostPort}}' ports4

docker ps
