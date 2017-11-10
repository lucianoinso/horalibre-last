#!/bin/bash

# DB VARS
BACKUP_DB_PATH="${HOME}/db_backups"

# DELETE OLDEST FILE IN DATABASE DIRECTORY
echo "Deleting oldest backup database..."
rm -v "${BACKUP_DB_PATH}/$(ls -t ${BACKUP_DB_PATH} | tail -1)"

sleep 1

# CREATE DATABASE BACKUP

CURRENT_DATE=$(date +%d-%m-%y)
FULL_PATH="${BACKUP_DB_PATH}/${CURRENT_DATE}.sql"
echo "Creating database backup..."
echo ${FULL_PATH}
if [ ! -d "$BACKUP_DB_PATH" ]; then
  mkdir ${BACKUP_DB_PATH}
fi

mysqldump -u fundacionhoralib -h fundacionhoralibre.mysql.pythonanywhere-services.com \
'fundacionhoralib$db_11479' > ${FULL_PATH}

sleep 1
