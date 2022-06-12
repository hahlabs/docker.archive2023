#!/bin/bash
#usage ./buid-run.sh <image-tag>  Ex/ alpha-0.1.12 or lts-3
if [ -z "$1" ] 
then 
  IMAGE_TAG=hahlabs/mysql:1.x
else
  IMAGE_TAG=hahlabs/mysql:$1
fi

docker build -t $IMAGE_TAG .
docker run -ditp 3306:3306 \
     -w /home/hahlabs -u 1000:1000\
     --name mysql-db $IMAGE_TAG