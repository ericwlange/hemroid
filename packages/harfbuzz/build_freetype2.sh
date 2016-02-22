#!/bin/bash

set -e

export PKG_CONFIG_LIBDIR="${OUTPUT}/lib/pkgconfig:${PKG_CONFIG_LIBDIR}"

mkdir .ft2_
cd .ft2_
${SRCDIR}/../freetype-2*/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} --prefix=${OUTPUT} \
    --enable-static --with-harfbuzz=yes
make -j8
make install
