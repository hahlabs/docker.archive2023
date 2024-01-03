#!/bin/bash
#usage ./buid-run <image-tag>  ex/ alpha-0.1.12 or lts-3
TAG=alpha-00.05.01
# docker-build source .env and set up parameters
echo "Building docker container: " $CONTAINER_NAME $IMAGE_TAG 
../scripts/docker-build.sh
../scripts/docker-tag.sh $TAG push
. .env
echo  $CONTAINER_NAME $IMAGE_TAG " Built [OK]"
