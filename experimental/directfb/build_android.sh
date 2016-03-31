#!/bin/bash

set -e

echo "int dummy_func() { return 0; }" > /tmp/dummy.c
${CC} -c -o /tmp/dummy.o /tmp/dummy.c
mkdir -p ${SANDBOX}/lib
${AR} rcs ${SANDBOX}/lib/libpthread.a /tmp/dummy.o
${AR} rcs ${SANDBOX}/lib/librt.a /tmp/dummy.o

export EGL_CFLAGS="-I${PLATFORM}/usr/include/EGL"
export EGL_LIBS="-lEGL"
export GLES2_CFLAGS="-I${PLATFORM}/usr/include"
export GLES2_LIBS="-lGLESv2"
export PATH=${HOSTDIR}/.flux/bin:${PATH}
export LDFLAGS="$LDFLAGS -L${SANDBOX}/lib -llog -lgnustl_shared -lstdc++ -lm -lz"
export CPPFLAGS="$CPPFLAGS -Wno-unused-value -DANDROID_NDK -I${PLATFORM}/usr/include \
    -Wno-unused-variable -Wno-unused-but-set-variable \
    -I${SANDBOX}/include \
    -I${ANDROID_NDK}/sources/android/native_app_glue \
    -I${SRCDIR}/build-android/Android \
    -DHAVE_SIGNAL_H \
    -DDIRECT_BUILD_NO_PTHREAD_CANCEL=1 \
    -DDIRECT_BUILD_NO_PTHREAD_CONDATTR=1 \
    -DDIRECT_BUILD_NO_SA_SIGINFO=1 \
    -DDIRECT_BUILD_NO_SIGQUEUE=1 \
    -DGLES2_PVR2D \
    -DPTHREADMINIT"

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} --prefix=${OUTPUT} \
    --enable-static --disable-gif --enable-fbdev=no --enable-voodoo=yes \
    --disable-devmem --with-gfxdrivers='gles2' --with-inputdrivers='none'
make -j8
make install
