# Problem 2
# Automated Backup Solution:
# Write a script to automate the backup of a specified directory to a remote
# server or a cloud storage solution. The script should provide a report on the
# success or failure of the backup operation.


#!/bin/bash

SOURCE_DIR="/path/to/source"
DESTINATION_USER="your_username"
DESTINATION_HOST="your_remote_host"
DESTINATION_DIR="/path/to/destination"

perform_backup() {
  echo "Starting backup..."
  
  rsync -av --delete --exclude="*.tmp" "$SOURCE_DIR" "$DESTINATION_USER"@"$DESTINATION_HOST":"$DESTINATION_DIR"

  if [ $? -eq 0 ]; then
    echo "Backup completed successfully."
  else
    echo "Backup failed. Check the error message above."
  fi
}

main() {
  perform_backup > backup_report.txt 2>&1
}

main
