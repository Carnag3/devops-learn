#!/bin/bash
while true; do
    echo "$(date); myapp is running" >> /tmp/myapp.log
    sleep 5
done
