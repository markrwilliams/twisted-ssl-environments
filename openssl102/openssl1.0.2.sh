#!/bin/bash

set -e
apt-get update
apt-get purge -y openssl libssl-dev
apt-get install -y build-essential
cd /openssl
./Configure \
    --prefix=/usr \
    --openssldir=/usr/lib/ssl \
    --libdir=lib/x86_64-linux-gnu \
    -fPIC \
    no-idea \
    no-mdc2 \
    no-rc5 \
    no-zlib \
    no-ssl2 \
    no-ssl3 \
    linux-x86_64
make depend
make install
make depend
make install
