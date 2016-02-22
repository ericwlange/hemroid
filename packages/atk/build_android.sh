#!/bin/bash

set -e

export CFLAGS="$CFLAGS -I${SANDBOX}/include"
export CXXFLAGS="$CXXFLAGS -I${SANDBOX}/include"
export LDFLAGS="$LDFLAGS -lffi -lz -lm -lgnustl_shared"

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} --prefix=${OUTPUT} \
    --enable-static
make -j8
make install
