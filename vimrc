"Behave in a more useful way
set nocompatible

" Needed for some Linux distros
filetype off

" Package bundling using pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Specify a color scheme
colorscheme molokai

" Turn on highlighting
syntax on

" Deal with tabs and indentation nicely
filetype plugin indent on
set tabstop=2       " spaces a tab takes up
set smarttab        " smart tabbing for autoindent
set shiftwidth=2    " spaces to use when using spaces for tabs
set expandtab       " expand tabs into spaces
set autoindent      " autoindenting on

" Search
set hlsearch        " highlight matches
set incsearch       " search while typing
set ignorecase      " case insensitive search
set smartcase       " case insensitive when lower case, else case sensitive

" Line numbers
set number

" Set warning of over column 80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Disable backup files
set nobackup
set noswapfile

" Toggle paste mode
set pastetoggle=<F2>
