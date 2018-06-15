# Dotfiles

These are dotfiles. 

I use `scripts/install.zsh` to set it up, create symlinks and what not. Some configs still live somewhere else, so I might use more things than you see here.


## Some highlights

First, I got a little script that lives in `todo/` and is called `today`. It creates a file in `~/notes/` with the current date as filename, adds the date (in Dutch locale for me) and opens it in Vim. It can also be used as `today I did this` or `today 'some text?'` to append text to today's file with a markdown bullet. There is also a `now` command which adds a time; great for logging.

I also like my `git-init` command, which does the initial commit for me as well. Nice in combination with `laravel new x`. Oh and I use `logs` a lot. (See `laravel/aliases.zsh`)


## Wishlist / todo

- clean out Vim plugins (I want more minimalist and vanilla)
- macOS settings in `macos/settings.sh` (let's wait for a new laptop to occur)
- how well do Sublime plugins work with this? (using Vim and PHPStorm more anyway)
- some way to get a subset of these files to a server (vimrc? tmux mappings?)

