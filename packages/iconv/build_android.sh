#!/bin/bash

set -e

${SRCDIR}/configure --build=x86_64-unknown-linux-gnu --host=${HOST} --prefix=${OUTPUT}
make -j8
make install
