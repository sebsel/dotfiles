on run argv

    set programName to item 1 of argv

    tell application "Finder"
        set visible of process programName to false
    end tell

end run
