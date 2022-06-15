. .env
if [ -z "$1" ] 
then 
  IMAGE_TAG=$DOCKER_ID/$IMAGE_NAME:wip
else
  IMAGE_TAG=$DOCKER_ID/$IMAGE_NAME:$1
fi

docker build -t $IMAGE_TAG .
export IMAGE_TAG