
FROM crazymax/osxcross:latest-ubuntu AS osxcross
FROM goreleaser/goreleaser:latest AS goreleaser
FROM golang:1.21-bookworm AS golang


#FROM ubuntu:22.04
FROM debian:bookworm
#FROM debian:bullseye

LABEL maintainer="github.com/bjdgyc"

ARG Commit
ARG Ver

ENV GOPATH=/go
ENV GOTOOLCHAIN=local

ENV PATH="/osxcross/bin:/usr/local/go/bin:$PATH"
ENV LD_LIBRARY_PATH="/osxcross/lib:$LD_LIBRARY_PATH"

#RUN --mount=type=bind,from=osxcross,source=/osxcross,target=/osxcross
#COPY --from=osxcross / /
#COPY --from=osxcross /osxsdk /osxsdk

COPY --from=osxcross /osxcross /osxcross
COPY --from=goreleaser /usr/bin/goreleaser /usr/bin/goreleaser
COPY --from=golang /usr/local/go /usr/local/go



COPY init.sh /tmp/
COPY soft/upx-4.2.2-amd64_linux.tar.xz /tmp/

RUN sh /tmp/init.sh


CMD ["cat","/etc/myinfo"]