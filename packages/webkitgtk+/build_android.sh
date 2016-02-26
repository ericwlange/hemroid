#!/bin/bash

set -e

#echo "int dummy_func() { return 0; }" > /tmp/dummy.c
#${CC} -c -fpic -o /tmp/dummy.o /tmp/dummy.c
#${CC} -shared -o ${SANDBOX}/lib/libpthread.so /tmp/dummy.o
#${AR} rcs ${SANDBOX}/lib/libpthread.a /tmp/dummy.o

rm ${SANDBOX}/bin/msgfmt
ln -s `which msgfmt` ${SANDBOX}/bin/msgfmt

cmake -DCMAKE_TOOLCHAIN_FILE=${PKGDIR}/android.toolchain.cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DANDROID_STANDALONE_TOOLCHAIN=${PLATFORM}/.. \
    -DANDROID_STL=gnustl_shared \
    -DPORT=GTK \
    -DCMAKE_FIND_ROOT_PATH=${SANDBOX} \
    -DDEFAULT_LIB_DIR=${OUTPUT}/lib \
    -DPYTHON_EXECUTABLE=`which python` -DPERL_EXECUTABLE=`which perl` \
    -DRUBY_EXECUTABLE=`which ruby` -DENABLE_LLINT=1 -DSHARED_CORE=1 \
    -DBISON_EXECUTABLE=`which bison` -DGPERF_EXECUTABLE=`which gperf` \
    -DEXPORT_ONLY_PUBLIC_SYMBOLS=1 -DCMAKE_INSTALL_PREFIX=${OUTPUT} \
    -DPKG_CONFIG_EXECUTABLE=`which pkg-config` -DENABLE_CROSS_COMPILING=ON \
    -DENABLE_INTROSPECTION=OFF \
    -DENABLE_GEOLOCATION=OFF -DENABLE_SPELLCHECK=ON \
    ${SRCDIR}
make -j8 install


