#!/bin/bash
docker rm -f $(docker ps -aq)
docker rmi -f $(docker images -q)
docker system prune -af
echo "HAHLABS docker builds errors $(date)" > ../scripts/hahlabs-build-run.err
echo "HAHLABS docker builds starts $(date)" > ../scripts/hahlabs-build-run.log
echo "Build Ubuntu base image...Please wait"
cd ../ubuntu && ./build-run >> ../scripts/hahlabs-build-run.log 2>> ../scripts/hahlabs-build-run.err < /dev/null
cd ../mysql && nohup ./build-run >> ../scripts/hahlabs-build-run.log 2>> ../scripts/hahlabs-build-run.err < /dev/null & 
cd ../laravel && nohup ./build-run >> ../scripts/hahlabs-build-run.log 2>> ../scripts/hahlabs-build-run.err < /dev/null & 
cd ../angular && nohup ./build-run >> ../scripts/hahlabs-build-run.log 2>> ../scripts/hahlabs-build-run.err < /dev/null &

jobs