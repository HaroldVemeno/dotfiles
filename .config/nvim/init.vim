

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

call plug#begin()

Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase'}
Plug 'vimsence/vimsence'
Plug 'navarasu/onedark.nvim'
Plug 'neovimhaskell/haskell-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'qpkorr/vim-renamer'
Plug 'whonore/Coqtail'
"Plug 'preservim/nerdtree'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'ryanoasis/vim-devicons'
"Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': ':CocUpdate'}
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'edkolev/tmuxline.vim'
"Plug 'mattn/emmet-vim'

call plug#end()

let g:onedark_config = { 'style': 'cool' }

colorscheme onedark

filetype plugin on
filetype indent on

let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_min_count = 2
" remove 'X' at the end of the tabline
let g:airline#extensions#tabline#show_close_button = 0
" can put text here like TABS to denote tabs (I clear it so nothing is shown)
let g:airline#extensions#tabline#tabs_label = 'Tabs'
" can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = 'Buffers'
" dont show tab numbers on the right
let g:airline#extensions#tabline#show_tab_count = 0
" minimum of 2 tabs needed to display the tabline
let g:airline#extensions#tabline#tab_min_count = 2
" disables the buffer name that displays on the right of the tabline
let g:airline#extensions#tabline#show_splits = 1
" disable tab numbers
let g:airline#extensions#tabline#show_tab_nr = 1
" disables the weird ornage arrow on the tabline
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#buff_label_first = 1

"let g:ctrlp_working_path_mode = 'ra'
let g:Hexokinase_highlighters = ['backgroundfull']

let g:airline#extensions#tmuxline#enabled = 1

" haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

"" Visual things
set number	" Show line numbers
set relativenumber
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set showmatch	" Highlight matching brace
set showcmd
set noshowmode " Already in airline
set listchars=space:.,eol:$,tab:>-,trail:~,extends:>,precedes:<
set ruler	" Show row and column ruler information
set splitbelow splitright
set undolevels=1000	" Number of undo levels
set cursorline
set cursorcolumn

"" Search
set magic
set hlsearch	" Highlight all search results
set incsearch	" Searches for strings incrementally
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive

""Indentation
set autoindent	" Auto-indent new lines
set expandtab	" Use spaces instead of tabs
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set tabstop=4
set softtabstop=4	" Number of spaces per Tab
set backspace=indent,eol,start

""Terminal things
set ttyfast
set timeoutlen=800 " Time to complete keybindings
set ttimeoutlen=10 " Time to wait for terminal escape sequences
set visualbell	" Use visual bell (no beeping)
set mouse=a
set hidden
set title

""Completion (in command mode)
set path+=**
set wildmenu
set wildmode=longest,list,full
set wildchar=<TAB>

"set guifont=FiraCode\ Nerd\ Font
"set guioptions-=m  "remove menu bar
"set guioptions-=T  "remove toolbar
"set guioptions-=r  "remove right-hand scroll bar
"set guioptions-=L  "remove left-hand scroll bar

syntax enable

nnoremap <ESC>^[ <ESC>^[
inoremap          jk    <ESC>
nnoremap <silent> <ESC> <ESC>:noh<return>

nnoremap Y y$

"map <silent> <leader>n :NERDTreeToggle<return>
"let g:ctrlp_map = "<leader>."

command! W  execute 'write !sudo tee % > /dev/null' <bar> edit!
command! Wq execute 'write !sudo tee % > /dev/null' <bar> q!

command! Yq %y+ <bar> q!
cnoreabbrev yq Yq

map <Space> <Nop>
let mapleader = "\<Space>"

map          <leader>wc <C-w>c
map          <leader>wd <C-w>c
map          <leader>ws <C-w>s
map          <leader>wv <C-w>v
map          <leader>wh <C-w>h
map          <leader>wj <C-w>j
map          <leader>wk <C-w>k
map          <leader>wl <C-w>l

map <silent> <A-j> <Plug>CoqNext
map <silent> <A-k> <Plug>CoqUndo
map <silent> <A-l> <Plug>CoqToLine
imap <silent> <A-j> <Plug>CoqNext
imap <silent> <A-k> <Plug>CoqUndo
imap <silent> <A-l> <Plug>CoqToLine

map <silent> <leader>fs :update<return>

map <silent> <leader>b  :b<return>
map <silent> <leader>]  :bnext<return>
map <silent> <leader>[  :bprevious<return>
map <silent> <leader>d  :bdelete<return>
map          <leader>e  :edit<space>
map <silent> <leader>s  :update<return>
map <silent> <leader>S  :W<return>
map <silent> <leader>y  "+y
map <silent> <leader>Y  "+Y
map <silent> <leader>p  "+p
map <silent> <leader>P  "+P

"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

command! Trim %s/\s\+$//ge

augroup vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC | AirlineRefresh
    autocmd BufWritePre * Trim
    autocmd InsertEnter * set norelativenumber
    autocmd InsertLeave * set relativenumber

    autocmd FileType python map <buffer> <leader>mx :!python %<return>
    autocmd FileType python map <buffer> <leader>mm :!python -m mypy %<return>
    autocmd FileType python map <buffer> <leader>me :!python -m edulint %<return>
augroup end

"hi CursorLine   cterm=NONE term=NONE ctermbg=238 guibg=black
"hi LineNr guifg=yellow
"hi CursorLineNr cterm=NONE term=reverse ctermbg=240 guibg=black guifg=red
"hi CursorColumn cterm=NONE term=NONE ctermbg=237 guibg=black
" trasparency fix
hi Normal ctermbg=NONE guibg=NONE
hi NonText ctermbg=NONE guibg=NONE
hi Folded ctermbg=NONE guibg=NONE
hi LineNr ctermbg=NONE guibg=NONE guifg=#306bb9
hi EndOfBuffer ctermbg=NONE guibg=NONE



" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexmk'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = "\<Space>"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

lua << EOF
require'nvim-treesitter.configs'.setup {
  auto_install = true,
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require'lspconfig'.clangd.setup{}
require'lspconfig'.hls.setup{}
require'lspconfig'.rust_analyzer.setup{}


local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = { 'src/parser.c', 'src/scanner.cc' },
  },
  filetype = 'org',
}

EOF
