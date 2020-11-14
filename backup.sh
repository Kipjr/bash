#!/bin/bash
DATE=$(date +%Y-%m-%d)
BACKUP_DIR=”/home/pi/backup”
STORE_DIR=”/home/pi/data”
tar -zcvpf $STORE_DIR/Archive-$DATE.tar.gz $BACKUP_DIR # Create archive.tar from files foo and bar.

# Delete files older than 10 days #
find $BACKUP_DIR/* -mtime +10 -exec rm {} \;





