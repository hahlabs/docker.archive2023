docker logout
docker rm -f $(docker ps -aq)
docker image rm -f $(docker images -q)
cat /projects/docker-hahlabs-access-key.txt| docker login --username hahlabs --password-stdin
docker pull hahlabs/mysql:dev & \
docker pull hahlabs/laravel:dev & \
docker pull hahlabs/angular:dev  && fg

docker logout
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 479788010133.dkr.ecr.us-west-2.amazonaws.com
docker tag hahlabs/mysql:dev 479788010133.dkr.ecr.us-west-2.amazonaws.com/hahlabs/mysql:dev
docker tag hahlabs/laravel:dev 479788010133.dkr.ecr.us-west-2.amazonaws.com/hahlabs/laravel:dev
docker tag hahlabs/angular:dev 479788010133.dkr.ecr.us-west-2.amazonaws.com/hahlabs/angular:dev

docker push 479788010133.dkr.ecr.us-west-2.amazonaws.com/hahlabs/mysql:dev & \
docker push 479788010133.dkr.ecr.us-west-2.amazonaws.com/hahlabs/laravel:dev & \
docker push 479788010133.dkr.ecr.us-west-2.amazonaws.com/hahlabs/angular:dev && fg