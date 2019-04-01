#!/bin/bash
set -e
if [ "$1" = 'shell' ]; then
        bash
elif [ "$1" = 'make' ]; then
        cd /frr
        make
        make install
elif [ "$1" = 'debug' ]; then
        export LD_LIBRARY_PATH=/frr/lib/.libs
        ldconfig /frr/lib/.libs
        gdbserver localhost:4444 /frr/isisd/.libs/isisd
else
        exec "$@"
fi
