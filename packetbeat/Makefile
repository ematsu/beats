
BEATNAME?=packetbeat
BEAT_DESCRIPTION?=A network analyzer tool that sends data to Elasticsearch.
SYSTEM_TESTS=true
TEST_ENVIRONMENT=false
TARGETS="linux/amd64 linux/386 linux/arm linux/arm64 linux/mips linux/mips64 linux/mipsle linux/mips64le linux/ppc64le"
TARGETS_OLD=""
CGO=true

include ../libbeat/scripts/Makefile

.PHONY: with_pfring
with_pfring:
	go build --tags havepfring

# This is called by the beats packer before building starts
.PHONY: before-build
before-build:

.PHONY: benchmark
benchmark:
	go test -short -bench=. ./... -cpu=2
