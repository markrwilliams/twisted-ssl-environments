#!/bin/bash

set -e

bash /setup/setup.sh

/tmp/venv/bin/pip install /twisted[dev,tls] coverage
(
    cd /coverage
    /tmp/venv/bin/coverage run -m twisted.trial --temp-directory=/tmp/_trial_temp twisted.test.test_sslverify
)
