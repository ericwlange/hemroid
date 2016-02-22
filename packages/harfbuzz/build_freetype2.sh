#!/bin/bash

set -e

mkdir .ft2_
cd .ft2_
${SRCDIR}/../freetype-2*/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} --prefix=${OUTPUT} \
    --enable-static
make -j8
make install
