BUILDID?=$(shell git rev-parse HEAD)
SNAPSHOT?=yes

makefile_abspath:=$(abspath $(lastword $(MAKEFILE_LIST)))
packer_absdir=$(shell dirname ${makefile_abspath})
beat_abspath=${GOPATH}/src/${BEAT_DIR}


%/deb: ${BUILD_DIR}/god-linux-386 ${BUILD_DIR}/god-linux-amd64 ${BUILD_DIR}/god-linux-arm ${BUILD_DIR}/god-linux-arm64 ${BUILD_DIR}/god-linux-mips ${BUILD_DIR}/god-linux-mips64 fpm-image
	echo Creating DEB packages for $(@D)
	ARCH=386 BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/debian/build.sh
	ARCH=amd64 BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/debian/build.sh
	ARCH=arm BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/debian/build.sh
	ARCH=arm64 BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/debian/build.sh
	ARCH=mips BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/debian/build.sh
	ARCH=mips64 BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/debian/build.sh
	ARCH=mipsle BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/debian/build.sh
	ARCH=mips64le BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/debian/build.sh
	ARCH=ppc64le BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/debian/build.sh

%/rpm: ${BUILD_DIR}/god-linux-386 ${BUILD_DIR}/god-linux-amd64 ${BUILD_DIR}/god-linux-arm ${BUILD_DIR}/god-linux-arm64 ${BUILD_DIR}/god-linux-mips ${BUILD_DIR}/god-linux-mips64 fpm-image
	echo Creating RPM packages for $(@D)
	ARCH=386 BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/centos/build.sh
	ARCH=amd64 BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/centos/build.sh
	ARCH=arm BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/centos/build.sh
	ARCH=arm64 BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/centos/build.sh
	ARCH=mips BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/centos/build.sh
	ARCH=mips64 BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/centos/build.sh
	ARCH=mipsle BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/centos/build.sh
	ARCH=mips64le BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/centos/build.sh
	ARCH=ppc64le BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/centos/build.sh

%/bin:
	echo Creating Linux packages for $(@D)
	ARCH=386 BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/binary/build.sh
	ARCH=amd64 BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/binary/build.sh
	ARCH=arm BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/binary/build.sh
	ARCH=arm64 BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/binary/build.sh
	ARCH=mips BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/binary/build.sh
	ARCH=mips64 BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/binary/build.sh
	ARCH=mipsle BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/binary/build.sh
	ARCH=mips64le BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/binary/build.sh
	ARCH=ppc64le BEAT=$(@D) BUILD_DIR=${BUILD_DIR} BEAT_DIR=$(beat_abspath) BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/binary/build.sh


.PHONY: package-dashboards
package-dashboards:
	echo Creating the Dashboards package
	BUILDID=$(BUILDID) SNAPSHOT=$(SNAPSHOT) $(packer_absdir)/platforms/dashboards/build.sh

.PHONY: deps
deps:
	go get -u github.com/tsg/gotpl

.PHONY: xgo-image
xgo-image:
	cd $(packer_absdir)/docker/xgo-image/; ./build.sh

.PHONY: fpm-image
fpm-image:
	docker build --rm=true -t tudorg/fpm $(packer_absdir)/docker/fpm-image

.PHONY: go-daemon-image
go-daemon-image:
	docker build --rm=true -t tudorg/go-daemon $(packer_absdir)/docker/go-daemon/

${BUILD_DIR}/god-linux-386 ${BUILD_DIR}/god-linux-amd64 ${BUILD_DIR}/god-linux-arm ${BUILD_DIR}/god-linux-arm64 ${BUILD_DIR}/god-linux-mips ${BUILD_DIR}/god-linux-mips64 ${BUILD_DIR}/god-linux-mipsle ${BUILD_DIR}/god-linux-mips64le ${BUILD_DIR}/god-linux-ppc64le:
	docker run --rm -v ${BUILD_DIR}:/build tudorg/go-daemon

${BUILD_DIR}/upload:
	mkdir -p ${BUILD_DIR}/upload

${BUILD_DIR}/upload/build_id.txt:
	echo $(BUILDID) > ${BUILD_DIR}/upload/build_id.txt

# Build the image required for package-upload.
.PHONY: deb-rpm-s3
deb-rpm-s3:
	$(packer_absdir)/docker/deb-rpm-s3/build.sh

.PHONY: run-interactive-builder
run-interactive-builder:
	docker run -t -i -v $(shell pwd)/build:/build \
		-v $(packer_absdir)/xgo-scripts/:/scripts \
		-v $(shell pwd)/../..:/source \
		--entrypoint=bash tudorg/beats-builder

.PHONY: images
images: xgo-image fpm-image go-daemon-image

.PHONY: push-images
push-images:
	docker push tudorg/beats-builder
	docker push tudorg/fpm
	docker push tudorg/go-daemon

.PHONY: pull-images
pull-images:
	docker pull tudorg/beats-builder
	docker pull tudorg/fpm
	docker pull tudorg/go-daemon


define rm-image =
@echo "Cleaning $(1) image..."
  @if [ $(shell docker ps  -n 1 -a -q  --filter="image=$(1)" )  ]; then \
      docker stop $(shell docker ps -a -q --filter="image=$(1)"); \
      docker rm   $(shell docker ps -a -q --filter="image=$(1)"); \
  fi; \
\
  if [ $(shell docker images -q $(1)) ]; then \
    docker rmi $(1); \
  fi
endef


.PHONY: clean-images
clean-images:
	@$(call rm-image,tudorg/beats-builder)

.PHONY: clean
clean:
	$(call rm-image,build-image)
