#!/bin/bash

set -e

export CFLAGS="$CFLAGS -I${SANDBOX}/include"
export CXXFLAGS="$CXXFLAGS -I${SANDBOX}/include"

echo "int dummy_func() { return 0; }" > /tmp/dummy.c
${CC} -c -o /tmp/dummy.o /tmp/dummy.c
mkdir -p ${SANDBOX}/lib
${AR} rcs ${SANDBOX}/lib/libpthread.a /tmp/dummy.o
${AR} rcs ${SANDBOX}/lib/librt.a /tmp/dummy.o

export LIBS="${LIBS} -lpangocairo-1.0 -lpangoft2-1.0 -lgthread-2.0 -lfontconfig"
export LIBS="${LIBS} -lxml2 -lharfbuzz -lstdc++ -lgnustl_shared -lfreetype -lpng16 -lz"
export LIBS="${LIBS} -lcairo -lpixman-1 -lpango-1.0 -lgobject-2.0 -lglib-2.0 -lffi -lm"

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} --prefix=${OUTPUT} \
    --enable-static --disable-cups --with-gdktarget=directfb
make -j8
make install

