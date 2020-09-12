lua require('init')

" Term
augroup terminal
  autocmd!
  autocmd TermOpen * setlocal nospell
augroup END

" Fern Setup
augroup fern-custom
  autocmd!
  autocmd FileType fern call s:init_fern()
augroup END

function! s:init_fern() abort
  nmap <buffer><expr>
      \ <Plug>(fern-my-expand-or-collapse)
      \ fern#smart#leaf(
      \   "\<Plug>(fern-action-collapse)",
      \   "\<Plug>(fern-action-expand)",
      \   "\<Plug>(fern-action-collapse)",
      \ )

  nmap <buffer><expr>
      \ <Plug>(fern-my-open-or-expand-or-collapse)
      \ fern#smart#leaf(
      \   "\<Plug>(fern-action-open)",
      \   "\<Plug>(fern-my-expand-or-collapse)",
      \   "\<Plug>(fern-action-collapse)",
      \ )

  nmap <buffer><nowait> <CR>          <Plug>(fern-my-open-or-expand-or-collapse)
  nmap <buffer><nowait> <2-LeftMouse> <Plug>(fern-my-open-or-expand-or-collapse)
endfunction

" NerdFonts
augroup my-glyph-palette
  autocmd!
  autocmd FileType startify,fern,airline call glyph_palette#apply()
augroup END

