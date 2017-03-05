# Go cross compiler (xgo): Base cross-compilation layer
# Copyright (c) 2014 Péter Szilágyi. All rights reserved.
#
# Released under the MIT license.

FROM ubuntu:16.04

MAINTAINER Eiji MATSUMOTO <toudaiman@gmail.com>

# Configure the Go environment, since it's not going to change
ENV PATH   /usr/local/go/bin:$PATH
ENV GOPATH /go


# Inject the remote file fetcher and checksum verifier
ADD fetch.sh /fetch.sh
ENV FETCH /fetch.sh
RUN chmod +x $FETCH


# Make sure apt-get is up to date and dependent packages are installed
RUN \
  dpkg --add-architecture i386 &&                                                    \
  apt-get update &&                                                                  \
  apt-get install -y automake autogen build-essential ca-certificates                \
    libc6-dev-i386 linux-libc-dev:i386                                               \
    gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf libc6-dev-armhf-cross                \
    gcc-aarch64-linux-gnu g++-aarch64-linux-gnu libc6-dev-arm64-cross                \
    gcc-mips-linux-gnu g++-mips-linux-gnu libc6-dev-mips-cross                       \
    gcc-mipsel-linux-gnu g++-mipsel-linux-gnu libc6-dev-mipsel-cross                 \
    gcc-mips64-linux-gnuabi64 g++-mips64-linux-gnuabi64 libc6-dev-mips64-cross       \
    gcc-mips64el-linux-gnuabi64 g++-mips64el-linux-gnuabi64 libc6-dev-mips64el-cross \
    gcc-powerpc64le-linux-gnu g++-powerpc64le-linux-gnu libc6-dev-ppc64el-cross      \
    gcc-5-multilib  g++-5-multilib                                                   \
    libtool libxml2-dev libssl-dev swig pkg-config patch                        \
    make xz-utils cpio wget zip unzip p7zip git mercurial bzr texinfo help2man  \
    binutils-multiarch rsync                                                    \
    --no-install-recommends

# Inject the Go package downloader and tool-chain bootstrapper
ADD bootstrap.sh /bootstrap.sh
ENV BOOTSTRAP /bootstrap.sh
RUN chmod +x $BOOTSTRAP

# Inject the new Go root distribution downloader and secondary bootstrapper
ADD bootstrap_pure.sh /bootstrap_pure.sh
ENV BOOTSTRAP_PURE /bootstrap_pure.sh
RUN chmod +x $BOOTSTRAP_PURE

# Inject the C dependency cross compiler
ADD build_deps.sh /build_deps.sh
ENV BUILD_DEPS /build_deps.sh
RUN chmod +x $BUILD_DEPS

# Inject the container entry point, the build script
ADD build.sh /build.sh
ENV BUILD /build.sh
RUN chmod +x $BUILD

ENTRYPOINT ["/build.sh"]
