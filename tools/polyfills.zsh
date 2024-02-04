# Some commands I got used to on macOS, made for Linux.
# The snippet I found included Windows so why not.

# When not on macOS...
if [ ! $(uname -s) = 'Darwin' ]; then
  if grep -q Microsoft /proc/version; then
  # All the windows stuff
  alias open='explorer.exe';
 else
    # All the linux stuff
  alias open='xdg-open';
  alias pbcopy='xclip -in'
  alias pbpaste='xclip -out'
 fi
fi
