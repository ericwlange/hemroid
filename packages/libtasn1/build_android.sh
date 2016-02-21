#!/bin/bash

set -e

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} --prefix=${OUTPUT} \
    --enable-static --disable-tools --disable-doc
make -j8
make install
