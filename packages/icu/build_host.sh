#!/bin/bash

# expected environment variables
#   SOURCE

set -e

if [ ! -f "icu_build/.allgood" ]
then
	case `uname -a` in
		*Darwin*)    
			export HOSTOS="MacOSX"
			;;
		*Linux*)
			export HOSTOS="Linux/gcc"
			;;
	esac

	mkdir -p icu_build
	sh $SRCDIR/source/runConfigureICU $HOSTOS --prefix=$PWD/icu_build \
		--enable-extras=yes --enable-strict=no --enable-static --enable-tests=yes \
		--enable-samples=no --enable-dyload=no
	make -j8
	make install
	touch icu_build/.allgood
fi