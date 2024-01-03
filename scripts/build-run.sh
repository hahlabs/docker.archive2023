#!/bin/bash
#usage ./buid-run <image-tag>  ex/ alpha-0.1.12 or lts-3

# docker-build source .env and set up parameters

../scripts/docker-build.sh
../scripts/docker-tag.sh alpha-00.05.01
. .env
echo "Docker container: " $CONTAINER_NAME $IMAGE_TAG " Built [OK]"

