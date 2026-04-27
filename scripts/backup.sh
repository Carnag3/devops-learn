#!/bin/bash
mkdir -p /tmp/backup
cp -r ~/devops-learn /tmp/backup/
echo "$(date): Backup completed" >> /tmp/backup.log
cat /tmp/backup.log

