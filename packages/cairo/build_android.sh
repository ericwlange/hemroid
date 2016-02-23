#!/bin/bash

set -e

export LDFLAGS="$LDFLAGS -lm"

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} --prefix=${OUTPUT} \
    --enable-static --without-x --enable-ft=yes
make -j8
make install
