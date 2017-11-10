#!/bin/bash

SCRIPT_PATH=${OPENSHIFT_REPO_DIR}wsgi/myproject/manage.py
python ${SCRIPT_PATH} send_notifications
echo "Send notifications script runned"
