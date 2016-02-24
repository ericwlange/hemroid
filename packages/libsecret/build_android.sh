#!/bin/bash

set -e

export CFLAGS="$CFLAGS -I${SANDBOX}/include"
export CXXFLAGS="$CXXFLAGS -I${SANDBOX}/include"
rm -rf /tmp/sed_tmp_path
mkdir -p /tmp/sed_tmp_path
case `uname -a` in
    *Darwin*)    
        ln -s `which gsed` /tmp/sed_tmp_path/sed
        ;;
    *)
        ln -s `which sed` /tmp/sed_tmp_path/sed
        ;;
esac
export PATH=/tmp/sed_tmp_path:$PATH
${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} --prefix=${OUTPUT} \
    --enable-static --disable-gcrypt --disable-manpages
PATH=/tmp/sed_tmp_path:$PATH make -j8
make install
rm -rf /tmp/sed_tmp_path
