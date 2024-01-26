#!/bin/bash

#docker login -u bjdgyc
ver=v0.0.1

#> build.log 2>&1
docker buildx build -t bjdgyc/dcross --progress=plain \
  --build-arg Commit=$(git rev-parse HEAD) --build-arg Ver=$ver .

docker tag bjdgyc/dcross:latest bjdgyc/dcross:$ver

exit 0

docker push bjdgyc/dcross:$ver
docker push bjdgyc/dcross:latest
