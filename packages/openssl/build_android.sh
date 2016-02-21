#!/bin/bash

set -e

cp -r ${SRCDIR}/* .
export CROSS_COMPILE=

case $HOST in
    *eabiv7a*)
        export TGT=android-armv7
        ;;
    *eabiv8a*)
        export TGT=linux-aarch64
        ;;
    *x86_64*)
        export TGT=linux-x86_64
        ;;
    *x86*)
        export TGT=android-x86
        ;;
    *mips64*)
        export TGT=linux-generic64
        ;;
    *mips*)
        export TGT=android-mips
        ;;
    *)
        export TGT=android
        ;;
esac

./Configure --prefix=${OUTPUT} ${TGT}
make -j8
make install
