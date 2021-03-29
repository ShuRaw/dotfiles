" SimplyFold
let g:SimpylFold_docstring_preview = 0
let g:AutoPairsWildClosedPair = ''

" PyDocstring
nmap <silent> <C-_> <Plug>(pydocstring)
let g:pydocstring_formatter = 'google'

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
nnoremap <silent> <Leader>f :Files<CR>
noremap <leader>gc :GCheckout<CR>

let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
