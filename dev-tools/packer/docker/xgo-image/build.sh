#!/bin/sh

docker build --rm=true -t tudorg/xgo-base base/ && \
    docker build --rm=true -t tudorg/xgo go/ &&
    docker build --rm=true -t tudorg/beats-builder beats-builder/
