#!/bin/bash

set -e

if [ ! -f "nasm_bin/.allgood" ]
then
    if [ ! -f $SRCDIR/../../cache/nasm-2.11.08.tar.xz ]
    then
        wget -O $SRCDIR/../../cache/nasm-2.11.08.tar.xz http://www.nasm.us/pub/nasm/releasebuilds/2.11.08/nasm-2.11.08.tar.xz
    fi
    tar xvf $SRCDIR/../../cache/nasm-2.11.08.tar.xz -C .
    cd nasm-2.11.08
    ./configure --prefix=${PWD}/../nasm_bin
    make -j8
    make install
    cd ..
    touch nasm_bin/.allgood
fi
