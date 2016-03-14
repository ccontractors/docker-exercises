#!/usr/bin/env bash
source ~/.profile

function setup
{
    docker run -d --name killMe jenkins

    docker run -d --name killMeToo jenkins
    docker run -d --name killMeTheHardWay jenkins
    docker stop killMe

    docker run -d jenkins
    docker run -d jenkins
    docker run -d jenkins
}

setup

echo Slet en stoppet container
docker rm killMe

echo Slet en kørende container
docker stop killMeToo
docker rm killMeToo

echo Alternativt
docker rm -f killMeTheHardWay

echo Slet alt
docker rm -f $(docker ps -aq)


