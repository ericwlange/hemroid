#!/bin/bash

set -e

export CFLAGS="$CFLAGS -I${ANDROID_NDK}/sources/android/native_app_glue"
export CPPFLAGS="$CPPFLAGS -I${ANDROID_NDK}/sources/android/native_app_glue"

echo "int dummy_func() { return 0; }" > /tmp/dummy.c
${CC} -c -o /tmp/dummy.o /tmp/dummy.c
mkdir -p ${SANDBOX}/lib
${AR} rcs ${SANDBOX}/lib/libpthread.a /tmp/dummy.o
${AR} rcs ${SANDBOX}/lib/librt.a /tmp/dummy.o

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} --prefix=${OUTPUT} \
    --enable-static --enable-introspection=no
make -j8
make install
