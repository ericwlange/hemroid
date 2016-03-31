#!/bin/bash

set -e

# Set up NativeActivity

cp -r ${PKGDIR}/src/* .
sed -i'' -e 's/all/'"${ABI}"'/g' jni/Application.mk
sed -i'' -e 's/android-10/android-'"${ANDROID_API}"'/g' jni/Application.mk

cp -r ${SRCDIR}/../webkitgtk*/Tools/MiniBrowser/* jni/
sed -i'' -e 's/#include "cmakeconfig.h"//g' jni/gtk/*.c

glib-genmarshal --prefix=browser_marshal jni/gtk/browser-marshal.list --body > jni/gtk/BrowserMarshal.c
glib-genmarshal --prefix=browser_marshal jni/gtk/browser-marshal.list --header > jni/gtk/BrowserMarshal.h

# Build app

${ANDROID_NDK}/ndk-build
${ANDROID_SDK}/tools/android update project --path . --name MiniBrowser --target android-23
ant debug
mkdir -p ${OUTPUT}/apk
cp bin/MiniBrowser-debug.apk ${OUTPUT}/apk