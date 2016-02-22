#!/bin/bash

set -e

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} --prefix=${OUTPUT} \
    --enable-static --without-gnome --enable-introspection=no --enable-vala=no
make -j8
make install
