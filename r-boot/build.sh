#!/bin/sh

cp DESCRIPTION DESCRIPTION.old
cat DESCRIPTION.old | grep -v '^Priority: ' > DESCRIPTION

$R CMD INSTALL --build .
