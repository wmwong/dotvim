" Behave in a more useful way
set nocompatible

" Needed for some Linux distros (like Ubuntu)
filetype off

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
set ruler           " add a ruler to the bottom
set showcmd         " show (partial) command in status line
set showmatch       " show matching brackets
set autoread        " automatically read file changes outside of vim
set wildmenu        " show menu when auto completing
set nostartofline   " don't jump to first character when paging

" Set warning of over column 80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Disable backup files
set nobackup
set noswapfile

if has("autocmd")
  " au is short for autocmd
  
  " Restore cursor position
  au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

  " Filetypes (au = autocmd)
  au FileType helpfile set nonumber      " no line numbers when viewing help
  au FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
  au FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back
endif

" Set the mapleader
let mapleader = ","

"
" MAPPINGS
"

" .vimrc
map <leader>v :vsp ~/.vimrc<cr>    " edit my .vimrc file in a vertical split
map <leader>e :e ~/.vimrc<cr>      " edit my .vimrc file
map <leader>u :source ~/.vimrc<cr> " update the system settings from my .vimrc file

" Toggle paste mode
set pastetoggle=<F2>

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

" Navigate splits without having to prepend with C-w
map <C-h> <C-w>h
map <C-k> <C-w>k
map <C-j> <C-w>j
map <C-l> <C-w>l

" Bubble single lines (uses unimpaired)
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines (uses unimpaired)
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Sessions
nmap <leader>s :SessionList<CR>
nmap <leader>ss :SessionSave<CR>
nmap <leader>sa :SessionSaveAs<CR>
