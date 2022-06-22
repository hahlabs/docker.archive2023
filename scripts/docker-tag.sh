#!/bin/bash
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
