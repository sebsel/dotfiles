#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Sit
# @raycast.mode silent
# @raycast.icon 🔻
# @raycast.packageName Desk

osascript \
    -e 'tell application "Desk Controller"' \
    -e 'move to "81cm"' \
    -e 'end tell'
