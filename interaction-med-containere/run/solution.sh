#!/usr/bin/env bash

echo Udskriv /etc/issue fra et ubuntu image version 14.04
docker run --rm ubuntu:14.04 cat /etc/issue

echo Udskriv /etc/issue fra et ubuntu image version 15.04
docker run --rm ubuntu:15.04 cat /etc/issue

echo Udskriv /etc/issue fra et ubuntu image version latest
docker run --rm ubuntu cat /etc/issue

docker run --rm -ti ubuntu bash
# Then do less /etc/password
