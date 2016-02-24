#!/bin/bash

set -e

export LIBS="${LIBS} -lffi -lz -lm"

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} --prefix=${OUTPUT} \
    --enable-static --enable-tests=no --disable-doctool --enable-introspection=no \
    --enable-examples=no
make -j8
make install
