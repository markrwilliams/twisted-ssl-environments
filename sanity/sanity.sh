#!/bin/bash

set -e
virtualenv /tmp/venv
/tmp/venv/bin/pip install $DEPENDENCIES
/tmp/venv/bin/pip install /twisted[dev,tls] coverage
/tmp/venv/bin/python /sanity/bug.py
