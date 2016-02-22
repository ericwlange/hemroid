#!/bin/bash

set -e

export PATH=${HOSTDIR}/nasm_bin/bin:$PATH

case $HOST in
   *mipsel-*)
       export MIPS_HACK="--with-simd=no"
       ;;
esac

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} --prefix=${OUTPUT} \
    --enable-static --with-jpeg8 ${MIPS_HACK}
make -j8
make install
