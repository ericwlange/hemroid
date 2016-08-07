#!/bin/bash

set -e

rm ${SANDBOX}/bin/msgfmt
ln -s `which msgfmt` ${SANDBOX}/bin/msgfmt

if [ -e ${SANDBOX}/lib64/libffi.a ]
then
    ln -s ${SANDBOX}/lib64/libffi.a ${SANDBOX}/lib/libffi.a
fi
rm -rf ${SANDBOX}/lib/*.so
cp ${SANDBOX}/lib/icu/stubdata/libicuhemdata.a ${SANDBOX}/lib

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
    -DANDROID_STL=gnustl_static \
    -DPORT=JSC \
    -DCMAKE_FIND_ROOT_PATH=${SANDBOX} \
    -DSANDBOX=${SANDBOX} \
    -DOTHER_CXX_FLAGS="-I${ANDROID_NDK}/sources/android/native_app_glue -I${PLATFORM}/../include/c++/4.9.x -I${PLATFORM}/../include/c++/4.9.x/${PREFIX}" \
    -DDEFAULT_LIB_DIR=${SANDBOX}/lib \
    -DPYTHON_EXECUTABLE=`which python` -DPERL_EXECUTABLE=`which perl` \
    -DRUBY_EXECUTABLE=`which ruby` -DSHARED_CORE=1 \
    -DBISON_EXECUTABLE=`which bison` -DGPERF_EXECUTABLE=`which gperf` \
    -DCMAKE_INSTALL_PREFIX=${OUTPUT} \
    -DPKG_CONFIG_EXECUTABLE=`which pkg-config` \
    -DENABLE_JIT=${JIT} \
    ${SRCDIR}
make -j8 install


