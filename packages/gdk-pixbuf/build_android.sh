#!/bin/bash

set -e

export CFLAGS="$CFLAGS -I${SANDBOX}/include"
export CPPFLAGS="$CPPFLAGS -I${SANDBOX}/include"

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} --prefix=${OUTPUT} \
    --enable-static --without-libtiff --enable-gio-sniffing=no
make -j8
make install
