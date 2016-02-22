#!/bin/bash

set -e
export LDFLAGS="$LDFLAGS -lffi -lz -lm -lstdc++ -lgnustl_shared"
${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} --prefix=${OUTPUT} \
    --enable-static
make -j8
make install
