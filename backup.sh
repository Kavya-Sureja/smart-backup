#!/bin/bash

DATE=$(date  +%Y-%m-%d_%H-%M-%S)

SOURCE_DIR="./source"
BACKUP_DIR="./backup"
LOG_DIR="./logs"

mkdir -p "$BACKUP_DIR"
mkdir -p "$LOG_DIR"

BACKUP_FILE="$BACKUP_DIR/backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"
tar -czvf "$BACKUP_FILE" "$SOURCE_DIR"

ls -1t "$BACKUP_DIR" | tail -n +6 | while read file; do
rm -f "$BACKUP_DIR/$file"
 done

tail -n 10 "$LOG_DIR/backup.log" > "$LOG_DIR/backup_recent.log"
mv "$LOG_DIR/backup_recent.log" "$LOG_DIR/backup.log"

echo "Backup created for $SOURCE_DIR at $DATE" >> "$LOG_DIR/backup.log"
