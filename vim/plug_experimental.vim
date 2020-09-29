" SimplyFold
let g:SimpylFold_docstring_preview = 1

" PyDocstring
nmap <silent> <C-_> <Plug>(pydocstring)
let g:pydocstring_formatter = 'google'

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
noremap <leader>gc :GCheckout<CR>

