#!/bin/bash
set -e

openssl rand -base64 42
SECRET_KEY = 'IhrGenerierterSichererSchlüssel'


superset fab create-admin \
    --username ${SUPERSET_ADMIN_USER} \
    --password ${SUPERSET_ADMIN_PASSWORD} \
    --firstname Superset \
    --lastname Admin \
    --email admin@example.com

superset db upgrade
superset load_examples
superset init

# Start Superset server
superset run -h 0.0.0.0 -p 8088
