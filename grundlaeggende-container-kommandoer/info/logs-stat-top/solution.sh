#!/usr/bin/env bash
source ~/.profile

echo Start en navngiven jenkins i baggrunden, og eksponer containerens port 8080 på hostens port 9999
docker run --name min-jenkins -d -p 9999:8080 jenkins

echo Monitorer logs så du hele tiden ser hvad der sker i jenkins
xterm -hold -e "docker logs -f min-jenkins ; read" &

echo Vent lidt og ryd op
sleep 40
docker stop min-jenkins
docker rm min-jenkins
