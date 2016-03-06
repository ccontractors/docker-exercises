#!/usr/bin/env bash

xterm -hold -e "docker events ; read" &
xterm -hold -e "docker run -d ubuntu ; read" &
xterm -hold -e "docker run -d jenkins ; read" &

