#!/bin/sh

set -e

virtualenv /tmp/venv
/tmp/venv/bin/pip install --no-binary cryptography packaging $CRYPTOGRAPHY_VERSION $PYOPENSSL_VERSION
/tmp/venv/bin/python /setup/assert_environment.py $OPENSSL_VERSION $CRYPTOGRAPHY_VERSION $PYOPENSSL_VERSION
