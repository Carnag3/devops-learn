#!/bin/bash
echo "$(date): === Server status ===" >> /tmp/server_status.log
echo "Disk:" >> /tmp/server_status.log
df -h / >> /tmp/server_status.log
echo "Memory:" >> /tmp/server_status.log
free -h >> /tmp/server_status.log
echo "Uptime" >> /tmp/server_status.log
uptime >> /tmp/server_status.log
echo "=======================" >> /tmp/server_status.log

