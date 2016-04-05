#!/bin/bash

set -e

case $PREFIX in
    *x86_64*)    
        export ABI=64
        ;;
    *x86*)
        export ABI=32
        ;;
    *mips64*)
        rm -f ${SRCDIR}/mpn/mips64/{addmul_1.asm,submul_1.asm,mul_1.asm,sqr_diagonal.asm,umul.asm}
        export ABI=
        ;;
    *)
        export ABI=
        ;;
esac

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} --prefix=${OUTPUT} \
    --enable-static --enable-cxx
make -j8
make install
