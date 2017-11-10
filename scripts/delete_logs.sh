#!/bin/bash
CURRENT_MONTH=$(date +%m)
RM_LOGS_CMD=${OPENSHIFT_LOG_DIR}*.log
if [ $CURRENT_MONTH == "03" ]; then
  rm $RM_LOGS_CMD
  echo "Logs removed successfully"
fi
echo "Delete logs script runned"
