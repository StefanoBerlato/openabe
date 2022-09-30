#!/bin/bash

FORMAT=tar.lz
VERSION=6.2.1
GMP=gmp-${VERSION}
GMPF=${GMP}.${FORMAT}
LINK=https://gmplib.org/download/gmp/gmp-6.2.1.tar.lz

if [[ ! -f ./${GMPF} ]]; then
   echo "Download ${GMP} @ ${LINK}"
   curl ${LINK} --output ${GMPF}

else
   echo "[!] ${GMPF} already exists."
fi
