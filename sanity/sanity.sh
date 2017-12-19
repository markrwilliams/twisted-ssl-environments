#!/bin/bash

set -e

bash /setup/setup.sh

/tmp/venv/bin/pip install /twisted[dev,tls]
/tmp/venv/bin/python /sanity/bug.py
