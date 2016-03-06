#!/usr/bin/env bash

xterm -hold -e "docker run jenkins" &
xterm -hold -e "docker run ubuntu" &
xterm -hold -e "docker run --name min-jenkins jenkins" &
xterm -hold -e "docker run ubuntu echo Hello world" &

