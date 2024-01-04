#!/bin/bash
. .env
docker run -ditp 3306:3306 --name $CONTAINER_NAME $IMAGE_TAG:dev
docker exec -it $CONTAINER_NAME /bin/bash