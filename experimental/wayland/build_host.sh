#!/bin/bash

set -e

if [ ! -f "wayland_build/.allgood" ]
then
	mkdir -p wayland_build
    ${SRCDIR}/configure \
        --build=x86_64-unknown-linux-gnu \
        --prefix=${PWD}/wayland_build --disable-documentation \
        --enable-libraries=no
	make -j8
	make install
	touch wayland_build/.allgood
fi
