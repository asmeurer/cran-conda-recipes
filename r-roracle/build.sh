#!/bin/sh

CONFIG_ARGS="--with-oci-lib=$PREFIX/lib --with-oci-inc=$PREFIX/include"
CONFIG_VARS="CFLAGS=\"-I$PREFIX/include\" LDFLAGS=\"-L$PREFIX/lib\""

$R CMD INSTALL                          \
    --build                             \
    --configure-args="$CONFIG_ARGS"     \
    --configure-vars="$CONFIG_VARS"     \
    .
