#!/bin/bash
set -e
if [ "$1" = 'shell' ]; then
        bash
elif [ "$1" = 'make' ]; then
        cd /frr
        make
elif [ "$1" = 'make-install' ]; then
        cd /frr
        make
        make install
        # TODO: This is just a place-holder for now, because once "make install" is finished, the
        # container terminates and the installation is lost.
elif [ "$1" = 'debug' ]; then
        export LD_LIBRARY_PATH=/frr/lib/.libs
        ldconfig /frr/lib/.libs
        gdbserver localhost:4444 /frr/riftd/.libs/riftd
elif [ "$1" = 'cli' ]; then
        /scripts/install.sh
        /scripts/start.sh
        vtysh
else
        exec "$@"
fi
