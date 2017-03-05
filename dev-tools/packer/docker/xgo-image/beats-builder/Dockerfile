FROM tudorg/xgo

MAINTAINER Tudor Golubenco <tudor@elastic.co>

# Get libpcap binaries for linux
RUN \
	dpkg --add-architecture i386 && \
	apt-get update && \
	apt-get install -y libpcap0.8-dev flex bison libbison-dev libfl-dev

RUN \
	mkdir -p /libpcap && \
	apt-get download libpcap0.8-dev:i386 && \
	dpkg -x libpcap0.8-dev_*_i386.deb /libpcap/i386 && \
	apt-get download libpcap0.8-dev && \
	dpkg -x libpcap0.8-dev_*_amd64.deb /libpcap/amd64 && \
	rm libpcap0.8-dev*.deb && \
	mkdir -p /tmp/libpcap && \
	cd /tmp/libpcap && \
	apt-get source libpcap-dev && \
	cd libpcap-1.7.4/ && \
	CC=/usr/bin/arm-linux-gnueabihf-gcc ./configure --prefix=/libpcap/arm/usr --libdir=/libpcap/arm/usr/lib/arm-linux-gnueabihf --host=arm-linux-gnueabihf --with-pcap=linux --disable-shared && \
	make install && \
	make distclean && \
	CC=/usr/bin/aarch64-linux-gnu-gcc ./configure --prefix=/libpcap/arm64/usr --libdir=/libpcap/arm64/usr/lib/aarch64-linux-gnu --host=aarch64-linux-gnu --with-pcap=linux --disable-shared && \
	make install && \
	make distclean && \
	CC=/usr/bin/mips-linux-gnu-gcc ./configure --prefix=/libpcap/mips/usr --libdir=/libpcap/mips/usr/lib/mips-linux-gnu --host=mips-linux-gnu --with-pcap=linux --disable-shared && \
	make install && \
	make distclean && \
	CC=/usr/bin/mips64-linux-gnuabi64-gcc ./configure --prefix=/libpcap/mips64/usr --libdir=/libpcap/mips64/usr/lib/mips64-linux-gnuabi64 --host=mips64-linux-gnuabi64 --with-pcap=linux --disable-shared && \
	make install && \
	make distclean && \
	CC=/usr/bin/mipsel-linux-gnu-gcc ./configure --prefix=/libpcap/mipsle/usr --libdir=/libpcap/mipsle/usr/lib/mipsel-linux-gnu --host=mipsel-linux-gnu --with-pcap=linux --disable-shared && \
	make install && \
	make distclean && \
	CC=/usr/bin/mips64el-linux-gnuabi64-gcc ./configure --prefix=/libpcap/mips64le/usr --libdir=/libpcap/mips64le/usr/lib/mips64el-linux-gnuabi64 --host=mips64el-linux-gnuabi64 --with-pcap=linux --disable-shared && \
	make install && \
	make distclean && \
	CC=/usr/bin/powerpc64le-linux-gnu-gcc ./configure --prefix=/libpcap/ppc64le/usr --libdir=/libpcap/ppc64le/usr/lib/powerpc64le-linux-gnu --host=powerpc64le-linux-gnu --with-pcap=linux --disable-shared && \
	make install && \
	cd / && \
	rm -rf /tmp/libpcap

# Add patch for gopacket.
ADD gopacket_pcap.patch /gopacket_pcap.patch

