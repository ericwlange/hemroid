#!/bin/bash

set -e

export CFLAGS="$CFLAGS -I${SANDBOX}/include"
export CPPFLAGS="$CPPFLAGS -I${SANDBOX}/include"

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} --prefix=${OUTPUT} \
    --enable-static --without-libtiff --disable-gio-sniffing --disable-modules \
    --enable-relocations --disable-introspection --disable-glibtest \
    --without-gdiplus --with-included-loaders=png,jpeg

make -j8
make install
