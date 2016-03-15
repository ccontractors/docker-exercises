#!/usr/bin/env bash

# Ignore this. Solution starts below
function cleanup
{
    echo "--> Oprydning ved start og slut"
    echo "    slet aa"
    docker rm -vf aa || true
    echo "    slet bb"
    docker rm -vf bb || true
    rm -rf job-from-a
}

function waitUntillJenkinsIsReady
{
    sleep 30
}

function monitorLogs
{
    xterm -hold -e "docker logs -f aa ; read" &
    xterm -hold -e "docker logs -f bb ; read" &
}

trap cleanup EXIT
cleanup

#Solution starts here
echo "--> Starter jenkins aa"
docker run --name aa -d -p 9001:8080 jenkins
docker run --name bb -d -p 9002:8080 jenkins
monitorLogs
waitUntillJenkinsIsReady

echo "--> opretter job på aa"
# Fake at man laver et job via gui ved at kopiere jobbet direkte ind i a
docker cp some-job/ aa:/var/jenkins_home/jobs/some-job
echo "--> se job på aa"
docker exec aa ls /var/jenkins_home/jobs/

echo "--> Starter jenkins bb"

echo "--> Kopier job fra aa til host"
docker cp aa:/var/jenkins_home/jobs/some-job job-from-a
echo "--> Kopier job fra host til bb"
docker cp job-from-a bb:/var/jenkins_home/jobs/some-job

echo "--> Se jobbet på bb"
docker exec bb ls /var/jenkins_home/jobs
