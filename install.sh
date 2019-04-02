#!/bin/bash
cd /frr
make install
mkdir -p /var/log/frr
mkdir -p /etc/frr
touch /etc/frr/zebra.conf
touch /etc/frr/bgpd.conf
touch /etc/frr/ospfd.conf
touch /etc/frr/ospf6d.conf
touch /etc/frr/isisd.conf
touch /etc/frr/riftd.conf
touch /etc/frr/ripd.conf
touch /etc/frr/ripngd.conf
touch /etc/frr/pimd.conf
touch /etc/frr/ldpd.conf
touch /etc/frr/nhrpd.conf
touch /etc/frr/vtysh.conf
cp /frr/tools/etc/frr/* /etc/frr
DAEMONS="bgpd ospfd ospf6d ripd ripngd isisd riftd pimd ldpd nhrpd eigrpd babeld sharpd pbrd bfdd fabrid"
for daemon in ${DAEMONS}; do
    echo "Enable daemon ${daemon}"
    sed -i "s/${daemon}=no/${daemon}=yes/g" /etc/frr/daemons
done
