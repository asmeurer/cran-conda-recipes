#!/bin/sh

export CFLAGS="-I$PREFIX/include"
export CPPFLAGS="-I$PREFIX/include"
export FFLAGS="-I$PREFIX/include -L$PREFIX/lib"
export FCFLAGS="-I$PREFIX/include -L$PREFIX/lib"
export OBJCFLAGS="-I$PREFIX/include"
export CXXFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib -lgfortran"
export F77="gfortran"
export JAGS_HOME=$PREFIX

./configure --prefix=$PREFIX --libdir=$PREFIX/lib

make
make install

# vim:set ts=8 sw=4 sts=4 tw=78 et:
