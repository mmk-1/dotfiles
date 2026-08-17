#!/bin/bash
LOCAL_PATH="$HOME/obsidian"
REMOTE_PATH="koofr:obsidian"
EXCLUDE_FILE="$HOME/.config/rclone/obsidian-ignore.txt"

while true; do
    # 1. Sync using the exclude rules
    rclone bisync "$LOCAL_PATH" "$REMOTE_PATH" --exclude-from "$EXCLUDE_FILE"

    # 2. Wait up to 10 minutes for local file changes
    inotifywait -t 600 -r -e modify,create,delete,move "$LOCAL_PATH"
    
    # 3. If a local change woke the script, pause 5s to bundle rapid writes
    if [ $? -eq 0 ]; then
        sleep 5
    fi
done
