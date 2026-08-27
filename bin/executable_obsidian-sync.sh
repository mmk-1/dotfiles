#!/bin/bash
LOCAL_PATH="$HOME/obsidian"
REMOTE_PATH="koofr:obsidian"
EXCLUDE_FILE="$HOME/.config/rclone/obsidian-ignore.txt"
WORKDIR="$HOME/.local/share/rclone/bisync-obsidian"
LOCKFILE="/tmp/obsidian_bisync.lock"

mkdir -p "$WORKDIR"

do_sync() {
    # Prevent concurrent runs
    exec 200>"$LOCKFILE"
    flock -n 200 || { echo "Sync already in progress. Skipping."; return 0; }

    # Connectivity check
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
        echo "Bisync failed with exit code $status. Manual intervention required." >&2
        if command -v notify-send &>/dev/null; then
            notify-send -u critical "Obsidian Sync Error" "Bisync exited with code $status. Sync halted to prevent data loss."
        fi
        return $status
    fi
}

while true; do
    do_sync
    # Wait for filesystem events, ignoring internal trash and temp directories
    inotifywait -t 600 -r -q \
        --exclude "(\.trash|\.obsidian/workspace)" \
        -e modify,create,delete,move "$LOCAL_PATH"
    
    # Debounce burst writes from Obsidian
    sleep 5
done
