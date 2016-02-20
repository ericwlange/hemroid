#!/bin/bash

set -e

CFLAGS="-I${SANDBOX}/include $CFLAGS"
CPPFLAGS="-I${SANDBOX}/include $CPPFLAGS"

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${HOST} --disable-rpath \
   --prefix=${OUTPUT} --disable-libasprintf --disable-java --disable-native-java \
   --disable-openmp --disable-curses
sed -i.bak '/_prg_LDADD_1 = -lpthread/d' ./gettext-tools/tests/Makefile
make -j8
make install
