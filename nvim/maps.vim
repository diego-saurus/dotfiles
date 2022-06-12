inoremap jj <Esc>
" inoremap <expr> <Tab> search('\%#[]>)}]', 'n') ? '<Right>' : '<Tab>'
nnoremap <C-h> :bp <CR>
nnoremap <C-l> :bn <CR>
nnoremap <C-c> :bd <CR>
nnoremap <silent> <C-p> :GFiles<CR>

" Prettier CocCommand
command! -nargs=0 Prettier :CocCommand prettier.formatFile
