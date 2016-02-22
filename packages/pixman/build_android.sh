#!/bin/bash

set -e

case $PREFIX in
    *arm-linux*)
        export CFLAGS="$CFLAGS -I${PLATFORM}/usr/include/sys -I${PLATFORM}/usr/include/machine -include ${PLATFORM}/usr/include/setjmp.h"
        ;;
    *i686-linux*)
        export CFLAGS="$CFLAGS -I${PLATFORM}/usr/include/sys"
        ;;
    *mipsel-linux*)
        export CFLAGS="$CFLAGS -I${PLATFORM}/usr/include/sys"
        ;;
esac

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} --prefix=${OUTPUT} \
    --enable-static
make -j8
make install
