
BEAT_NAME?=packetbeat
BEAT_DESCRIPTION?=Packetbeat analyzes network traffic and sends the data to Elasticsearch.
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

# Collects all dependencies and then calls update
.PHONY: collect
collect: fields imports

.PHONY: fields
fields:
	cat _meta/fields_base.yml > _meta/fields.yml
	cat protos/*/_meta/fields.yml >> _meta/fields.yml

.PHONY: benchmark
benchmark:
	go test -short -bench=. ./... -cpu=2

.PHONY: create-tcp-protocol
create-tcp-protocol:
	python scripts/create_tcp_protocol.py

# Generates imports for all modules and metricsets
.PHONY: imports
imports:
	mkdir -p include
	python ${ES_BEATS}/packetbeat/scripts/generate_imports.py ${BEAT_PATH} > include/list.go
