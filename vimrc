" Behave in a more useful way
set nocompatible

" Package bundling using pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Specify a color scheme
colorscheme molokai
set background=dark

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

" Ignore files
set wildignore+=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.gif,*.xpm

" Miscellaneous
set showcmd         " show (partial) command in status line
set showmatch       " show matching brackets
set autoread        " automatically read file changes outside of vim
set wildmenu        " show menu when auto completing
set ruler           " add a ruler to the bottom

" Set warning of over column 80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Disable backup files
set nobackup
set noswapfile

" Toggle paste mode
set pastetoggle=<F2>

" Set the mapleader
let mapleader = ","

" Ctrl-N to disable search match highlight
" Note: C-N was the same as k (move to next line ) 
nmap <silent> <C-N> :silent noh<CR>

" Ctrl-P to Display the file browser tree
" Note: C-P was the same as j (move to previous line)
nmap <C-P> :NERDTreeToggle<CR>
" ,p to show current file in the tree
nmap <leader>p :NERDTreeFind<CR>

" ,/ to invert comment on the current line/selection
nmap <leader>/ :call NERDComment(0, "invert")<cr>
vmap <leader>/ :call NERDComment(0, "invert")<cr>
