nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeFocus <CR>

nnoremap  <leader>n :tabnew<CR>
let g:NERDTreeIgnore = ['^.git$', 'node_modules']
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusConcealBrackets = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'M',
                \ 'Staged'    :'S',
                \ 'Untracked' :'U',
                \ 'Renamed'   :'R',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'D',
                \ 'Dirty'     :'⬤',
                \ 'Ignored'   :'I',
                \ 'Clean'     :'✔',
                \ 'Unknown'   :'?',
\ }
