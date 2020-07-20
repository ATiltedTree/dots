call plug#begin(stdpath('data') . '/plugged')

" colorscheme
Plug 'joshdick/onedark.vim'

" Nice status line
Plug 'vim-airline/vim-airline'

" Git annotations on the left
Plug 'airblade/vim-gitgutter'

" Git blame on the current line
Plug 'APZelos/blamer.nvim'

" Language pack
Plug 'sheerun/vim-polyglot'

" Format all the languages
Plug 'chiel92/vim-autoformat'

call plug#end()

let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0


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

" Disable spellchek in terminal mode
autocmd TermOpen * setlocal spell spelllang=

" Setup clipboard
set clipboard=unnamedplus

" CTRL+C and CTRL+V
noremap <C-c> "+y
noremap <C-v> "+p

" lua require'nvim_lsp'.rust_analyzer.setup({})
