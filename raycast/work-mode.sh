#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Work Mode
# @raycast.mode silent
# @raycast.icon 🏢
# @raycast.packageName Modes

/Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox \
  --setDefaultBrowser \
  --new-tab https://sneakerdistrict.com

osascript ~/dotfiles/applescripts/shower.scpt "Firefox Developer Edition"
osascript ~/dotfiles/applescripts/hider.scpt "Firefox"

osascript ~/dotfiles/applescripts/desktop.scpt "/System/Library/Desktop Pictures/Chroma Red.heic"

open -a "Desk Controller"

echo "Enabled Work Mode"
