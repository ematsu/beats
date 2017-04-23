#!/bin/bash

set -e

echo "Fetching go-daemon"
git clone https://github.com/tsg/go-daemon.git

cd /go-daemon

echo "Compiling for linux/amd64.."
cc god.c -m64 -o god-linux-amd64 -lpthread -static

echo "Compiling for linux/i386.."
gcc god.c -m32 -o god-linux-386 -lpthread -static

echo "Compiling for linux/arm.."
arm-linux-gnueabihf-gcc god.c -o god-linux-arm -lpthread -static

echo "Compiling for linux/arm64.."
aarch64-linux-gnu-gcc god.c -o god-linux-arm64 -lpthread -static

echo "Compiling for linux/mips.."
mips-linux-gnu-gcc god.c -o god-linux-mips -lpthread -static

echo "Compiling for linux/mips64.."
mips64-linux-gnuabi64-gcc god.c -o god-linux-mips64 -lpthread -static

echo "Compiling for linux/mipsle.."
mipsel-linux-gnu-gcc god.c -o god-linux-mipsle -lpthread -static

echo "Compiling for linux/mips64le.."
mips64el-linux-gnuabi64-gcc god.c -o god-linux-mips64le -lpthread -static

echo "Compiling for linux/mips64le.."
powerpc64le-linux-gnu-gcc god.c -o god-linux-ppc64le -lpthread -static

echo "Copying to host.."
cp god-linux-amd64 god-linux-386 god-linux-arm god-linux-arm64 god-linux-mips god-linux-mips64 god-linux-mipsle god-linux-mips64le god-linux-ppc64le /build/
