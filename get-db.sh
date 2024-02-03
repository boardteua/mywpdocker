#!/bin/bash

SERVER="157.90.161.252"
USERNAME="ubuntu"
SSH_KEY="~/.ssh/deploy"

FOLDER="$1"
EXPORT_SCRIPT="wp-export.sh"
IMPORT_SCRIPT="wp-import.sh"
DUMP_FOLDER="dump"
DUMP_FILENAME="dump.sql"

ssh -i "$SSH_KEY" "$USERNAME"@"$SERVER" "cd /home/ubuntu/$FOLDER && sh $EXPORT_SCRIPT && echo 'Export completed.'"

scp -i "$SSH_KEY" "$USERNAME"@"$SERVER":"$FOLDER/$DUMP_FOLDER/$DUMP_FILENAME" "$DUMP_FOLDER/$DUMP_FILENAME"

sh "$IMPORT_SCRIPT"
