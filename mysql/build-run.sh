#!/bin/bash
#usage ./buid-run.sh <image-tag>  ex/ alpha-0.1.12 or lts-3
docker-build.sh

docker run -ditp 3306:3306 \
     -w /home/hahlabs \
     --name mysql-db hahlabs/mysql:wip

docker exec -it `docker ps -lq` /bin/bash