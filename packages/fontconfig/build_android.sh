#!/bin/bash

set -e

cp -r ${PKGDIR}/src/* ${SRCDIR}

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} --prefix=${OUTPUT} \
    --enable-static --enable-libxml2 --with-default-fonts=/system/fonts
make -j8
make install
