if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
let g:ycm_semantic_triggers['vue'] = ['.']
let g:ycm_semantic_triggers['python'] = ['.']
let g:ycm_semantic_triggers['css'] = ['']
let g:ycm_semantic_triggers['scss'] = ['']
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>gf :YcmCompleter GoToDefinition<CR>
