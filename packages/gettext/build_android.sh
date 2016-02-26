#!/bin/bash

set -e

CFLAGS="-I${SANDBOX}/include $CFLAGS"
CPPFLAGS="-I${SANDBOX}/include $CPPFLAGS"

export PFX=`echo ${PREFIX} | sed -e 's/eabi//g' | sed -e 's/linux-android/none-linux/g'`

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PFX} \
   --prefix=${OUTPUT} --disable-libasprintf --disable-java --disable-native-java \
   --disable-openmp --disable-curses --enable-static
sed -i.bak '/_prg_LDADD_1 = -lpthread/d' ./gettext-tools/tests/Makefile
make -j8
make install
