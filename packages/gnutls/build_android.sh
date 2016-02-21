#!/bin/bash

set -e

case $PREFIX in
    *aarch64*)
        export LDFLAGS="$LDFLAGS -L${PLATFORM}/../${PREFIX}/lib -lgnustl_shared -lm -ltasn1 -lnettle -lhogweed -lgmp -lz -lcrypto"
        ;;
    *x86_64*)
        export LDFLAGS="$LDFLAGS -L${PLATFORM}/../${PREFIX}/lib64 -lgnustl_shared -lm -ltasn1 -lnettle -lhogweed -lgmp -lz -lcrypto"
        ;;
    *mips64*)
        export LDFLAGS="$LDFLAGS -L${PLATFORM}/../${PREFIX}/lib64 -lgnustl_shared -lm -ltasn1 -lnettle -lhogweed -lgmp -lz -lcrypto"
        ;;
    *)
        export LDFLAGS="$LDFLAGS -lgnustl_shared -lm -ltasn1 -lnettle -lhogweed -lgmp -lz -lcrypto"
        ;;
esac

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} --prefix=${OUTPUT} \
    --enable-static --without-p11-kit --disable-tests --disable-padlock \
    --disable-hardware-acceleration
make -j8
make install
