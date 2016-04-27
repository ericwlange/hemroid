#!/bin/bash

set -e

rm ${SANDBOX}/bin/msgfmt
ln -s `which msgfmt` ${SANDBOX}/bin/msgfmt

if [ -e ${SANDBOX}/lib64/libffi.so ]
then
    ln -s ${SANDBOX}/lib64/libffi.so ${SANDBOX}/lib/libffi.so
fi

case ${HOST} in
    mips*)
        export JIT=OFF
        ;;
    *)
        export JIT=ON
        ;;
esac

cmake -DCMAKE_TOOLCHAIN_FILE=${PKGDIR}/../webkitgtk+/android.toolchain.cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DANDROID_STANDALONE_TOOLCHAIN=${PLATFORM}/.. \
    -DANDROID_STL=gnustl_shared \
    -DPORT=JSC \
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
    ${SRCDIR}
make -j8 install


