#!/bin/bash
BACKUP_DIR="/home/$USER/devops-learn/postgres/backups"

DB_NAME="devopsdb"
DB_USER="devopsuser"

DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_${DATE}.sql"

mkdir -p "$BACKUP_DIR"

PGPASSWORD="Krishna1899!!" pg_dump -U "$DB_USER" -h localhost "$DB_NAME" > "$BACKUP_FILE"

if [ $? -eq 0 ]; then

  echo "[$DATE] Backup OK: $BACKUP_FILE" >> "$BACKUP_DIR/backup.log"
  ls -t "$BACKUP_DIR"/*.sql | tail -n +8 | xargs rm -f 2>/dev/null

else 
  echo "[$DATE] BACKUP FAILED!" >> "$BACKUP_DIR/backup.log"
fi
