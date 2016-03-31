#!/bin/bash

set -e

export LDFLAGS="$LDFLAGS -lm"

echo "int dummy_func() { return 0; }" > /tmp/dummy.c
${CC} -c -o /tmp/dummy.o /tmp/dummy.c
mkdir -p ${SANDBOX}/lib
${AR} rcs ${SANDBOX}/lib/libpthread.a /tmp/dummy.o
${AR} rcs ${SANDBOX}/lib/librt.a /tmp/dummy.o

export gl_CFLAGS="-I${PLATFORM}/usr/include/GLES"
export gl_LIBS="-L${PLATFORM}/usr/lib64 -L${PLATFORM}/usr/lib -lEGL"

export glesv2_CFLAGS="-I${PLATFORM}/usr/include/GLES2"
export glesv2_LIBS="-L${PLATFORM}/usr/lib64 -L${PLATFORM}/usr/lib -lGLESv2"

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} --prefix=${OUTPUT} \
    --enable-static --without-x --enable-ft=yes --enable-glesv2=yes
make -j8
make install

sed -i'' -e 's/ glesv2//g' ${OUTPUT}/lib/pkgconfig/cairo-glesv2.pc
sed -i'' -e 's/ glesv2//g' ${OUTPUT}/lib/pkgconfig/cairo.pc