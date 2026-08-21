#!/bin/bash
LOCAL_PATH="$HOME/obsidian"
REMOTE_PATH="koofr:obsidian"
EXCLUDE_FILE="$HOME/.config/rclone/obsidian-ignore.txt"
WORKDIR="$HOME/.local/share/rclone/bisync-obsidian"

mkdir -p "$WORKDIR"

do_sync() {
    if ! ping -c 1 -W 2 1.1.1.1 &>/dev/null; then
        echo "Network unavailable. Skipping sync cycle."
        return 1
    fi

    rclone bisync "$LOCAL_PATH" "$REMOTE_PATH" \
        --exclude-from "$EXCLUDE_FILE" \
        --workdir "$WORKDIR" \
        --recover \
        --conflict-resolve newer \
        --conflict-loser num \
        --resilient

    local status=$?

    if [ $status -ne 0 ]; then
        echo "Bisync aborted with exit code $status. Attempting automatic --resync..."
        rclone bisync "$LOCAL_PATH" "$REMOTE_PATH" \
            --exclude-from "$EXCLUDE_FILE" \
            --workdir "$WORKDIR" \
            --resync \
            --conflict-resolve newer \
            --conflict-loser num
    fi
}

while true; do
    do_sync
    inotifywait -t 600 -r -e modify,create,delete,move "$LOCAL_PATH"
    if [ $? -eq 0 ]; then
        sleep 5
    fi
done
