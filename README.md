## DCross

## 简介

docker cross 交叉编译工具

## 仓库

> - github: https://github.com/bjdgyc/dcross
> - gitee: https://gitee.com/bjdgyc/dcross

## 构建

```
sh build_docker.sh
```

## 支持架构

| 支持  |   系统    |    架构    |              c              |          c++          |             CC              |           CXX           |                       备注                       |
|:---:|:-------:|:--------:|:---------------------------:|:---------------------:|:---------------------------:|:-----------------------:|:----------------------------------------------:|
| [x] |  linux  |  amd64   |             gcc             |          g++          |    x86_64-linux-gnu-gcc     |  x86_64-linux-gnu-g++   |                                                |
| [x] |  linux  |  arm64   |    gcc-aarch64-linux-gnu    | g++-aarch64-linux-gnu |    aarch64-linux-gnu-gcc    |  aarch64-linux-gnu-g++  |                                                |
| [x] | darwin  |  amd64   |                             |                       |          o64-clang          |       o64-clang++       |                                                |
| [x] | darwin  |  arm64   |                             |                       |         oa64-clang          |      oa64-clang++       |                                                |
| [x] | windows |  amd64   |  mingw-w64  gcc-mingw-w64   |     g++-mingw-w64     |   x86_64-w64-mingw32-gcc    | x86_64-w64-mingw32-g++  | https://launchpad.net/ubuntu/+source/mingw-w64 |
| [ ] | windows |  arm64   |                             |                       |   aarch64-w64-mingw32-gcc   | aarch64-w64-mingw32-g++ | https://launchpad.net/ubuntu/+source/mingw-w64 |
| [ ] |  linux  | mips64le | gcc-mips64el-linux-gnuabi64 |                       | mips64el-linux-gnuabi64-gcc |                         |                                                |

> 不支持
> 386, arm, ppc64le, s390x, mips64le, mips64, mips, mipsle, riscv64, riscv, wasm

## 使用

```
# 国内可使用代理
# -e GOPROXY=https://goproxy.cn
# GOPATH=/go
# release --skip=publish --debug


docker run -it --rm -v $PWD:/app -v /go:/go -w /app bjdgyc/dcross goreleaser build --skip=validate --clean

```

## 其他

```
# 直接使用对应架构编译
# windows/amd64

docker run -it --rm -v $PWD:/app -v /go:/go -w /app -e GOPROXY="https://goproxy.cn" \
  --platform=linux/arm64 golang:1.21-bookworm go build -v
```

## 依赖

```
docker run --rm mplatform/mquery crazymax/osxcross:latest

https://github.com/tpoechtrager/osxcross
https://github.com/crazy-max/docker-osxcross
https://github.com/joseluisq/macosx-sdks
https://github.com/goreleaser/goreleaser
https://github.com/upx/upx
```