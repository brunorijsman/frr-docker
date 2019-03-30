FROM ubuntu:bionic
RUN apt-get update
# Mandatory dependencies
RUN apt-get install -y git
RUN apt-get install -y autoconf
RUN apt-get install -y automake
RUN apt-get install -y libtool
RUN apt-get install -y make
RUN apt-get install -y gawk
RUN apt-get install -y libreadline-dev
RUN apt-get install -y texinfo
RUN apt-get install -y pkg-config
RUN apt-get install -y libpam0g-dev
RUN apt-get install -y libjson-c-dev
RUN apt-get install -y bison
RUN apt-get install -y flex
RUN apt-get install -y python-pytest
RUN apt-get install -y libc-ares-dev
RUN apt-get install -y python3-dev
RUN apt-get install -y libsystemd-dev
RUN apt-get install -y python-ipaddress
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y python3-sphinx
RUN apt-get install -y install-info
# Mandatory libyang
RUN apt-get install -y wget
RUN wget --quiet https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-1/Ubuntu-18.04-x86_64-Packages/libyang-dev_0.16.46_amd64.deb
RUN wget --quiet https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-1/Ubuntu-18.04-x86_64-Packages/libyang_0.16.46_amd64.deb
RUN apt-get install -y libpcre3-dev
RUN dpkg -i libyang-dev_0.16.46_amd64.deb libyang_0.16.46_amd64.deb
# Optional dependencies
RUN apt-get install -y protobuf-c-compiler
RUN apt-get install -y libprotobuf-c-dev
RUN apt-get install -y libzmq5
RUN apt-get install -y libzmq3-dev
# Add FRR groups and user
RUN groupadd -r -g 92 frr
RUN groupadd -r -g 85 frrvty
RUN adduser --system --ingroup frr --home /var/run/frr/ --gecos "FRR suite" --shell /sbin/nologin frr
RUN usermod -a -G frrvty frr
# Use "live" FRR source code
VOLUME /frr
VOLUME /scripts
