#!/bin/bash

set -e
virtualenv /venv
/venv/bin/pip install /twisted[dev,tls] coverage
(
    cd /coverage
    /venv/bin/coverage run -m twisted.trial --temp-directory=/tmp/_trial_temp twisted.test.test_sslverify
)
