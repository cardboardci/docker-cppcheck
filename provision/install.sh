#!/bin/sh
mkdir /cfg

cd /tmp
curl -sSL https://github.com/danmar/cppcheck/archive/${VERSION}.tar.gz | tar xz
cd cppcheck-${VERSION}
SRCDIR=build CFGDIR=/cfg HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function" make
SRCDIR=build CFGDIR=/cfg HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function" make install

cd
rm -r /tmp/cppcheck-${VERSION}