FROM ubuntu:bionic
RUN apt-get update
RUN apt-get install -y apt-utils
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
RUN apt-get install -y cmake
RUN apt-get install -y wget
RUN apt-get install -y devscripts
RUN apt-get install -y rpm
RUN apt-get install -y libpcre3
RUN apt-get install -y libpcre3-dev
RUN apt-get install -y iproute2
# Mandatory libyang
RUN cd; git clone https://github.com/CESNET/libyang.git
RUN cd ~/libyang; mkdir build; cd build; cmake -DENABLE_LYD_PRIV=ON -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
RUN cd ~/libyang/build; make; make install
# Optional dependencies
RUN apt-get install -y protobuf-c-compiler
RUN apt-get install -y libprotobuf-c-dev
RUN apt-get install -y libzmq5
RUN apt-get install -y libzmq3-dev
# Usefull tools
RUN apt-get install -y vim
RUN apt-get install -y iputils-ping
RUN apt-get install -y tcpdump
RUN apt-get install -y net-tools
RUN apt-get install -y ssh
# Needed for remote debug
RUN apt-get install -y gdbserver
EXPOSE 4444
# Add FRR groups and user
RUN groupadd -r -g 92 frr
RUN groupadd -r -g 85 frrvty
RUN adduser --system --ingroup frr --home /var/run/frr/ --gecos "FRR suite" --shell /sbin/nologin frr
RUN usermod -a -G frrvty frr
# Enable IPv4 and IPv6 forwarding
RUN sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
RUN sed -i 's/#net.ipv6.conf.all.forwarding=1/net.ipv6.conf.all.forwarding=1/g' /etc/sysctl.conf
# TODO: Enable MPLS
# Use "live" FRR source code
VOLUME /frr
VOLUME /scripts
# Entry point
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["shell"]