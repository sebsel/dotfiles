on run argv

    set filename to item 1 of argv

    tell application "System Events"
        repeat with theDesktop in desktops
            set picture of theDesktop to filename
        end repeat
    end tell

end run
