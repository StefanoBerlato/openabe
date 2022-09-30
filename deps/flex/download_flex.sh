#!/bin/bash

CMD=$1
FORMAT=tar.gz
# commit as of 28/09/2022
#COMMIT=1c49f7e585acb337a0940a8fa80cebc5a1f3aa48
# commit as of 06/05/2017
COMMIT=ab49343b08c933e32de8de78132649f9560a3727


LINK=https://github.com/westes/flex/
VERSION=2.6.4
STABLEBRANCH=master
echo "Clone github repo @ ${LINK}"
git clone -b ${STABLEBRANCH} ${LINK} flex-${VERSION}.git
cd flex-${VERSION}.git
git reset --hard ${COMMIT}


FLEX=flex-${VERSION}
if [[ ! -f ./${FLEX}.${FORMAT} ]]; then
   echo "Create archive of source (without git files)"
   git archive --output ../flex-${VERSION}.test.${FORMAT} HEAD

   echo "Create final tarball: flex-${VERSION}.${FORMAT}"
   cd ..
   mkdir -p flex-${VERSION}
   cd flex-${VERSION}
   tar -xf ../flex-${VERSION}.test.${FORMAT}

   cd ..
   tar -czf flex-${VERSION}.${FORMAT} flex-${VERSION}
   rm flex-${VERSION}.test.${FORMAT}
   rm -r flex-${VERSION}
else
   echo "[!] ${FLEX}.${FORMAT} already exists."
fi

