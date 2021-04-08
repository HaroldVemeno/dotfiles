set nocompatible

call plug#begin()

Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'RRethy/vim-hexokinase'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons' 
Plug 'vim-syntastic/syntastic'
Plug 'ycm-core/youcompleteme' 

call plug#end()

let g:ymc_language_server =
\ [
\   {
\     'name': 'haskell', 
\     'cmdline': [ 'haskell-language-server-wrapper', '--lsp'], 
\     'rootPatterns': ['*.cabal', 'stack.yaml', 'cabal.project', 'package.yaml', "hie.yaml"],
\     'filetypes': [ 'haskell', 'lhaskell' ] 
\   }
\ ]

"" General
set number	" Show line numbers
set relativenumber	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++ 	" Wrap-broken line prefix
set showmatch	" Highlight matching brace
set showcmd
set noshowmode
set visualbell	" Use visual bell (no beeping)
set hlsearch	" Highlight all search results
set incsearch	" Searches for strings incrementally
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set path+=**
 
set autoindent	" Auto-indent new lines
set expandtab	" Use spaces instead of tabs
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set tabstop=4
set softtabstop=4	" Number of spaces per Tab
 
"" Advanced
set ruler	" Show row and column ruler information
 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start

set mouse=a

set magic
set title
set wildmenu
set wildchar=<TAB>

set guifont="FiraCode Nerd Font"
colorscheme desert
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

syntax enable

map <Space> <Nop>
let mapleader = "<Space>"

map <C-n> :NERDTreeToggle<CR>
inoremap jj <ESC>
nnoremap <ESC> <ESC>:noh<return>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

command W   write ! sudo tee "%" > /dev/null
command Wq  execute 'write ! sudo tee % > /dev/null' <bar> q!
