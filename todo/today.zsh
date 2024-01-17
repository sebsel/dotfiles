NOTES_PATH="$HOME/notes"
TODAYS_NOTES="$NOTES_PATH/`date +%Y-%m-%d`.txt"

# Create the file if it does not yet exist
if [ ! -f $TODAYS_NOTES ]; then
    echo "# `date +'%Y-%m-%d'`" > $TODAYS_NOTES
fi

# If there are notes in the arguments of this script...
if [ -n "$*" ]; then
    # ... add them to the end of the first paragraph and exit,
    nvim +"normal gg}0" +"normal o- $*" +"x" $TODAYS_NOTES
else
    # else just open Vim on that place.
    nvim +"normal gg}0j" $TODAYS_NOTES
    # note when copying: there is a <backspace> char between } and 0
    # in my config, vim then goes back to the previous line
fi

