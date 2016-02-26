#!/bin/bash

set -e

export PKG_CONFIG_LIBDIR="${OUTPUT}/lib/pkgconfig:${PKG_CONFIG_LIBDIR}"

mkdir .iconv_
cd .iconv_

export PFX=`echo ${PREFIX} | sed -e 's/eabi//g' | sed -e 's/linux-android/none-linux/g'`

${SRCDIR}/../libiconv*/configure --build=x86_64-unknown-linux-gnu --host=${PFX} \
    --prefix=${OUTPUT} --enable-static
make -j8
make install
