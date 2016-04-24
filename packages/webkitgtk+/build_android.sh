#!/bin/bash

set -e

rm ${SANDBOX}/bin/msgfmt
ln -s `which msgfmt` ${SANDBOX}/bin/msgfmt

if [ -e ${SANDBOX}/lib64/libffi.so ]
then
    ln -s ${SANDBOX}/lib64/libffi.so ${SANDBOX}/lib/libffi.so
fi

if [ -e ${PLATFORM}/usr/lib64/libz.so ]
then
    if ! [ -e ${PLATFORM}/usr/lib/libz.so._32 ]
    then
        cp ${PLATFORM}/usr/lib/libz.so ${PLATFORM}/usr/lib/libz.so._32
    fi
    
    rm -f ${PLATFORM}/usr/lib/libz.so
    ln -s ${PLATFORM}/usr/lib64/libz.so ${PLATFORM}/usr/lib/libz.so
fi
if [ -e ${PLATFORM}/usr/lib64/libEGL.so ]
then
    if ! [ -e ${PLATFORM}/usr/lib/libEGL.so._32 ]
    then
        cp ${PLATFORM}/usr/lib/libEGL.so ${PLATFORM}/usr/lib/libEGL.so._32
    fi
    
    rm -f ${PLATFORM}/usr/lib/libEGL.so
    ln -s ${PLATFORM}/usr/lib64/libEGL.so ${PLATFORM}/usr/lib/libEGL.so
fi
if [ -e ${PLATFORM}/usr/lib64/libGLESv2.so ]
then
    if ! [ -e ${PLATFORM}/usr/lib/libGLESv2.so._32 ]
    then
        cp ${PLATFORM}/usr/lib/libGLESv2.so ${PLATFORM}/usr/lib/libGLESv2.so._32
    fi
    
    rm -f ${PLATFORM}/usr/lib/libGLESv2.so
    ln -s ${PLATFORM}/usr/lib64/libGLESv2.so ${PLATFORM}/usr/lib/libGLESv2.so
fi

case ${HOST} in
    mips*)
        export JIT=OFF
        ;;
    *)
        export JIT=ON
        ;;
esac

cmake -DCMAKE_TOOLCHAIN_FILE=${PKGDIR}/android.toolchain.cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DANDROID_STANDALONE_TOOLCHAIN=${PLATFORM}/.. \
    -DANDROID_STL=gnustl_shared \
    -DPORT=GTK \
    -DCMAKE_FIND_ROOT_PATH=${SANDBOX} \
    -DSANDBOX=${SANDBOX} \
    -DOTHER_INCLUDE_DIRS=${ANDROID_NDK}/sources/android/native_app_glue \
    -DDEFAULT_LIB_DIR=${SANDBOX}/lib \
    -DPYTHON_EXECUTABLE=`which python` -DPERL_EXECUTABLE=`which perl` \
    -DRUBY_EXECUTABLE=`which ruby` -DSHARED_CORE=1 \
    -DBISON_EXECUTABLE=`which bison` -DGPERF_EXECUTABLE=`which gperf` \
    -DCMAKE_INSTALL_PREFIX=${OUTPUT} \
    -DPKG_CONFIG_EXECUTABLE=`which pkg-config` \
    -DENABLE_JIT=${JIT} \
    -DENABLE_WEBCORE=ON \
    -DENABLE_INTROSPECTION=OFF \
    -DENABLE_MINIBROWSER=OFF \
    -DENABLE_GEOLOCATION=OFF -DENABLE_SPELLCHECK=ON \
    ${SRCDIR}
make -j8 install
