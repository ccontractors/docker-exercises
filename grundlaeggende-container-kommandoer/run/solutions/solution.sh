#!/usr/bin/env bash
source ~/.profile

xterm -hold -e "docker run jenkins ; read" &
xterm -hold -e "docker run ubuntu ; read" &
xterm -hold -e "docker run --name min-jenkins jenkins ; read" &
xterm -hold -e "docker run ubuntu echo Hello world ; read" &

