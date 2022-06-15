#!/bin/bash
#usage ./buid-run.sh <image-tag>  ex/ alpha-0.1.12 or lts-3
. docker-build.sh

docker run -ditp 8082:8082 -p 9000:9000\
     -w /home/hahlabs  \
     --name $CONTAINER_NAME $IMAGE_TAG "/bin/bash"

docker exec -it `docker ps -q -l` "/bin/bash"