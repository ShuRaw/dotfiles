lua require('local_config_telescope')
nnoremap <c-p> :lua require('telescope.builtin').git_files({})<CR>
nnoremap <c-p>f :lua require('telescope.builtin').find_files({})<CR>
nnoremap <c-p>c :lua require('local_config_telescope').cur_buff()<CR>
nnoremap <c-p>b :lua require('telescope.builtin').buffers({})<CR>
nnoremap <c-p>g :lua require('telescope.builtin').live_grep({})<CR>
nnoremap <c-p>h :lua require('telescope.builtin').git_commits({})<CR>
nnoremap <c-p>r :lua package.loaded.local_config_telescope=nil<CR>:source ~/.config/nvim/init.vim<CR>
