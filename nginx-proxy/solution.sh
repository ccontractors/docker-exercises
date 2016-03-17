#!/bin/bash

docker run -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
docker run -e  VIRTUAL_HOST=jenkins.dockerhost.example.org -e VIRTUAL_PORT=8080 -d jenkins



