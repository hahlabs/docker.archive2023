# docker
Docker &amp; Kubernetes factories

Docker Login : hahlabs

# Releases:
## Alpha-00.03.01: Latest , dev
Highlights:
1. Updated to latest Ubuntu 22.04 and major enhancements and cleansing to Dockerfiles
2. hahlabs user takes uid/gid 15286 to avoid conflicts with AWS or other container operator users
3. Upgrades to Angular 17.x, nvm, npm, firebase 13.x, MySQL 8.x, php 8.x, laravel 10.x, nginx

# Build and Deploy to AWS ECS
1. Configure environment variable DOCKER_DIR in aws-ecs
2. Configure connection to AWS , aws configure
3. create the file ~/docker-hahlabs-access-key.txt <- populate with DockerHub Access Key>
4. run the script ./hahlabs-cicd.sh [build <tag>] , ex. ./hahlabs-cicd.sh build alpha-00.04.06
  4.1 clear docker registry cache
  4.2 run 3 builds for mysql, laravel, and angular
  4.3 push 3 images to dockerhub registry
  4.4 import 3 images to AWS ECR registry
  4.5 create ECS task def
  4.6 create ECS service
  

NOTE : do not map ports for WSL 
docker run -dit \
      --name $CONTAINER_NAME $IMAGE_TAG

 docker exec -it `docker ps | sed -n /$CONTAINER_NAME/p  | sed -e 's/\(^[[:xdigit:]]\{12\}\).*$/\1/g'` /bin/bash
 docker exec -it $CONTAINER_NAME /bin/bash