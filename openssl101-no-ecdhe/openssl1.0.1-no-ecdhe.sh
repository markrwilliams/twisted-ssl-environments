#!/bin/bash


#!/bin/bash

set -e

apt-get update
apt-get purge -y libssl-dev
apt-get install -y build-essential

cd /openssl
./Configure \
    --prefix=/usr/local \
    --libdir=lib/ \
    --openssldir=/usr/local/openssl \
    -fPIC \
    no-idea \
    no-mdc2 \
    no-rc5 \
    no-zlib \
    enable-tlsext \
    no-ssl2 \
    no-ssl3 \
    no-ec \
    no-ecdh \
    linux-x86_64
make depend
make install
