#!/bin/bash

set -e

mkdir -p ${PWD}/.flux

if [ ! -f ".flux/.allgood" ]
then
    ${SRCDIR}/configure --prefix=${PWD}/.flux
    make -j8
    make install
    touch .flux/.allgood
fi
