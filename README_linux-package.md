# Beats Linux package - deb/rpm/tgz packages for all linux ports 

The [Beats](https://www.elastic.co/products/beats) packages for all linux ports,
except ppc64 (big endian). Because ppc64 ports does NOT support cgo, some beats
are not buildable. 

My first thought was to build [Packetbeat](https://www.elastic.co/guide/en/beats/packetbeat/current/index.html) 
for my mips route and tried to build it. But then I realized that just compiling
and building beats itself was NOT enough because some other staff - for example
god staff - so decided to build up packages.

Then I decided to build all linux packages as much as I can. ;)

I could NOT still run the Packetbeat on my mips because of SOFT FLOAT issue. But
hopefully the patches will be available soon... ;)

Packages are available for the following linux ports.

* ARM: I have compiled with 'gnueabihf'. so need HARD FLOAT. 
* ARM64: 
* MIPS: 32 bit, big endian
* MIPSLE: 32 bit, little endian
* MIPS64: 64 bit, big endian
* MIPS64LE: 64 bit, little endian 
* PPC64LE: 64 bit, little endian 


