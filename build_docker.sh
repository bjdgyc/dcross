#!/bin/bash

#docker login -u bjdgyc
ver=v0.0.1

#> build.log 2>&1
docker buildx build -t registry.cn-hangzhou.aliyuncs.com/bjdgyc/dcross --progress=plain \
  --build-arg Commit=$(git rev-parse HEAD) --build-arg Ver=$ver .

docker tag registry.cn-hangzhou.aliyuncs.com/bjdgyc/dcross:latest registry.cn-hangzhou.aliyuncs.com/bjdgyc/dcross:$ver

#exit 0

docker push registry.cn-hangzhou.aliyuncs.com/bjdgyc/dcross:$ver
docker push registry.cn-hangzhou.aliyuncs.com/bjdgyc/dcross:latest
