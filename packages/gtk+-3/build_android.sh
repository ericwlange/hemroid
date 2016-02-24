#!/bin/bash

set -e

export CFLAGS="$CFLAGS -I${SANDBOX}/include"
export CXXFLAGS="$CXXFLAGS -I${SANDBOX}/include"

echo "int dummy_func() { return 0; }" > /tmp/dummy.c
mkdir ${PWD}/fakelib
${CC} -c -o /tmp/dummy.o /tmp/dummy.c
mkdir -p ${PWD}/fakelib
${AR} rcs ${PWD}/fakelib/librt.a /tmp/dummy.o

export LDFLAGS="${LDFLAGS} -L${PWD}/fakelib"
export LIBS="${LIBS} -lpangocairo-1.0 -lpangoft2-1.0 -lgthread-2.0 -lfontconfig"
export LIBS="${LIBS} -lxml2 -lharfbuzz -lstdc++ -lgnustl_shared -lfreetype -lpng16 -lz"
export LIBS="${LIBS} -lcairo -lpixman-1 -lpango-1.0 -lgobject-2.0 -lglib-2.0 -lffi -lm"

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${PREFIX} --prefix=${OUTPUT} \
    --enable-static --enable-x11-backend=no --enable-broadway-backend=yes --disable-cups
make -j8
echo "#!/bin/bash" > gtk/gtk-update-icon-cache
chmod a+x gtk/gtk-update-icon-cache
make install

