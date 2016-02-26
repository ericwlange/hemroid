#!/bin/bash

set -e

export PFX=`echo ${PREFIX} | sed -e 's/eabi//g' | sed -e 's/linux-android/none-linux/g'`

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PFX} --prefix=${OUTPUT} \
    --enable-static
make -j8
make install
