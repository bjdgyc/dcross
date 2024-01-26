#!/usr/bin/env bash

set -x
set -e

echo $CN

echo "dcross build info:" >/etc/myinfo
echo $Ver >>/etc/myinfo
echo $Commit >>/etc/myinfo

cat >/etc/profile.d/gocross.sh <<EOF
#export PATH=/usr/local/bin:\$PATH
#export LANG=en_US.UTF-8
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias tailf='tail -f'
EOF

if [[ $CN == "yes" ]]; then
  #bookworm
  sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources
  #bullseye
  #sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
fi

dpkg --add-architecture arm64
#dpkg --add-architecture i386
#dpkg --add-architecture armel
#dpkg --add-architecture armhf
#dpkg --add-architecture mips
#dpkg --add-architecture mipsel
#dpkg --add-architecture powerpc
#dpkg --add-architecture ppc64el

#ubuntu
#sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list

# --no-install-recommends
apt-get update

apt-get install -y -q clang lld libc6-dev \
  ccache cmake patch git-core openssl curl wget tar xz-utils lzma vim llvm \
  binfmt-support binutils-multiarch build-essential

apt-get install -y -q crossbuild-essential-arm64

#  crossbuild-essential-i386
#  crossbuild-essential-armel
#  crossbuild-essential-armhf
#  crossbuild-essential-mips
#  crossbuild-essential-mipsel
#  crossbuild-essential-powerpc
#  crossbuild-essential-ppc64el

#ubuntu
#apt-get install -y -q gcc-aarch64-linux-gnu g++-aarch64-linux-gnu
#  gcc-mips64el-linux-gnuabi64 mingw-w64 gcc-mingw-w64 g++-mingw-w64

cd /tmp
#https://github.com/upx/upx/releases/download/v4.2.2/upx-4.2.2-amd64_linux.tar.xz
tar xf upx-4.2.2-amd64_linux.tar.xz
cp upx-4.2.2-amd64_linux/upx /usr/local/bin/

#清理缓存
apt-get -y autoremove
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
