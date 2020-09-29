let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['pylint', 'flake8']
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier_eslint', 'importjs'],
\   'typescript': ['eslint'],
\   'vue': ['prettier'],
\   'css': ['stylelint'],
\   'python': ['add_blank_lines_for_python_control_statements', 'autopep8', 'isort', 'yapf'],
\}

" let g:ale_fix_on_save = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_typescript_prettier_use_local_config = 1
let g:ale_completion_enabled = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:jsx_ext_required = 0
