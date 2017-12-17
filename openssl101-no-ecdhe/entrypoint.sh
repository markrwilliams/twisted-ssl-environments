#!/bin/bash

set -e
cd /openssl
virtualenv /venv
/venv/bin/pip install --no-binary cryptography cryptography==1.6  pyOpenSSL==16.0.0 /twisted[dev,tls] coverage
(
    cd /coverage
    /venv/bin/coverage run -m twisted.trial --temp-directory=/tmp/_trial_temp twisted.test.test_sslverify
)
