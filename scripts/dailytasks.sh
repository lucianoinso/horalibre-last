#!/bin/bash

# DATABASE SCRIPTS

CURRENT_DAY=$(date "+%d")
echo $CURRENT_DAY


if [ $(($CURRENT_DATE % 7)) == 0 ]
then
    BACKUP_DB_PATH="${HOME}/db_backups"

    # DELETE OLDEST FILE IN DATABASE DIRECTORY IF THERE ARE MORE THAN 3 DB'S
    FILECOUNT=$(($(ls -afq ~/| wc -l) - 2))
    echo ${FILECOUNT}

    if [ $FILECOUNT -ge 4 ]
    then
        echo "Deleting oldest backup database..."
        rm -v "${BACKUP_DB_PATH}/$(ls -t ${BACKUP_DB_PATH} | tail -1)"

        sleep 1
    fi

    # CREATE NEW DATABASE BACKUP

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
fi
# DELETE LASTYEAR SAME MONTH LOG

LAST_YEAR=$(($(date +%Y) - 1))
THIS_MONTH=$(date +%m)
echo "Deleting ${LAST_YEAR}-${THIS_MONTH} logfiles..."
rm -vrf ${HOME}/project_logs/${LAST_YEAR}-${THIS_MONTH}

sleep 1
# SEND EMAIL NOTIFICATIONS
SCRIPT_PATH=${HOME}/horalibre/manage.py
python ${SCRIPT_PATH} send_notifications
echo "Send notifications script runned"