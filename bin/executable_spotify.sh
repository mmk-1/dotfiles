#!/usr/bin/env bash

TITLE=$(playerctl -p spotify metadata title 2>/dev/null)
ARTIST=$(playerctl -p spotify metadata artist 2>/dev/null)

if [ -n "$TITLE" ]; then
    echo "{\"text\": \"$TITLE\", \"tooltip\": \"$TITLE - $ARTIST\"}"
else
    echo "{\"text\": \"No music\", \"tooltip\": \"Spotify not playing\"}"
fi

