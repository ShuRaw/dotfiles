if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
let g:ycm_semantic_triggers['vue'] = ['.']
let g:ycm_semantic_triggers['python'] = ['.']
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

:py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(open(activate_this).read(), {'__file__':activate_this})
EOF
