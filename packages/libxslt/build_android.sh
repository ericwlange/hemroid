#!/bin/bash

set -e

export CFLAGS="-I${SANDBOX}/include/libxml2 ${CFLAGS}"
export CPPFLAGS="-I${SANDBOX}/include/libxml2 ${CPPFLAGS}"

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} --prefix=${OUTPUT} \
    --enable-static --with-libxml-prefix=${SANDBOX} \
    --with-libxml-include-prefix=${SANDBOX}/include/libxml2 \
    --with-libxml-libs-prefix=${SANDBOX}/lib \
    --with-crypto=no

make -j8
make install
