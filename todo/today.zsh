
NOTES_PATH="$HOME/notes"
TODAYS_NOTES="$NOTES_PATH/`date +%Y-%m-%d`.txt"

# Create the file if it does not yet exist
if [ ! -f $TODAYS_NOTES ]; then
    echo "# `date +'%A %e %B %Y'`" > $TODAYS_NOTES
fi

# If there are notes, add them to today, else just open Vim
if [ -n "$*" ]; then
    echo "- $*" >> $TODAYS_NOTES
else
    vim +"normal G $" $TODAYS_NOTES
fi

