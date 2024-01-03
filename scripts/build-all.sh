#!/bin/bash
docker rm -f $(docker ps -aq)
docker rmi -f $(docker images -q)
docker system prune -af

cd ../ubuntu && ./build-run
cd ../mysql && ./build-run & 
cd ../laravel && ./build-run & 
cd ../angular && ./build-run &

jobs