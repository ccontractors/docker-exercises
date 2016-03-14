#!/usr/bin/env bash
source ~/.profile

docker run -d --name min-jenkins -p 5678:8080 jenkins


# I denne løsning afvikles kommandoerne direkte, istedet for at gøre det mens man er logget ind
# Hvis man er logget ind, skal man køre kommandoerne i kommandoprompten i jenkins,
# dvs først gøre:
# docker exec -ti jenkins bash

# og så

# hvilken bruger er jeg
id

# skift til hjemmekatalog
cd

# inspicer jobs katalog
cd /var/lib/jenkins_home/jobs
ls

# Lav et par jobs via UI

# Se de jobs du har lavet i filsystemet
ls

docker exec min-jenkins rm -rf /var/lib/jenkins_home/jobs