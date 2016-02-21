#!/bin/bash

set -e

export LIBFFI_CFLAGS="-I${SANDBOX}/lib/libffi-3.0.13/include"
export CFLAGS="-I${SANDBOX}/include $CFLAGS"
export CXXFLAGS="-I${SANDBOX}/include $CXXFLAGS"
export LDFLAGS="$LDFLAGS -lffi -lz"

cp ${PKGDIR}/android.cache .
${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} \
    --prefix=${OUTPUT} --disable-dependency-tracking --cache-file=android.cache \
    --enable-included-printf --enable-static
make -j8
make install
