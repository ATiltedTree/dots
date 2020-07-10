call plug#begin(stdpath('data') . '/plugged')

Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer --rust-completer --ts-completer --system-boost' }
Plug 'sheerun/vim-polyglot'
Plug 'chiel92/vim-autoformat'
Plug 'scrooloose/syntastic'
Plug 'rust-lang/rust.vim'

call plug#end()

let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }

let g:blamer_enabled = 1

let g:loaded_python_provider = 0

set termguicolors
set expandtab
set shiftwidth=2
set list
set cursorline
set number
set signcolumn=yes
set filetype=on
set spell spelllang=en_us
set spellcapcheck=""
set mouse=nvi

colorscheme onedark
