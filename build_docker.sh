#!/bin/bash

#docker login -u bjdgyc
ver=$(cat version)

server="docker.io"

#> build.log 2>&1
docker buildx build -t $server/bjdgyc/dcross --progress=plain \
  --build-arg Commit=$(git rev-parse HEAD) --build-arg Ver=$ver \
  --build-arg CN=yes .

docker tag $server/bjdgyc/dcross:latest $server/bjdgyc/dcross:$ver

exit 0

docker push $server/bjdgyc/dcross:$ver
docker push $server/bjdgyc/dcross:latest
