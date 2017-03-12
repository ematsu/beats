# Go cross compiler (xgo): Go 1.7.4 layer
# Copyright (c) 2014 Péter Szilágyi. All rights reserved.
#
# Released under the MIT license.

FROM tudorg/xgo-base

MAINTAINER Tudor Golubenco <tudor@elastic.co>

# Configure the root Go distribution and bootstrap based on it
RUN \
  export ROOT_DIST="https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz" && \
  export ROOT_DIST_SHA1="a93fe8fc245e3554f956bc823f30ef4eb23c2068" && \
  \
  $BOOTSTRAP_PURE
