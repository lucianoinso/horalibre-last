#!/bin/bash

# DELETE OLDEST DATABASE

LAST_MONTH_DATE=$(date +%d-%m-%y -d "-4 week")
DIRECTORY=${OPENSHIFT_DATA_DIR}db_backup
FULL_PATH="${DIRECTORY}/${LAST_MONTH_DATE}.sql"

echo "Deleting ${LAST_MONTH_DATE} backup database..."
rm -vrf ${FULL_PATH}

sleep 1
# CREATE NEW DB BACKUP


#CURRENT_DATE=$(date +%d-%m-%y)
#DIRECTORY=${OPENSHIFT_DATA_DIR}db_backup
#FULL_PATH="${DIRECTORY}/${CURRENT_DATE}.sql"
#echo "Creating database backup..."
#echo $FULL_PATH
#if [ ! -d "$DIRECTORY" ]; then
#  mkdir $DIRECTORY
#fi

mysqldump -u fundacionhoralib -h fundacionhoralibre.mysql.pythonanywhere-services.com \
'fundacionhoralib$db_11479' > /home/fundacionhoralibre/db-backup.sql

sleep 1
# DELETE LASTYEAR SAME MONTH LOG

LAST_YEAR=$(($(date +%Y) - 1))
THIS_MONTH=$(date +%m)
echo "Deleting ${LAST_YEAR}-${THIS_MONTH} logfiles..."
rm -vrf ${OPENSHIFT_LOG_DIR}project_logs/${LAST_YEAR}-${THIS_MONTH}

sleep 1
# SEND EMAIL NOTIFICATIONS
SCRIPT_PATH=${OPENSHIFT_REPO_DIR}wsgi/myproject/manage.py
python ${SCRIPT_PATH} send_notifications
echo "Send notifications script runned"
