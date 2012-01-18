" Behave in a more useful way
set nocompatible

" Needed for some Linux distros (like Ubuntu)
filetype off

" Package bundling using pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Specify a color scheme
set background=dark
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

" Formatting
" -r
set formatprg=par\ -re

" Ignore files
set wildignore+=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.gif,*.xpm

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Miscellaneous
set ruler           " add a ruler to the bottom
set showcmd         " show (partial) command in status line
set showmatch       " show matching brackets
set autoread        " automatically read file changes outside of vim
set wildmenu        " show menu when auto completing
set nostartofline   " don't jump to first character when paging
set cursorline      " highlight the current line
set laststatus=2    " always show the statusline

" Disable backup files
set nobackup
set noswapfile

if has("autocmd")
  " au is short for autocmd
  
  " Restore cursor position
  autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

  " Change statusline color in insert mode
  autocmd InsertEnter * highlight StatusLine ctermfg=2 ctermbg=2
  autocmd InsertLeave * highlight StatusLine ctermfg=4 ctermbg=7

  " Change statusline color of active window
  autocmd VimEnter * highlight StatusLine term=reverse ctermfg=4 ctermbg=7 gui=bold,reverse

  " Set warning of over column 80
  autocmd BufWinEnter * let w:m1=matchadd('Error', '\%>80v.\+', -1)

  " If files have changed outside of Vim, update NERDTree and CommandT when
  " Vim gains focus.
  " NOTE: FocusGained only works for GUI versions of Vim, like gvim. Should
  " probably move this to gvimrc.
  " NOTE: CommandT is no longer used. Leaving for historical purposes.
  autocmd FocusGained * call s:UpdateNERDTree()
  "autocmd FocusGained * call s:UpdateCommandT()

  " Set Filetypes
  autocmd BufNewFile,BufRead *.less setfiletype css
  autocmd BufNewFile,BufRead *.liquid setfiletype liquid

  " Filetypes
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2
  autocmd FileType helpfile setlocal nonumber      " no line numbers when viewing help
  autocmd FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
  autocmd FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back
endif

" Set the mapleader
let mapleader = ","

" DelimitMate
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
let delimitMate_balance_matchpairs = 1
" DelimitMate override of SnipMate's S-Tab
imap <S-Tab> <Plug>delimitMateS-Tab

"
" MAPPINGS
"

" .vimrc
map <leader>v :vsp ~/.vimrc<cr>    " edit my .vimrc file in a vertical split
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

" Enable the matchit plugin for selecting blocks.
" This is required by textobj-rubyblock.
runtime macros/matchit.vim

" Gundo
nnoremap <F5> :GundoToggle<CR>

" CtrlP
let g:ctrlp_map = '<leader>t'
let g:ctrlp_working_path_mode = 2

"
" Functions
"

" Update NERDTree.
function s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif
endfunction

" NOTE: CommandT is no longer used. Leaving for historical purposes.
" Update CommandT.
"function s:UpdateCommandT(...)
  "if exists(":CommandTFlush") == 2
    "CommandTFlush
  "endif
"endfunction

" Use Node.js for JavaScript Interpretation 
" Please refer https://github.com/hallettj/jslint.vim/issues/13 
let $JS_CMD='node'
