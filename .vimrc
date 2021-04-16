set nocompatible

call plug#begin()

Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'RRethy/vim-hexokinase'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'vimsence/vimsence'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

colorscheme desert

let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline
let g:airline#extensions#tabline#tabs_label = 'Tabs'      " can put text here like TABS to denote tabs (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = 'Buffers'   " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right
let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline
let g:airline#extensions#tabline#show_splits = 1       " disables the buffer name that displays on the right of the tabline
let g:airline#extensions#tabline#show_tab_nr = 1       " disable tab numbers
let g:airline#extensions#tabline#show_tab_type = 1     " disables the weird ornage arrow on the tabline
let g:airline#extensions#tabline#buff_label_first = 1

let g:ctrlp_working_path_mode = 'ra'


"" General
set number	" Show line numbers
set relativenumber
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++ 	" Wrap-broken line prefix
set showmatch	" Highlight matching brace
set showcmd
set noshowmode " Already in airline
set timeoutlen=800 " Time to complete keybindings
set ttimeoutlen=10 " Time to wait for terminal escape sequences
set visualbell	" Use visual bell (no beeping)
set hlsearch	" Highlight all search results
set incsearch	" Searches for strings incrementally
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
"set termguicolors
"set cursorline cursorcolumn

set path+=**

set autoindent	" Auto-indent new lines
set expandtab	" Use spaces instead of tabs
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set tabstop=4
set softtabstop=4	" Number of spaces per Tab

set ruler	" Show row and column ruler information

set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start
set hidden

set mouse=a

set magic
set title
set wildmenu
set wildmode=longest,list,full
set wildchar=<TAB>

set guifont=FiraCode\ Nerd\ Font
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set splitbelow splitright

syntax enable

map <Space> <Nop>
let mapleader = "\<Space>"


map <silent> <leader>n :NERDTreeToggle<return>

map <leader>wc <C-w>c
map <leader>ws <C-w>s
map <leader>wv <C-w>v
map <leader>wh <C-w>h
map <leader>wj <C-w>j
map <leader>wk <C-w>k
map <leader>wl <C-w>l
map <leader>wq :wq<return>

map <leader>fw :w<return>

map <leader>bn :bn<return>
map gb :bn<return>
map <leader>bp :bp<return>
map <leader>bd :bd<return>
map <leader>be :e<space>
map <silent> <leader>b. :CtrlPBuffer<return>
map <silent> <leader>e. :CtrlPMixed<return>
let g:ctrlp_map = "<leader>."

inoremap jj <ESC>
nnoremap <ESC>^[ <ESC>^[
nnoremap <silent> <ESC>  <ESC>:noh<return>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

command! W execute 'write !sudo tee % > /dev/null' <bar> edit!
command! Wq execute 'write !sudo tee % > /dev/null' <bar> q!

command! Trim %s/\s\+$//ge

augroup vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC | AirlineRefresh
    autocmd BufWritePre * Trim
    autocmd InsertEnter * set norelativenumber
    autocmd InsertLeave * set relativenumber
augroup end
