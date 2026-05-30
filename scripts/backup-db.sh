#!/bin/bash

DATE=$(date +%F-%H-%M)
BACKUP_DIR="/backup"
DB_NAME="appdb"
DB_USER="root"
DB_PASS="Root@123"

echo "Starting backup..."

mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_DIR/$DB_NAME-$DATE.sql

if [ $? -eq 0 ]; then
  echo "Backup successful"
else
  echo "Backup failed"
fi
