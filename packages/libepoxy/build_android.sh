#!/bin/bash

set -e

export EGL_CFLAGS="-I${PLATFORM}/usr/include/EGL"
export EGL_LIBS="-lEGL"

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} --prefix=${OUTPUT} \
    --enable-static --without-glx
make -j8
make install
