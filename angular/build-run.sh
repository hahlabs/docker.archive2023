#!/bin/bash
#usage ./buid-run.sh <image-tag>  ex/ alpha-0.1.12 or lts-3

# docker-build source .env and set up parameters
# docker system prune -f
docker rm -f $(docker ps -a -q)
../scripts/docker-build.sh
. .env
echo "Docker container:" $CONTAINER_NAME $IMAGE_TAG

docker run -ditp 4200:4200 -p 8101:8101 -p 9005:9005\
     -w /home/hahlabs \
     --mount type=bind,source="$(pwd)",target=/app  \
     --name $CONTAINER_NAME $IMAGE_TAG

# docker exec -it `docker ps | sed -n /$CONTAINER_NAME/p  | sed -e 's/\(^[[:xdigit:]]\{12\}\).*$/\1/g'` /bin/bash