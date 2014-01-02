#!/bin/sh

$R CMD INSTALL --build                                  \
    --configure-vars="FFTW_CFLAGS=\"-I$PREFIX/include\" \
                      FFTW_LIBS=-lfftw3" .

# vim:set ts=8 sw=4 sts=4 tw=78 et:
