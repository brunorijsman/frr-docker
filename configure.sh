cd /frr
./bootstrap.sh
./configure \
--prefix=/usr \
--enable-exampledir=/usr/share/doc/frr/examples/ \
--localstatedir=/var/run/frr \
--sbindir=/usr/lib/frr \
--sysconfdir=/etc/frr \
--enable-multipath=64 \
--enable-user=frr \
--enable-group=frr \
--enable-vty-group=frrvty \
--enable-configfile-mask=0640 \
--enable-logfile-mask=0640 \
--enable-fpm \
--enable-systemd=yes \
--with-pkg-git-version \
--with-pkg-extra-version=-MyOwnFRRVersion \
--enable-protobuf \
--enable-zeromq \
--enable-opaque-lsa