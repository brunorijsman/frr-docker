#!/bin/bash
set -e
if [ "$1" = 'shell' ]; then
        bash
elif [ "$1" = 'debug' ]; then
        echo "Compile test program"
        cd /frr
        gcc -g test.c
        echo "Start GDB session for test program"
        gdbserver localhost:4444 a.out
else
        exec "$@"
fi
