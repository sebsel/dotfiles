"-> Vundle requires these options
set nocompatible
filetype off

"-> Start Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'



"==> Obligatory tpope plugins

"-> Use - for fast file browsing and more
Plugin 'tpope/vim-vinegar'

"-> Adds quick ways to comment stuff out
Plugin 'tpope/vim-commentary'

"-> Change the surrounding quotes and more
Plugin 'tpope/vim-surround'

"-> Use Ctrl+A and Ctrl+X to increment and decrement dates
Plugin 'tpope/vim-speeddating'



"==> Integrations

"-> Use Git from within Vim
Plugin 'tpope/vim-fugitive'

"-> Use Ctrl+H,J,K,L to switch between spits, both Vim splits
"   and tmux splits. (It is magic but feels so natural.)
Plugin 'christoomey/vim-tmux-navigator'



"==> Files and navigations

"-> For if you can't remember where you wanted to go, but also
"   don't want to think about it too hard.
Plugin 'scrooloose/nerdtree'

"-> Fuzzy search; I want to be hipster and don't use it, but I like it
"   from time to time, so I mapped it to LeaderP and be done with it.
Plugin 'ctrlpvim/ctrlp.vim'



"==> Search and replace

"-> Search fast
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'



"==> PHP stuff


"==> Unsorted Plugins
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'SirVer/ultisnips'
Plugin 'StanAngeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ervandew/supertab'
Plugin 'garbas/vim-snipmate'
"Plugin 'joestelmach/lint.vim'
Plugin 'mattn/emmet-vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'tobyS/pdv'
Plugin 'tobyS/vmustache'
Plugin 'tomtom/tlib_vim'

"-> End Vundle
call vundle#end()
filetype plugin indent on 

