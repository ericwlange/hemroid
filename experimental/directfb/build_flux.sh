#!/bin/bash

set -e

mkdir -p ${PWD}/.flux

if [ ! -f "${PWD}/.flux/.allgood" ]
then
    ${SRCDIR}/../flux*/configure --prefix=${PWD}/.flux
    make -j8
    make install
    touch ${PWD}/.flux/.allgood
fi
