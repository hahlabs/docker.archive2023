#!/bin/bash

# usage : ./docker-tag.sh <target-tag>  <command> 
# this command takes the image from wip tag (local), 
# NOTE: you need to populate $DOCKER_ID, $IMAGE_NAME in .env file in local directory 
# 1. replaces tag wip to <$1>
# 2. add dev tag to the image
# 3. removes the wip tag from the image
# 4. if command "push" was provided; it pushes it to the docker registry both target tag and dev (you need to login first)

. .env
docker tag $DOCKER_ID/$IMAGE_NAME:wip $DOCKER_ID/$IMAGE_NAME:$1
docker tag $DOCKER_ID/$IMAGE_NAME:wip $DOCKER_ID/$IMAGE_NAME:dev
echo "tagged " $DOCKER_ID/$IMAGE_NAME:$1 " and " $DOCKER_ID/$IMAGE_NAME:dev "[ok]"
docker rmi -f $DOCKER_ID/$IMAGE_NAME:wip
docker images | grep $DOCKER_ID/$IMAGE_NAME
if [ "$2" == "push" ]; then
 docker push $DOCKER_ID/$IMAGE_NAME:dev
 docker push $DOCKER_ID/$IMAGE_NAME:$1
fi
