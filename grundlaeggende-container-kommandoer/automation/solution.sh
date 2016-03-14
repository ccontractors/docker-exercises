#!/usr/bin/env bash
source ~/.profile

echo Start En navngiven jenkins i baggrunden med porte eksponerer i den dynamiske port range
docker run -d -P --name en-jenkins-container jenkins

echo Venter lidt på at Jenkins starter
sleep 10

echo Load jenkins ind i firefox ved at inspicere docker efter den dynamiske port
firefox dockerhost.example.org:$(docker inspect --format='{{(index (index .NetworkSettings.Ports "8080/tcp") 0).HostPort}}' en-jenkins-container)

