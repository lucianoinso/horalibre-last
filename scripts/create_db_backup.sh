#!/bin/bash
#DEL_LAST_MONTH_DB_PATH_SCRIPT="${OPENSHIFT_REPO_DIR}/data/scripts/del_lastmonth_db_backups.sh"
#source $DEL_LAST_MONTH_DB_PATH_SCRIPT

#CURRENT_DATE=$(date +%d-%m-%y)
#DIRECTORY=${OPENSHIFT_DATA_DIR}db_backup
#FULL_PATH="${DIRECTORY}/${CURRENT_DATE}.sql"
#echo "Creating database backup..."
#echo $FULL_PATH
#if [ ! -d "$DIRECTORY" ]; then
#  mkdir $DIRECTORY
#fi

pg_dump -U $OPENSHIFT_POSTGRESQL_DB_USERNAME fundacion --clean > $FULL_PATH

mysqldump -u fundacionhoralib -h fundacionhoralibre.mysql.pythonanywhere-services.com 'fundacionhoralib$db_11479' > db-backup.sql
