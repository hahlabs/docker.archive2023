docker logout
docker rm -f $(docker ps -aq)
docker image rm -f $(docker images -q)
cat ~/docker-hahlabs-access-key.txt| docker login --username hahlabs --password-stdin
docker pull -q hahlabs/mysql:dev & \
docker pull -q hahlabs/laravel:dev & \
docker pull -q hahlabs/angular:dev  && fg

docker logout

docker tag hahlabs/mysql:dev 479788010133.dkr.ecr.us-west-2.amazonaws.com/hahlabs/mysql:dev
docker tag hahlabs/laravel:dev 479788010133.dkr.ecr.us-west-2.amazonaws.com/hahlabs/laravel:dev
docker tag hahlabs/angular:dev 479788010133.dkr.ecr.us-west-2.amazonaws.com/hahlabs/angular:dev

docker push -q 479788010133.dkr.ecr.us-west-2.amazonaws.com/hahlabs/mysql:dev & \
docker push -q 479788010133.dkr.ecr.us-west-2.amazonaws.com/hahlabs/laravel:dev & \
docker push -q 479788010133.dkr.ecr.us-west-2.amazonaws.com/hahlabs/angular:dev && fg