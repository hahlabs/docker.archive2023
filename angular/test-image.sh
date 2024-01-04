#!/bin/bash
. .env
docker run -ditp 8101:8101 --name $CONTAINER_NAME $IMAGE_TAG:dev
docker exec -it $CONTAINER_NAME /bin/bash