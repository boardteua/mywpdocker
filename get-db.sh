#!/bin/bash

SERVER="$1"
SSH_KEY="~/.ssh/$2"

FOLDER="$3"
EXPORT_SCRIPT="wp-export.sh"
IMPORT_SCRIPT="wp-import.sh"
DUMP_FOLDER="dump"
DUMP_FILENAME="dump.sql"

ssh -i "$SSH_KEY" "$SERVER" "cd /home/ubuntu/$FOLDER && sh $EXPORT_SCRIPT && echo 'Export completed.'"

scp -i "$SSH_KEY" "$SERVER":"$FOLDER/$DUMP_FOLDER/$DUMP_FILENAME" "$DUMP_FOLDER/$DUMP_FILENAME"

sh "$IMPORT_SCRIPT"
