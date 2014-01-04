#!/bin/sh

export JAGS_LIB=$PREFIX/lib
export JAGS_INCLUDE=$PREFIX/include/JAGS
export JAGS_MODULES=$PREFIX/lib/JAGS/modules-3

$R CMD INSTALL  \
    --build     \
    --configure-args="--with-jags-lib=$JAGS_LIB
                      --with-jags-include=$JAGS_INCLUDE
                      --with-jags-modules=$JAGS_MODULES" .

# vim:set ts=8 sw=4 sts=4 tw=78 et:
