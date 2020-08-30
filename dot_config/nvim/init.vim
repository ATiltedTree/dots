if !filereadable(stdpath('data') . '/site/autoload/plug.vim')
  echo "Installing Plug..."
  echo ""
  silent !\curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  autocmd VimEnter * PlugInstall
endif

call plug#begin(stdpath('data') . '/plugged')

" colorscheme
Plug 'arcticicestudio/nord-vim'

" Nice status line
Plug 'vim-airline/vim-airline'

" Language pack
Plug 'sheerun/vim-polyglot'

" Save as sudo
Plug 'lambdalisue/suda.vim'

" Good Icons
Plug 'ryanoasis/vim-devicons'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/nerdfont.vim'

" Dir tree on side
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }

" Git
Plug 'jreybert/vimagit'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fix neovim bug
Plug 'antoinemadec/FixCursorHold.nvim'

" Auto bracket closing
Plug 'jiangmiao/auto-pairs'

" Rainbow brackets
Plug 'luochen1990/rainbow'

" Debugging
Plug 'puremourning/vimspector'

" Clap
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

" TodoIst
Plug 'romgrk/todoist.vim', { 'do': ':TodoistInstall' }

" Nice start screen
Plug 'mhinz/vim-startify'

call plug#end()

let g:airline_theme='nord'
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

let g:loaded_python_provider = 0

let g:vimspector_enable_mappings = 'HUMAN'

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_strikethrough = 1


set conceallevel=2
set termguicolors
set expandtab
set shiftwidth=2
set cursorline
set number
set signcolumn=yes
set spell spelllang=en_us
set mouse=nvi
set guifont=Fira\ Code:h10
set updatetime=500

filetype on
colorscheme nord

" Disable spellcheck in terminal mode
autocmd TermOpen * setlocal spell spelllang=

" Setup clipboard
set clipboard=unnamedplus

" Fern Setup
map <C-n> :Fern -drawer .<CR>
let g:fern#renderer = "nerdfont"


" Brackets
let g:rainbow_active = 1

let g:rainbow_conf = {
  \    'separately': {
  \       'nerdtree': 0
  \    }
  \}

" NerdFonts
augroup my-glyph-palette
  autocmd! *
  autocmd FileType nerdtree,startify,fern call glyph_palette#apply()
augroup END

" COC
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call CocActionAsync('doHover')<cr>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>af  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
autocmd BufWritePre *.* :Format

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufWritePre *.* :OR

" TodoIst
let clap_provider_todoist = {
  \ 'source': {-> Todoist__listProjects()},
  \ 'sink': 'Todoist',
  \}
