#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Home Mode
# @raycast.mode silent
# @raycast.icon 🏡
# @raycast.packageName Modes

/Applications/Firefox.app/Contents/MacOS/firefox \
  --setDefaultBrowser \
  --new-tab https://seblog.nl

osascript ~/dotfiles/applescripts/hider.scpt "Firefox Developer Edition"
osascript ~/dotfiles/applescripts/shower.scpt "Firefox"

osascript ~/dotfiles/applescripts/desktop.scpt "/System/Library/Desktop Pictures/Solid Colors/Blue Violet.png"

echo "Enabled Home Mode"
