#!/usr/bin/env bash
source ~/.profile

function waitUntilCreatedSoICanStopAndRemoveThem
{
    sleep 2
}

xterm -hold -e "docker events ; read" &
xterm -hold -e "docker run -d --name ubuntu ubuntu ; read" &
xterm -hold -e "docker run -d --name jenkins jenkins ; read" &

waitUntilCreatedSoICanStopAndRemoveThem

docker stop jenkins ubuntu && docker rm jenkins ubuntu

