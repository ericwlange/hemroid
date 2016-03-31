#!/bin/bash

set -e

if [ ! -f ".allgood" ]
then
	export LIBS="${LIBS} -lgnustl_shared -lm"
	sh ${SRCDIR}/source/configure --with-cross-build=${HOSTDIR} \
		--host=${PREFIX} --prefix=${OUTPUT} \
		--enable-extras=yes --enable-strict=no --enable-static \
		--enable-tests=yes --enable-samples=no --enable-dyload=no
	make -j8
	make install
	mkdir -p ${OUTPUT}/lib/icu/stubdata
	cp stubdata/libicudata* ${OUTPUT}/lib/icu/stubdata
	touch .allgood
fi
