#!/usr/bin/env bash

function cleanup
{
    docker rm -f micro-ci base-jenkins
    rm -rf jobs
}

trap cleanup EXIT
cleanup

# Solution starter her:

echo start jenkins
docker run -d -P --name base-jenkins jenkins

echo vent på at jenkins er helt startet op
sleep 10
echo se i logs for at sikre den er startet op
docker logs base-jenkins

echo lav et job og afslut firefox
firefox dockerhost.example.org:$(docker inspect --format='{{(index (index .NetworkSettings.Ports "8080/tcp") 0).HostPort}}' base-jenkins)

echo kopier indholdet ud af jenkins
docker cp base-jenkins:/var/jenkins_home/jobs jobs
chmod -R a+rw jobs

echo stop jenkins
docker stop base-jenkins

# her kunne man gemme opsætning i filsystem / repositorie

echo start ny jenkins med opsætning fra den gamle jenkins

docker run -d --name micro-ci -v $PWD/jobs:/var/jenkins_home/jobs -P jenkins

echo Vent lidt. Sluk firefox naar du er klar
sleep 5

firefox dockerhost.example.org:$(docker inspect --format='{{(index (index .NetworkSettings.Ports "8080/tcp") 0).HostPort}}' micro-ci)
