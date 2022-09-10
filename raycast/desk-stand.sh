#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Stand
# @raycast.mode silent
# @raycast.icon 🔺
# @raycast.packageName Desk

osascript \
    -e 'tell application "Desk Controller"' \
    -e 'move to "125cm"' \
    -e 'end tell'
