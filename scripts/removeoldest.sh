#!/bin/bash
BACKUP_DB_PATH="${HOME}/db_backups/"
rm -v "${BACKUP_DB_PATH}$(ls -t ${BACKUP_DB_PATH} | tail -1)"
