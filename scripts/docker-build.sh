# usage docker-build.sh <tag> <- default "wip"
# source file, to source .env in local environment that set $DOCKER_ID, $IMAGE_NAME
# build typical tag $DOCKER_ID/$IMAGE_NAME:wip

. .env
if [ -z "$1" ] 
then 
  IMAGE_TAG=$DOCKER_ID/$IMAGE_NAME:wip
else
  IMAGE_TAG=$DOCKER_ID/$IMAGE_NAME:$1
fi
echo "Building image:" $IMAGE_TAG
docker buildx build -qt $IMAGE_TAG .
