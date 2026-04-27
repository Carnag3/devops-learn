#!/bin/bash
THRESHOLD=80
USAGE=$(df / | tail -1 | awk '{print $5}' | tr -d '%')

if [ $USAGE -gt $THRESHOLD ]; then
    echo "$(date): ВНИМАНИЕ: диск заполнен на $USAGE%" >> /tmp/disk.log
else
    echo "$(date): OK: диск заполнен на $USAGE%" >> /tmp/disk.log
fi
