#!/bin/sh
apt-get update
apt-get install -y build-essential libpcre3-dev curl python python-pygments
apt-get clean
rm -rf /var/lib/apt/lists/*

mkdir /cfg 

cd /tmp \
curl -L https://github.com/danmar/cppcheck/archive/${VERSION}.tar.gz | tar xz
cd cppcheck-${VERSION}
SRCDIR=build CFGDIR=/cfg HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function" make
SRCDIR=build CFGDIR=/cfg HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function" make install

cd
rm -r /tmp/cppcheck-${VERSION}