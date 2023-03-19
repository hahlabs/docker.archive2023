#!/bin/bash
#usage ./buid-run.sh <image-tag>  ex/ alpha-0.1.12 or lts-3

# docker-build source .env and set up parameters
. docker-build.sh

docker build -t $IMAGE_TAG .
docker run -ditp 4200:4200 -p 8101:8101 -p 9005:9005\
     -w /home/hahlabs \
     --name $CONTAINER_NAME $IMAGE_TAG

docker exec -it `docker ps -lq` /bin/bash