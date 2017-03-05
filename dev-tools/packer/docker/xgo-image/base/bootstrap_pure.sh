#!/bin/bash
#
# Contains the Go tool-chain pure-Go bootstrapper, that as of Go 1.5, initiates
# not only a few pre-built Go cross compilers, but rather bootstraps all of the
# supported platforms from the origin Linux amd64 distribution.
#
# Usage: bootstrap.sh
#
# Needed environment variables:
#   FETCH          - Remote file fetcher and checksum verifier (injected by image)
#   ROOT_DIST      - 64 bit Linux Go binary distribution package
#   ROOT_DIST_SHA1 - 64 bit Linux Go distribution package checksum
set -e

# Download, verify and install the root distribution
$FETCH $ROOT_DIST  $ROOT_DIST_SHA1

tar -C /usr/local -xzf `basename $ROOT_DIST`
rm -f `basename $ROOT_DIST`

export GOROOT=/usr/local/go
export GOROOT_BOOTSTRAP=$GOROOT

# Pre-build all guest distributions based on the root distribution
echo "Bootstrapping linux/386..."
GOOS=linux GOARCH=386 CGO_ENABLED=1 go install std

echo "Bootstrapping linux/arm..."
GOOS=linux GOARCH=arm CGO_ENABLED=1 CC=arm-linux-gnueabihf-gcc go install std

echo "Bootstrapping linux/arm64..."
GOOS=linux GOARCH=arm64 CGO_ENABLED=1 CC=aarch64-linux-gnu-gcc go install std

echo "Bootstrapping linux/mips..."
GOOS=linux GOARCH=mips CGO_ENABLED=1 CC=mips-linux-gnu-gcc go install std

echo "Bootstrapping linux/mipsle..."
GOOS=linux GOARCH=mipsle CGO_ENABLED=1 CC=mipsel-linux-gnu-gcc go install std

echo "Bootstrapping linux/mips64..."
GOOS=linux GOARCH=mips64 CGO_ENABLED=1 CC=mips64-linux-gnuabi64-gcc go install std

echo "Bootstrapping linux/mips64le..."
GOOS=linux GOARCH=mips64le CGO_ENABLED=1 CC=mips64el-linux-gnuabi64-gcc go install std

echo "Bootstrapping linux/ppc64le..."
GOOS=linux GOARCH=ppc64le CGO_ENABLED=1 CC=powerpc64le-linux-gnu-gcc go install std
