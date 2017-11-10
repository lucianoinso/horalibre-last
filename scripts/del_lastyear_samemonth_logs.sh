#!/bin/bash
LAST_YEAR=$(($(date +%Y) - 1))
THIS_MONTH=$(date +%m)
echo "Deleting ${LAST_YEAR}-${THIS_MONTH} logfiles..."
rm -vrf ${OPENSHIFT_LOG_DIR}project_logs/${LAST_YEAR}-${THIS_MONTH}
