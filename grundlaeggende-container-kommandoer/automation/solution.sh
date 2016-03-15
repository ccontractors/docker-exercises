#!/usr/bin/env bash

echo Start en navngiven jenkins i baggrunden med porte eksponeret i den dynamiske port range
docker run -d -P --name en-jenkins-container jenkins

echo Vent lidt indtil Jenkins starter ...
sleep 10

echo Load jenkins ind i firefox ved at inspicere docker efter den dynamiske port
firefox dockerhost.example.org:$(docker inspect --format='{{(index (index .NetworkSettings.Ports "8080/tcp") 0).HostPort}}' en-jenkins-container)

