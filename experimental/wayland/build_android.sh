#!/bin/bash

set -e

export PATH=${HOSTDIR}/wayland_build/bin:${PATH}
export LIBS="$LIBS -lz -lm"

echo "int dummy_func() { return 0; }" > /tmp/dummy.c
${CC} -c -o /tmp/dummy.o /tmp/dummy.c
${AR} rcs ${SANDBOX}/lib/librt.a /tmp/dummy.o

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} \
    --prefix=${OUTPUT} --enable-static --disable-documentation --with-host-scanner
make -j8
make install
