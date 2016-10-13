" Kolton Andrus
" .vimrc

syntax enable

colorscheme darkblue 
set background=dark

"" Execute Pathogen
execute pathogen#infect()

"" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Height of the command bar
set cmdheight=2

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

"" Rust
set hidden
let g:racer_cmd = "/Users/kolton/.cargo/bin/racer"
let g:racer_experimental_completer = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set ruler

" Autoformat rust files on save
"let g:rustfmt_autosave = 1

" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Misc
" Add a bit extra margin to the left
set foldcolumn=1

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nmap <C-n> :NERDTreeToggle<CR>

" Map ctrl-s to save
nmap <c-s> :w<cr>
imap <c-s> <esc>:w<cr>

" Map ctrl-w to close current buffer
" Window movement prevents this, need to find a better way
"nmap <C-w> :bdelete<cr>

" Map ctrl-q to close the current window
nmap <C-q> :q!<kEnter>

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set mat=2

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
"set laststatus=2

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
"nmap <M-j> mz:m+<cr>`z
"nmap <M-k> mz:m-2<cr>`z
"vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
"
"if has("mac") || has("macunix")
"  nmap <D-j> <M-j>
"  nmap <D-k> <M-k>
"  vmap <D-j> <M-j>
"  vmap <D-k> <M-k>
"endif
