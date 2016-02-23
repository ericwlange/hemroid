#!/bin/bash

set -e

export LDFLAGS="$LDFLAGS -lm"

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} --prefix=${OUTPUT} \
    --enable-static  --enable-libwebpmux --enable-libwebpdemux --enable-libwebpdecoder \
    --enable-libwebpextras --enable-swap-16bit-csp
make -j8
make install
