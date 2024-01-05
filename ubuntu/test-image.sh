#!/bin/bash
. .env
docker run -dit --name $CONTAINER_NAME $IMAGE_TAG:dev
docker exec -it $CONTAINER_NAME /bin/bash