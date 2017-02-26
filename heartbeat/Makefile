BEATNAME=heartbeat
BEAT_DESCRIPTION?=Ping remote services for availability and log results to Elasticsearch or send to Logstash.
SYSTEM_TESTS=false
TEST_ENVIRONMENT=false
TARGETS="linux/amd64 linux/386 linux/arm linux/arm64 linux/mips linux/mips64 linux/mipsle linux/mips64le linux/ppc64le"
CGO=true

# Path to the libbeat Makefile
-include ../libbeat/scripts/Makefile

# This is called by the beats packer before building starts
.PHONY: before-build
before-build:

# Collects all dependencies and then calls update
.PHONY: collect
collect:
