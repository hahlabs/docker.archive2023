#!/bin/bash
#usage ./buid-run.sh <image-tag>  ex/ alpha-0.1.12 or lts-3

../scripts/docker-build.sh
. .env
echo "Docker container:" $CONTAINER_NAME $IMAGE_TAG
docker run -dit \
     -w /home/hahlabs  \
     --mount type=bind,source="$(pwd)",target=/app  \
     --name $CONTAINER_NAME $IMAGE_TAG "/bin/bash"

# docker exec -it `docker ps | sed -n /$CONTAINER_NAME/p  | sed -e 's/\(^[[:xdigit:]]\{12\}\).*$/\1/g'` /bin/bash
#Same...
#docker exec -it $CONTAINER_NAME /bin/bash