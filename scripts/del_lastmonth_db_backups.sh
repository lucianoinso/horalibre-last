#!/bin/bash
LAST_MONTH_DATE=$(date +%d-%m-%y -d "-4 week")
DIRECTORY=${OPENSHIFT_DATA_DIR}db_backup
FULL_PATH="${DIRECTORY}/${LAST_MONTH_DATE}.sql"

echo "Deleting ${LAST_MONTH_DATE} backup database..."
rm -vrf ${FULL_PATH}
