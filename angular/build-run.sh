#!/bin/bash
DOCKER_ID="hahlabs"
IMAGE_NAME="angular"
CONTAINER_NAME="hahlabs-view"

if [ -z "$1" ] 
then 
  IMAGE_TAG=$DOCKER_ID/$IMAGE_NAME:1.x
else
  IMAGE_TAG=$DOCKER_ID/$IMAGE_NAME:$1
fi

docker build -t $IMAGE_TAG .
docker run -ditp 4200:4200 -p 80:80 -p 8081:8081 -p 9005:9005\
     -w /home/hahlabs -u 1000:1000 \
     --name $CONTAINER_NAME $IMAGE_TAG
