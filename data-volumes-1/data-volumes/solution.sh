#!/usr/bin/env bash

function cleanup
{
    docker rm -f jenkins-1 jenkins-2
}

trap cleanup EXIT
cleanup

echo start et par jenkins med delt filsystem
docker run -P -d --name jenkins-1 -v /var/jenkins_home jenkins
docker run -P -d --name jenkins-2 --volumes-from jenkins-1 jenkins

docker stop jenkins-1
docker rm -v jenkins-1

echo Hvad er der paa jenkins-2
docker exec jenkins-2 ls /var/jenkins_home


