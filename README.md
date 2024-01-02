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
3. create the file 